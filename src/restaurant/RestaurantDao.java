package restaurant;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.imgscalr.Scalr;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.FinalFactory;





public class RestaurantDao {
	int size=1024*1024*10;
	String encode = "utf-8";
	String sDirectory = "C:/Program Files/Apache Software Foundation/Tomcat 8.0/webapps/FinalProject/restaurant/download/";
	String sDirectory2 = "C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\FinalProject\\restaurant\\download\\";
	String thumbPath = "C:/Program Files/Apache Software Foundation/Tomcat 8.0/webapps/FinalProject/restaurant/thumbnail/";
	
	SqlSession ss;
	
	//페이지 분리와 관련된 변수들
	
	int listSize 	= 6;	// 한 페이지에서 보여줄 데이터 갯수
	int blockSize 	= 4;	// 한 페이지에서 보여줄 블록 갯수
	int totSize 	= 0;	// 검색된 전체 데이터 갯수 
	int totPage 	= 0;	// 검색된 전체 페이지 수	=Math.ceil(totSize/listSize)
	int totBlock 	= 0;	// 검색된 전체 블록 수	=Math.ceil(totPage/blockSize)
	int nowPage 	= 1;	// 현재 페이지 번호
	int nowBlock 	= 1;	// 현재 몇 번째 블록인지 =Math.ceil(nowPage/blockSize)
	int startPage	= 1;	// 한 블록의 시작할 페이지 번호	=endPage-blockSize +1
	int endPage		= 0;	// 한 블록의 마지막 페이지 번호	=blockSize*nowBlock
	int startNo 	= 1;	// 현재 페이지의 데이터 시작 번호 =endNo - listSize +1
	int endNo		= 0;	// 현재 페이지의 데이터 마지막 번호 =nowPage*listSize
		
	
	
	public RestaurantDao() {
		ss = FinalFactory.getFactory().openSession();
	}
	
	
	/*음식점 등록 페이지 */
	
	public void insert(HttpServletRequest req) {
		RestaurantVo 		rvo = new RestaurantVo();
		rvo.setMsg("성공적으로 등록되었습니다.");
		try {
			MultipartRequest multi = new MultipartRequest(req, sDirectory, size, encode, new DefaultFileRenamePolicy());
			if(multi.getParameter("serial") != null) {
				
				rvo.setSerial(Integer.parseInt(multi.getParameter("serial")));
			}
			rvo.setRname(multi.getParameter("rname"));
			rvo.setFindStr(multi.getParameter("findStr"));
			rvo.setMid(multi.getParameter("mid"));
			
			/*사진 첨부 파일 부분*/
			
			
			Map<String, String> map = new HashMap<String, String>();	
			// 음식점 사진 파일 담을 map
			Enumeration<String> e = multi.getFileNames();		// 
			while(e.hasMoreElements()) {
				String tag = (String)e.nextElement();
				String value = multi.getOriginalFileName(tag);
				if(value == null) continue;
				String key = multi.getFilesystemName(tag);
				
				   if(tag.equals("rphoto_main") && key!=null){
		               BufferedImage srcImg = ImageIO.read(new File(sDirectory2 + key));

		               // 썸네일 크기 입니다.
		               int dw = 400, dh = 300;
		               int ow = srcImg.getWidth();
		               int oh = srcImg.getHeight();

		               // 늘어날 길이를 계산하여 패딩합니다.
		               int pd = 0;
		               if (ow > oh) {
		                  pd = (int) (Math.abs((dh * ow / (double) dw) - oh) / 2d);
		               } else {
		                  pd = (int) (Math.abs((dw * oh / (double) dh) - ow) / 2d);
		               }

		               // 이미지 크기가 변경되었으므로 다시 구합니다.
		               ow = srcImg.getWidth();
		               oh = srcImg.getHeight();

		               // 썸네일 비율로 크롭할 크기를 구합니다.
		               int nw = ow;
		               int nh = (ow * dh) / dw;
		               if (nh > oh) {
		                  nw = (oh * dw) / dh;
		                  nh = oh;
		               }

		               // 늘려진 이미지의 중앙을 썸네일 비율로 크롭 합니다.
		               BufferedImage cropImg = Scalr.crop(srcImg, (ow - nw) / 2, (oh - nh) / 2, nw, nh);

		               // 리사이즈(썸네일 생성)
		               BufferedImage destImg = Scalr.resize(cropImg, dw, dh);

		               String thumbName = thumbPath + "thumb_" + key;
		               File thumbFile = new File(thumbName);
		               ImageIO.write(destImg, "png", thumbFile);
		               System.gc();
		            }
		            
		            if(value == null) continue;
				
				map.put(key, tag);					
				
			}
			rvo.setMap(map);
			rvo.setRmName(multi.getParameterValues("rmName"));
			rvo.setRmExplain(multi.getParameterValues("rmExplain"));
			rvo.setRmPrice(multi.getParameterValues("rmPrice"));
			
			/*가게 상세 설명*/
			
			rvo.setRtimeOpen(Integer.parseInt(multi.getParameter("rtimeOpen")));
			rvo.setRtimeClose(Integer.parseInt(multi.getParameter("rtimeClose")));
			rvo.setRholiday(multi.getParameter("rholiday"));
			rvo.setRbathroom(multi.getParameter("rbathroom"));
			rvo.setRdrink(multi.getParameter("rdrink"));
			rvo.setRfacilities(multi.getParameter("rfacilities"));
			rvo.setRmenus(multi.getParameter("rmenus"));
			rvo.setRinfo(multi.getParameter("rinfo"));
			rvo.setRtable(Integer.parseInt(multi.getParameter("rtable")));
			rvo.setRphone(multi.getParameter("rphone"));
			
			/*지도와 주소 부분*/
			String address = multi.getParameter("rjuso");
			
			/*
			int idx = address.indexOf(" ");
			String a = address.substring(0, idx);	// 경기도
			String b = address.substring(idx+1);	// 나머지주소
			String c = b.substring(0, idx);			// 용인시
			*/
			rvo.setRaddress1(multi.getParameter("raddress1"));
			rvo.setRaddress2(multi.getParameter("raddress2"));
			rvo.setRjuso(multi.getParameter("rjuso"));
			
			int r = ss.insert("restaurant.insert", rvo);
			if(r<1) rvo.setMsg("맛집 등록 중 오류 발생");
			ss.commit();
			for(int i =0; i<rvo.getRmName().length;i++) {
				RestaurantMenuVo rmvo =new RestaurantMenuVo();
				rmvo.setRmName(rvo.getRmName()[i]);
				rmvo.setRmExplain(rvo.getRmExplain()[i]);
				rmvo.setRmPrice(rvo.getRmPrice()[i]);
				int r2=ss.insert("restaurant.insert2",rmvo);
				if(r2<1)rvo.setMsg("메뉴저장중 오류 발생");
				ss.commit();
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
			rvo.setMsg("exception 예외 발생");
			ss.rollback();
		}
	}
	
	
	
	/*음식점 목록 List 페이지 */
	
	public void pageCompute(String findStr){ //try문장 안에서 함수 호출해야함
		totSize = ss.selectOne("restaurant.page", findStr);
		
		totPage = (int)Math.ceil(totSize/(double)listSize);		// 전체 페이지 수 
		totBlock = (int)Math.ceil(totPage/(double)blockSize);	// 전체 블럭 수 (페이지 몇개당 한블럭)
		
		nowBlock = (int)Math.ceil(nowPage/(double)blockSize);	// 현재 몇 번째 블럭인지
		
		endPage = blockSize * nowBlock;			// 현재 블럭의 마지막 페이지 번호
		startPage = endPage - blockSize + 1;	// 현재 블럭의 시작 페이지 번호
		
		if(endPage > totPage) endPage = totPage;	// 마지막 블럭의 마지막페이지가 전체 페이지수 보다 크면 보정

		endNo = nowPage * listSize;		// 선택한 페이지에서 보여지는 데이터의 마지막 번호
		startNo = endNo - listSize + 1;	// 선택한 페이지에서 보여지는 데이터의 첫번째 번호

		if(endNo > totSize) endNo = totSize; 
		// jstl을 사용하지 않을경우 공백이 나타나기 때문에 보정해야함
		
	}
	
	
	public List<RestaurantVo> select(RestaurantVo vo){
		List<RestaurantVo> list = new ArrayList<RestaurantVo>();
		
		nowPage = vo.getNowPage();
		pageCompute(vo.getFindStr());		// 페이지 분리 메서드
			
		vo.setStartNo(startNo);
		vo.setEndNo(endNo);
		
		
		if(vo.getOrderBy().equals("조회순")) {
			list = ss.selectList("restaurant.select3", vo);			
		}else if(vo.getOrderBy().equals("등록순")) {
			list = ss.selectList("restaurant.select4", vo);	
		}
		return list;
	}
	
	public List<RestaurantPhotoVo> sel(List<RestaurantVo> list){
		//리스트에서 여러개의 serial을 꺼내서 rvo에 담을 방법 생각하기
		List<RestaurantPhotoVo> photoList = new ArrayList<RestaurantPhotoVo>();
		
		for(int i=0; i<list.size(); i++) {
			RestaurantPhotoVo rpvo = new RestaurantPhotoVo(); 
			rpvo = ss.selectOne("restaurant.sel", list.get(i).getSerial()); 	// 매개변수
			photoList.add(rpvo);
		}

		return photoList;
	}


	
	
	
	
	/*상세보기 View 페이지*/
	
	public RestaurantVo view(RestaurantVo vo) {
		RestaurantVo rvo = ss.selectOne("restaurant.view", vo.getSerial());
		ss.update("updateHitCnt", vo.getSerial());
		ss.commit();
		return rvo;
	}
	
	public List<String> photoView(RestaurantVo vo) {	// 메인사진
		List<String> photoList 
				= ss.selectList("restaurant.photoView",vo.getSerial());
		return photoList;
	}
	
	public List<String> photoView3(RestaurantVo vo) {		//서브사진
		List<String> photoList2 
				= ss.selectList("restaurant.photoView2",vo.getSerial());
	
		return photoList2;
	}
	
	public List<String> photoView2(RestaurantVo vo){
		List<RestaurantPhotoVo> rmAttFileList = new ArrayList<RestaurantPhotoVo>();
		rmAttFileList = ss.selectList("restaurant.photoView3", vo.getSerial());
		Map<String,String> map =new HashMap<String,String>();
		
		for(int i=0;i<rmAttFileList.size();i++) {
			String key = rmAttFileList.get(i).getTagName();
			String value = rmAttFileList.get(i).getRmAttFile();
			map.put(key, value);
		}
		
		List<String> list = new ArrayList<String>();
		for(int i=0; i<map.size(); i++) {
			String temp=map.get("rmAttFile"+i);
			list.add(i, temp);
		}
		
		return list;
	}
	
	public List<RestaurantMenuVo> menuView(RestaurantVo vo){
		List<RestaurantMenuVo> menuList 
				= ss.selectList("restaurant.menuView", vo.getSerial());

		return menuList;
	}
	
	
	
	
	
	
	/*음식점 수정 페이지*/
	
	public RestaurantVo modifyReady(RestaurantVo vo) {
		RestaurantVo rvo = ss.selectOne("restaurant.view", vo.getSerial());
		return rvo;
	}
	
	public void modify(HttpServletRequest req){
		RestaurantVo 		rvo = new RestaurantVo();
		rvo.setMsg("성공적으로 등록되었습니다.");
		
		try {
			MultipartRequest multi = new MultipartRequest(
					req, 
					sDirectory,
					size, 
					encode, 
					new DefaultFileRenamePolicy()
					);
			
			if(multi.getParameter("serial") != null) {
				rvo.setSerial(Integer.parseInt(multi.getParameter("serial")));
			}
			rvo.setRname(multi.getParameter("rname"));
			rvo.setFindStr(multi.getParameter("findStr"));
			rvo.setMid(multi.getParameter("mid"));
			
			
			
			/*rvo.setMap(map);*/
			rvo.setRmName(multi.getParameterValues("rmName"));
			rvo.setRmExplain(multi.getParameterValues("rmExplain"));
			rvo.setRmPrice(multi.getParameterValues("rmPrice"));
			
			/*가게 상세 설명*/
			rvo.setRtimeOpen(Integer.parseInt(multi.getParameter("rtimeOpen")));
			rvo.setRtimeClose(Integer.parseInt(multi.getParameter("rtimeClose")));
			rvo.setRholiday(multi.getParameter("rholiday"));
			rvo.setRbathroom(multi.getParameter("rbathroom"));
			rvo.setRdrink(multi.getParameter("rdrink"));
			rvo.setRfacilities(multi.getParameter("rfacilities"));
			rvo.setRmenus(multi.getParameter("rmenus"));
			rvo.setRinfo(multi.getParameter("rinfo"));
			
			if(multi.getParameter("rhit") != null){				
				rvo.setRhit(Integer.parseInt(multi.getParameter("rhit")));
			}
			if(multi.getParameter("rtable")!=null){
				rvo.setRtable(Integer.parseInt(multi.getParameter("rtable")));				
			}
			System.out.println(rvo.getRtable());
			rvo.setRphone(multi.getParameter("rphone"));
			rvo.setRaddress1(multi.getParameter("raddress1"));
			rvo.setRaddress2(multi.getParameter("raddress2"));
			rvo.setRjuso(multi.getParameter("rjuso"));
	
			//메뉴 지우는 쿼리
			// 원래 입력되어있던 메뉴가 없으면 오류
			ss.delete("restaurant.modifyDelete", rvo.getSerial());
			ss.commit();
			

			
			// 음식점 정보 업데이트 하는 쿼리
			int r2 = ss.update("restaurant.rvoModify", rvo);
			if(r2<1) rvo.setMsg("맛집 수정 후 등록 중 오류 발생");
			ss.commit();
			
			// 새로 입력된 메뉴로 변경하는 부분
			if(rvo.getRmName() != null) {	//	메뉴가 새로 추가되었으면			
				for(int i =0; i<rvo.getRmName().length;i++) {
					RestaurantMenuVo rmvo =new RestaurantMenuVo();
					rmvo.setRmName(rvo.getRmName()[i]);
					rmvo.setRmExplain(rvo.getRmExplain()[i]);
					rmvo.setRmPrice(rvo.getRmPrice()[i]);
					rmvo.setPserial(rvo.getSerial());
					int r3=ss.insert("restaurant.modifyInsert",rmvo);
					if(r3<1)rvo.setMsg("메뉴저장중 오류 발생");
					ss.commit();
				}
			}
			
			/*사진 첨부 파일 부분*/
			Enumeration<String> e = multi.getFileNames();		// 
			while(e.hasMoreElements()) {
				RestaurantPhotoVo rpvo = new RestaurantPhotoVo();
				String tag = (String)e.nextElement();		//태그 이름
				String value = multi.getOriginalFileName(tag);
				if(value == null) continue;
				String key = multi.getFilesystemName(tag);	//파일 이름
				
					
				// 수정할 음식점 사진 파일, 태그 이름 담을 map
				rpvo.setPserial(rvo.getSerial());	//매개변수 조건
				rpvo.setTagName(tag);				//매개변수 조건
				rpvo.setRmAttFile(key);
				
				
				// 기존 사진 파일을 삭제하기 위해서 파일 이름을 가져오는 쿼리 부분
				// 파라미터 : pserial, tag 이름 
				RestaurantPhotoVo deletePhoto = new RestaurantPhotoVo();
				
				// 원래 메뉴에 사진을 변경 하는 경우 
				try {
					deletePhoto = ss.selectOne("restaurant.photoFileDelete2", rpvo);
					
					// 기존 사진 이름을 가져와서 이클립스 폴더에 있는 기존 사진 삭제
					String delFile = deletePhoto.getRmAttFile();	 // 삭제할 파일 이름	
					File file = new File(sDirectory + delFile);
					if(file.exists()) file.delete();
					
					// 기존 사진 tagName과 pserial로 데이터베이스에서 삭제
					int r5 =ss.delete("restaurant.modifyDelete3", rpvo); 
					if(r5<1) rvo.setMsg("맛집 메뉴 정보 삭제 중 오류 발생");
					
					// 태그 이름과 시리얼로 테이블 데이터 업데이트하기
					rpvo.setPserial(rvo.getSerial());
					rpvo.setTagName(tag);
					rpvo.setRmAttFile(key);
					
					// 기존에 있던 메뉴에 새로운 사진으로 수정하는 쿼리
					int r4=ss.update("restaurant.modifyUpdate2", rpvo);
					if(r4<1)rvo.setMsg("사진 수정 중 오류 발생");
					ss.commit();
					
				}catch(Exception ex1) {
					// 원래 메뉴를 지우지 않고 메뉴를 더 추가하는 경우
					
					int r6 = ss.insert("restaurant.modifyInsert3", rpvo);
					if(r6<1) rvo.setMsg("새로운 메뉴 사진 입력 중 오류 발생 ");
					ex1.printStackTrace();
				}
				
				
				
				
				
				if(tag.equals("rphoto_main") && key!=null){
		           BufferedImage srcImg = ImageIO.read(new File(sDirectory2 + key));

		            // 썸네일 크기 입니다.
		            int dw = 400, dh = 300;
		            int ow = srcImg.getWidth();
		            int oh = srcImg.getHeight();

		            // 늘어날 길이를 계산하여 패딩합니다.
		            int pd = 0;
		            if (ow > oh) {
		               pd = (int) (Math.abs((dh * ow / (double) dw) - oh) / 2d);
		            } else {
		               pd = (int) (Math.abs((dw * oh / (double) dh) - ow) / 2d);
		            }

		            // 이미지 크기가 변경되었으므로 다시 구합니다.
		            ow = srcImg.getWidth();
		            oh = srcImg.getHeight();

		            // 썸네일 비율로 크롭할 크기를 구합니다.
		            int nw = ow;
		            int nh = (ow * dh) / dw;
		            if (nh > oh) {
		               nw = (oh * dw) / dh;
		               nh = oh;
		            }

		            // 늘려진 이미지의 중앙을 썸네일 비율로 크롭 합니다.
		            BufferedImage cropImg = Scalr.crop(srcImg, (ow - nw) / 2, (oh - nh) / 2, nw, nh);

		            // 리사이즈(썸네일 생성)
		            BufferedImage destImg = Scalr.resize(cropImg, dw, dh);

		            String thumbName = thumbPath + "thumb_" + key;
		            File thumbFile = new File(thumbName);
		            ImageIO.write(destImg, "png", thumbFile);
		            System.gc();
		        }
		            
		        if(value == null) continue;
				
			}
		
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
			rvo.setMsg("exception 예외 발생");
			ss.rollback();
		}

	}
	
	
	
	public RestaurantVo delete(RestaurantVo vo){
		RestaurantVo rvo = new RestaurantVo();
		
		List<RestaurantPhotoVo> deletePhotoList = new ArrayList<RestaurantPhotoVo>(); 
		deletePhotoList = ss.selectList("restaurant.photoFileDelete", rvo.getSerial());
						
		
		int r = ss.delete("restaurant.modifyDelete", vo.getSerial());
		if(r<1) rvo.setMsg("맛집 메뉴 정보 삭제 중 오류 발생");
		
		int r1 = ss.delete("restaurant.modifyDelete2", vo.getSerial());
		if(r1<1) rvo.setMsg("맛집 사진 삭제 중 오류 발생1");
		
		int r2 = ss.delete("restaurant.delete", vo.getSerial());
		if(r2<1) rvo.setMsg("음식점 정보 삭제 중 오류 발생");
		ss.commit();
		
		return rvo;
	}


	public int getListSize() {
		return listSize;
	}


	public void setListSize(int listSize) {
		this.listSize = listSize;
	}


	public int getBlockSize() {
		return blockSize;
	}


	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}


	public int getTotSize() {
		return totSize;
	}


	public void setTotSize(int totSize) {
		this.totSize = totSize;
	}


	public int getTotPage() {
		return totPage;
	}


	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}


	public int getTotBlock() {
		return totBlock;
	}


	public void setTotBlock(int totBlock) {
		this.totBlock = totBlock;
	}


	public int getNowPage() {
		return nowPage;
	}


	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}


	public int getNowBlock() {
		return nowBlock;
	}


	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}


	public int getStartPage() {
		return startPage;
	}


	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}


	public int getEndPage() {
		return endPage;
	}


	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}


	public int getStartNo() {
		return startNo;
	}


	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}


	public int getEndNo() {
		return endNo;
	}


	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	
	
	
	
	
}



