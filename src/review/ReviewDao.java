package review;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.FinalFactory;


public class ReviewDao {
	int size =1025*1024*10;
	String encode="utf-8";
	String sDirectory="C:/Program Files/Apache Software Foundation/Tomcat 8.0/webapps/FinalProject/download/";
	SqlSession sqlSession;
	
	//페이지 분리와 관련된 변수들
	int listSize=4;//한페이지에 표시될 데이터의 갯수
	int blockSize=5; //한블럭에 표시될 페이지의 갯수
	int totSize=0;//검색된 결과의 전체 갯수
	int totPage=0;//전체 페이지 수
	int totBlock=0;//전체 블럭수
	int nowPage=1;//현재 페이지
	int nowBlock=1;//현재블럭
	int startPage=1; //표시될 페이지의 시작번호
	int endPage=0; //표시될 페이지의 끝번호
	int startNo=1;//표시될 데이터의 시작번호
	int endNo=0;//표시될 테이터의 끝번호
			
	public ReviewDao(){
		sqlSession =FinalFactory.getFactory().openSession();
	}
	public ReviewVo fileSave(HttpServletRequest req){
		ReviewVo vo = new ReviewVo();
		try {
			MultipartRequest multi =new MultipartRequest(req, sDirectory,size,encode,new DefaultFileRenamePolicy());
			if(multi.getParameter("serial") !=null){
				vo.setSerial(Integer.parseInt(multi.getParameter("serial")));
			}
			if(multi.getParameter("reviewPage") !=null){
				vo.setReviewPage(Integer.parseInt(multi.getParameter("reviewPage")));
			}if(multi.getParameter("findStr")!=null){				
				vo.setFindStr(multi.getParameter("findStr"));
			}
			vo.setCleans(Integer.parseInt(multi.getParameter("cleans")));
			vo.setService(Integer.parseInt(multi.getParameter("service")));
			vo.setQuality(Integer.parseInt(multi.getParameter("quality")));
			vo.setStore(multi.getParameter("store"));
			vo.setSeasons(multi.getParameter("seasons"));
			vo.setWorker(multi.getParameter("worker"));
			vo.setSubject(multi.getParameter("subject"));
			vo.setContent(multi.getParameter("content"));
			//첨부파일
			Map<String, String> map = new HashMap<String,String>();
			Enumeration<String> e = multi.getFileNames();
			while(e.hasMoreElements()){
				String tag = (String)e.nextElement();
				String value= multi.getOriginalFileName(tag);
				if(value==null) continue;
				String key = multi.getFilesystemName(tag);
				map.put(key, value);
			}
			vo.setAttFile(map);
			//삭제파일
			String[] temp=multi.getParameterValues("deleteAtt");
			vo.setDeleteAtt(temp);
			
		}catch(Exception e){
			e.printStackTrace();
		}
		return vo;
	}
	public void insert(HttpServletRequest req){
		try {
			ReviewVo vo= fileSave(req);
			sqlSession.insert("review.insert",vo);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
		}
	}
	public void pageCompute(ReviewVo vo){
		totSize = sqlSession.selectOne("review.page", vo);
		
		totPage=(int)Math.ceil(totSize/(double)listSize);
		totBlock=(int)Math.ceil(totPage/(double)blockSize);
		nowBlock=(int)Math.ceil(nowPage/(double)blockSize);
		endPage=blockSize*nowBlock;
		startPage=endPage-blockSize+1;
		if(endPage>totPage) endPage=totPage;
		endNo=nowPage*listSize;
		startNo=endNo-listSize+1;
		if(endNo>totSize) endNo=totSize;
	}
	public List<ReviewVo> select(ReviewVo vo,HttpServletRequest req){
		if(req.getParameter("reviewPage")==null){
			vo.setReviewPage(1);	
		}
		if(req.getParameter("findStr")==null){
			vo.setFindStr("");
		}	
		if(req.getParameter("address1")==null){
			vo.setAddress1("");
		}
		if(req.getParameter("address2")==null){
			vo.setAddress2("");
		}
		nowPage= vo.getReviewPage();
		pageCompute(vo);
		vo.setStartNo(startNo);
		vo.setEndNo(endNo);
		List<ReviewVo>list =sqlSession.selectList("review.select",vo);
		for(int i=0; i<list.size(); i++){
			List<String> temp =sqlSession.selectList("review.selectatt",list.get(i).getSerial());
			list.get(i).setAttlist(temp);
		}
		return list;
	}
	public ReviewVo view(ReviewVo vo){
		sqlSession.update("review.updateHit",vo.getSerial());
		sqlSession.commit();
		ReviewVo v= sqlSession.selectOne("review.view",vo.getSerial());
		List<ReviewAttVo> attList = sqlSession.selectList("review.attView",vo.getSerial());
		Map<String,String> map = null;
		if(attList.size()>0){
			map = new HashMap<String,String>();
			for(ReviewAttVo attVo:attList){
				map.put(attVo.getAttFile(), attVo.getOriAttFile());
			}
			v.setAttFile(map);
		}
		v.setFindStr(vo.getFindStr());
		v.setReviewPage(vo.getReviewPage());
		return v;
	}
	public ReviewVo Mview(ReviewVo vo){
		ReviewVo v= sqlSession.selectOne("review.view",vo.getSerial());
		List<ReviewAttVo> attList = sqlSession.selectList("review.attView",vo.getSerial());
		Map<String,String> map = null;
		if(attList.size()>0){
			
		map = new HashMap<String,String>();
		for(ReviewAttVo attVo:attList){
			map.put(attVo.getAttFile(), attVo.getOriAttFile());
		}
		v.setAttFile(map);
		}
		v.setFindStr(vo.getFindStr());
		v.setReviewPage(vo.getReviewPage());
		return v;
	}
	public List<ReviewVo> repl(ReviewVo vo){
		List<ReviewVo> list =sqlSession.selectList("review.replV",vo.getSerial());
		return list;
	}
	public void replI(ReviewVo vo){
		sqlSession.insert("review.replI",vo);
		sqlSession.commit();
	}
	public void replD(ReviewVo vo){
		sqlSession.insert("review.replD",vo.getRserial());
		sqlSession.commit();
	}
	public void delete(int serial){
		try {
			List<ReviewAttVo> attlist =sqlSession.selectList("review.attView",serial);
			for(ReviewAttVo attVo: attlist){
				String f=attVo.getAttFile();
				File file =new File(sDirectory+f);
				if(file.exists()) file.delete();
			}
			sqlSession.delete("review.delete",serial);			
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}
	}
	public ReviewVo modifyR(HttpServletRequest req){
		ReviewVo vo=null;
		try {
			vo= fileSave(req);
			sqlSession.update("review.modify",vo);
			if(vo.getDeleteAtt()!=null){
				for(String delFile: vo.getDeleteAtt()){
					File file = new File(sDirectory+delFile);
					if(file.exists()) file.delete();
					sqlSession.delete("review.attDelete",delFile);
				}
			}
			if(vo.getAttFile()!=null){
				Iterator<String>it = vo.getAttFile().keySet().iterator();
				while(it.hasNext()){
					String key=it.next();
					String value=vo.getAttFile().get(key);
					ReviewAttVo attVo = new ReviewAttVo();
					attVo.setPserial(vo.getSerial());
					attVo.setAttFile(key);
					attVo.setOriAttFile(value);
					sqlSession.insert("review.attInsert",attVo);
				}
			}
			sqlSession.commit();
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		}
		return vo;
	}
	
	public int getListSize() {
		return listSize;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public int getTotSize() {
		return totSize;
	}
	public int getTotPage() {
		return totPage;
	}
	public int getTotBlock() {
		return totBlock;
	}
	public int getNowPage() {
		return nowPage;
	}
	public int getNowBlock() {
		return nowBlock;
	}
	public int getStartPage() {
		return startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public int getStartNo() {
		return startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public void setTotSize(int totSize) {
		this.totSize = totSize;
	}
	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}
	public void setTotBlock(int totBlock) {
		this.totBlock = totBlock;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
}
