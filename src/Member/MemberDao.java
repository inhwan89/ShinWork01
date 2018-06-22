package Member;

import java.util.Enumeration;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import bean.FinalFactory;


public class MemberDao {

	int size =1024*1024*10;
	String encode ="utf-8";
	String sDirectory = "C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\FinalProject\\download";
	SqlSession sqlSession;
	
	//페이지 분리와 관련된 변수들
	
	int listSize =5; //한 페이지에 표시될 데이터의 개수
	int blockSize=4; //한 블록당 표시될 페이지 번호의 개수
	int totSize=0; //검색된 결과의 전체 개수
	int totPage=0; //전체 페이지 수
	int totBlock=0; //전체 블록 수
	int nowPage=1; //현재 페이지 
	int nowBlock=1; //현재 블록	
	int startPage=1; //표시될 페이지의 시작번호
	int endPage=4; //표시될 페이지의 끝번호
	int startNo=1; //표시된 데이터의 시작번호
	int endNo=2; //표시된 데이터의 끝번호
	
	public MemberDao(){
		sqlSession = FinalFactory.getFactory().openSession();
	}		
	//-----------------------------------------------------------회원가입----------------------------------------------------------------
	public MemberVo MemberJoin(HttpServletRequest req){
		MemberVo vo = new MemberVo();
		vo.setMsg("정상적으로 회원가입 완료.");
		try{			
			MultipartRequest multi = new MultipartRequest(req, sDirectory, size, encode, new DefaultFileRenamePolicy());
			if(multi.getParameter("selection").equals("i")){	
								
					//입력정보
					vo.setMid(multi.getParameter("mid"));
					vo.setPwd(multi.getParameter("pwd"));		
					vo.setQuestion(multi.getParameter("question"));
					vo.setAnswer(multi.getParameter("answer"));
					vo.setIrum(multi.getParameter("irum"));
					vo.setPost(multi.getParameter("post"));
					vo.setAddress1(multi.getParameter("address1"));
					vo.setAddress2(multi.getParameter("address2"));
					vo.setPhone(multi.getParameter("phone"));
					vo.setPhone2(multi.getParameter("phone2"));
					vo.setPhone3(multi.getParameter("phone3"));
					vo.setEmail(multi.getParameter("email"));
					vo.setEmail2(multi.getParameter("email2"));
					vo.setGender(multi.getParameter("gender"));
					vo.setMdate(multi.getParameter("mdate"));
					vo.setArea(multi.getParameter("area"));		
					vo.setSelection(multi.getParameter("selection"));
					
					Enumeration<String> e = multi.getFileNames();		
					if(e.hasMoreElements()) {
						String tag = (String)e.nextElement();						
						String key = multi.getFilesystemName(tag);											
						vo.setPhoto(key);						
						if(key == null) vo.setPhoto("");
					}
	
					int r = sqlSession.insert("member.MemberJoin", vo);   //Member.xml의 insert	
					
					if(r<1) vo.setMsg("개인회원 가입중 오류 발생");
		
			}else if(multi.getParameter("selection").equals("c")){
					
					//입력정보
					vo.setMid(multi.getParameter("mid"));
					vo.setPwd(multi.getParameter("pwd"));		
					vo.setQuestion(multi.getParameter("question"));
					vo.setAnswer(multi.getParameter("answer"));					
					vo.setDelegate(multi.getParameter("delegate"));
					vo.setCompany_number(multi.getParameter("company_number"));	
					vo.setPost(multi.getParameter("post"));
					vo.setAddress1(multi.getParameter("address1"));
					vo.setAddress2(multi.getParameter("address2"));
					vo.setPhone(multi.getParameter("phone"));
					vo.setPhone2(multi.getParameter("phone2"));
					vo.setPhone3(multi.getParameter("phone3"));
					vo.setEmail(multi.getParameter("email"));
					vo.setEmail2(multi.getParameter("email2"));
					vo.setBusiness_type(multi.getParameter("business_type"));
					vo.setBank(multi.getParameter("bank"));
					vo.setAccount_number(multi.getParameter("account_number"));	
					vo.setArea(multi.getParameter("area"));											
					vo.setSelection(multi.getParameter("selection"));
					
					Enumeration<String> e = multi.getFileNames();		
					if(e.hasMoreElements()) {
						String tag = (String)e.nextElement();						
						String key = multi.getFilesystemName(tag);											
						vo.setPhoto(key);
							
						if(key == null) vo.setPhoto("");
					}
						
					int r = sqlSession.insert("member.MemberJoin2", vo);   //Member.xml의 insert						
					if(r<1) vo.setMsg("사업자회원 가입중 오류 발생");			
			}						
					sqlSession.commit();					
		}catch(Exception ex){				
			ex.printStackTrace();
			vo.setMsg("가입중 예외 발생");	
			sqlSession.rollback();		
		}
		return vo;	
	}	
	//--------------------------------------------------------아이디 중복체크--------------------------------------------------------------	
	public String MemberIdCheck(MemberVo vo){
			MemberVo v = new MemberVo();
			MemberVo v2 = new MemberVo();
			String msg ="";		
		try{
				v = sqlSession.selectOne("member.idCheck", vo.getMid());
				v2 = sqlSession.selectOne("member.idCheck2", vo.getMid());
				if(v == null && v2 == null){
					msg = "사용할 수 있는 아이디입니다.";
				} else{
					msg = "이미 사용중인 아이디입니다.";
				}									
			sqlSession.commit();	
		}catch(Exception ex){
			System.out.println("dao 오류");
			ex.printStackTrace();		
			sqlSession.rollback();		
		}
		return msg;
	}
	
	//--------------------------------------------------------회원정보 불러오기------------------------------------------------------------
	public MemberVo Modify(MemberVo vo, HttpSession session){
			MemberVo v = new MemberVo();
		try{
						
			//개인회원
			if(session.getAttribute("selection").equals("i")){			
				 v = sqlSession.selectOne("member.Modify", session.getAttribute("sId"));		
			//사업자회원
			}else if(session.getAttribute("selection").equals("c")){				
				v = sqlSession.selectOne("member.Modify2", session.getAttribute("sId"));
			}		
			sqlSession.commit();	
		}catch(Exception ex){
			ex.printStackTrace();
			sqlSession.rollback();				
		}	
		return v;
	}
	
	//--------------------------------------------------------회원정보 수정------------------------------------------------------------
	public MemberVo Update(HttpSession session,  HttpServletRequest req){
		MemberVo vo = new MemberVo();
		vo.setMsg("정상적으로 회원수정 완료.");

		try{	
			MultipartRequest multi = new MultipartRequest(req, sDirectory, size, encode, new DefaultFileRenamePolicy());
				
			if(multi.getParameter("selection").equals("i") ){
					
					//입력정보
					vo.setMid(multi.getParameter("mid"));
					vo.setPwd(multi.getParameter("pwd"));	
					vo.setNewPwd(multi.getParameter("newPwd"));
					vo.setQuestion(multi.getParameter("question"));
					vo.setAnswer(multi.getParameter("answer"));
					vo.setIrum(multi.getParameter("irum"));
					vo.setPost(multi.getParameter("post"));
					vo.setAddress1(multi.getParameter("address1"));
					vo.setAddress2(multi.getParameter("address2"));
					vo.setPhone(multi.getParameter("phone"));
					vo.setPhone2(multi.getParameter("phone2"));
					vo.setPhone3(multi.getParameter("phone3"));
					vo.setEmail(multi.getParameter("email"));
					vo.setEmail2(multi.getParameter("email2"));
					vo.setGender(multi.getParameter("gender"));
					vo.setMdate(multi.getParameter("mdate"));
					vo.setArea(multi.getParameter("area"));		
					vo.setSelection(multi.getParameter("selection"));
					if(multi.getParameter("mileage") != null) {
						vo.setMileage(Integer.parseInt(multi.getParameter("mileage")));
					}
					
					Enumeration<String> e = multi.getFileNames();		
					if(e.hasMoreElements()) {
						String tag = (String)e.nextElement();						
						String key = multi.getFilesystemName(tag);											
						vo.setPhoto(key);
						
						if(key == null) vo.setPhoto("");
					}
					
					int r = sqlSession.update("member.MemberUpdate", vo);   //Member.xml의 MemberUpdate				
					if(r<1) vo.setMsg("수정 중 오류 발생.");
					
				}else if(multi.getParameter("selection").equals("c")){
					
					//입력정보
					vo.setMid(multi.getParameter("mid"));
					vo.setPwd(multi.getParameter("pwd"));		
					vo.setQuestion(multi.getParameter("question"));
					vo.setAnswer(multi.getParameter("answer"));
					vo.setCompany_name(multi.getParameter("company_name"));
					vo.setDelegate(multi.getParameter("delegate"));
					vo.setCompany_number(multi.getParameter("company_number"));	
					vo.setPost(multi.getParameter("post"));
					vo.setAddress1(multi.getParameter("address1"));
					vo.setAddress2(multi.getParameter("address2"));
					vo.setPhone(multi.getParameter("phone"));
					vo.setPhone2(multi.getParameter("phone2"));
					vo.setPhone3(multi.getParameter("phone3"));
					vo.setEmail(multi.getParameter("email"));
					vo.setEmail2(multi.getParameter("email2"));
					vo.setBusiness_type(multi.getParameter("business_type"));
					vo.setBank(multi.getParameter("bank"));
					vo.setAccount_number(multi.getParameter("account_number"));	
					vo.setArea(multi.getParameter("area"));	
					vo.setSelection(multi.getParameter("selection"));
					if(multi.getParameter("mileage") != null) {
						vo.setMileage(Integer.parseInt(multi.getParameter("mileage")));
					}
					
					Enumeration<String> e = multi.getFileNames();		
					if(e.hasMoreElements()) {
						String tag = (String)e.nextElement();						
						String key = multi.getFilesystemName(tag);											
						vo.setPhoto(key);
						
						if(key == null) vo.setPhoto("");
					}
					
					int r = sqlSession.update("member.MemberUpdate2", vo);   //Member.xml의 MemberUpdate2								
					if(r<1) vo.setMsg("수정 중 오류 발생.");			
				}				
				sqlSession.commit();					
		}catch(Exception ex){				
			ex.printStackTrace();
			vo.setMsg("수정 중 예외 발생.");
			sqlSession.rollback();		
		}	
		return vo;	
	}
	//--------------------------------------------------------회원정보 삭제------------------------------------------------------------
	public String delete(MemberVo vo, HttpSession session){
		String msg ="정상적으로 삭제하셨습니다.";
		try{	
				if(session.getAttribute("selection").equals("i") ){
					System.out.println("i진입");
					int r = sqlSession.update("member.MemberDelete", vo);   //Member.xml의 MemberUpdate							
					if(r<1) msg ="삭제중 오류 발생";
					
				}else if(session.getAttribute("selection").equals("c")){
					
					int r = sqlSession.update("member.MemberDelete2", vo);   //Member.xml의 MemberUpdate2									
					if(r<1) msg ="삭제중 오류 발생";				
				}			
				sqlSession.commit();					
		}catch(Exception ex){				
			ex.printStackTrace();
			msg= "삭제 중 오류 발생";
			sqlSession.rollback();		
		}	
		return msg;				
	}
	//-----------------------------------------------------------------로그인------------------------------------------------------------
	public int MemberLogin(MemberVo vo){
		int r =0;
		try{	
				if(vo.getSelection().equals("i") ){
					 r = sqlSession.selectOne("member.MemberLogin", vo);   //Member.xml의 insert				
				}else if(vo.getSelection().equals("c") ){		
					 r = sqlSession.selectOne("member.MemberLogin2", vo);   //Member.xml의 insert	
				}								
		}catch(Exception ex){				
			ex.printStackTrace();
		}	
		return r;	
	}
	//---------------------------------------------------------------아이디/비밀번호 찾기----------------------------------------------------
	
	public MemberVo MemberFind(MemberVo vo){
		MemberVo v = new MemberVo();
		try{	
			if(vo.getSelection2().equals("e")){				
				if(vo.getSelection().equals("i") ){
					 v = sqlSession.selectOne("member.MemberFind", vo); 
					 
				}else if(vo.getSelection().equals("c")){				
					 v = sqlSession.selectOne("member.MemberFind2", vo);   
				}			
			}else if(vo.getSelection2().equals("p")){
				System.out.println("dao p진입");
				if(vo.getSelection().equals("i") ){
					 v = sqlSession.selectOne("member.MemberFind3", vo); 			
				}else if(vo.getSelection().equals("c")){	
					 v = sqlSession.selectOne("member.MemberFind4", vo);   
				}
			}
	}catch(Exception ex){				
		ex.printStackTrace();
		System.out.println("아이디 비밀번호 찾기 MemberDao 진입 실패");
	}	
	return v;	
		
	}
	//-------------------------------------------------------------개인회원 리스트-------------------------------------------------------
	//초기리스트
	public List<MemberVo> MemberIndividualList(MemberVo vo){	
		nowPage = vo.getNowPage();
		pageCompute(vo.getFindStr());	
		vo.setStartNo(startNo);
		vo.setEndNo(endNo);
		
		List<MemberVo> list =  sqlSession.selectList("member.MemberIndividualList", vo);	
		return list;
	}
	//등록순
	public List<MemberVo> MemberI_rgisterOrderList(MemberVo vo){
		nowPage = vo.getNowPage();
		pageCompute(vo.getFindStr());	
		vo.setStartNo(startNo);
		vo.setEndNo(endNo);
		
		List<MemberVo> list =  sqlSession.selectList("member.MemberI_rgisterOrderList", vo);	
		return list;
	}
	//이름순
	public List<MemberVo> MemberI_IrumOrderList(MemberVo vo){
		nowPage = vo.getNowPage();
		pageCompute(vo.getFindStr());	
		vo.setStartNo(startNo);
		vo.setEndNo(endNo);
		
		List<MemberVo> list =  sqlSession.selectList("member.MemberI_IrumOrderList", vo);	
		return list;
	}
	//-------------------------------------------------------------사업자회원 리스트-------------------------------------------------------
	//초기리스트	
	public List<MemberVo> MemberCompanyList(MemberVo vo){
		nowPage = vo.getNowPage();
		pageCompute2(vo.getFindStr());	
		vo.setStartNo(startNo);
		vo.setEndNo(endNo);
		
		List<MemberVo> list =  sqlSession.selectList("member.MemberCompanyList", vo);	
		return list;
	}
	//등록순
	public List<MemberVo> MemberC_rgisterOrderList(MemberVo vo){
		nowPage = vo.getNowPage();
		pageCompute2(vo.getFindStr());	
		vo.setStartNo(startNo);
		vo.setEndNo(endNo);
		
		List<MemberVo> list =  sqlSession.selectList("member.MemberC_rgisterOrderList", vo);	
		return list;
	}
	//이름순
	public List<MemberVo> MemberC_IrumOrderList(MemberVo vo){
		nowPage = vo.getNowPage();
		pageCompute2(vo.getFindStr());	
		vo.setStartNo(startNo);
		vo.setEndNo(endNo);
		
		List<MemberVo> list =  sqlSession.selectList("member.MemberC_IrumOrderList", vo);	
		return list;
	}
	//HIT순
	public List<MemberVo> MemberC_HitOrderList(MemberVo vo){
		nowPage = vo.getNowPage();
		pageCompute2(vo.getFindStr());	
		vo.setStartNo(startNo);
		vo.setEndNo(endNo);
		
		List<MemberVo> list =  sqlSession.selectList("member.MemberC_HitOrderList", vo);	
		return list;
	}
	//-----------------------------------------------------개인 pageCompute------------------------------------------------------------	
		public void pageCompute(String findStr){
			
				totSize = sqlSession.selectOne("member.page", findStr);  //board.xml의 page
			
				totPage = (int)Math.ceil(totSize/(double)listSize);//전체 페이지 수 //나누기값의 소수점 때문에 (double)
				totBlock = (int)Math.ceil(totPage/(double)blockSize);//전체 블록 수
				
				nowBlock = (int)Math.ceil(nowPage/(double)blockSize);//현재 블록	
					
				endPage =blockSize*nowBlock;//표시될 페이지의 끝번호	
				startPage = endPage - blockSize + 1;//표시될 페이지의 시작번호
					
				if(endPage>totPage) endPage = totPage; //공갈페이지 없애기
					
				endNo =nowPage*listSize;//표시된 데이터의 끝번호
				startNo = endNo - listSize + 1;//표시된 데이터의 시작번호
							
				if(endNo>totSize) endNo = totSize;
		}
		
	//-----------------------------------------------------사업자 pageCompute------------------------------------------------------------	
		public void pageCompute2(String findStr){
					
				totSize = sqlSession.selectOne("member.page2", findStr);  //board.xml의 page
					
				totPage = (int)Math.ceil(totSize/(double)listSize);//전체 페이지 수 //나누기값의 소수점 때문에 (double)
				totBlock = (int)Math.ceil(totPage/(double)blockSize);//전체 블록 수
						
				nowBlock = (int)Math.ceil(nowPage/(double)blockSize);//현재 블록	
							
				endPage =blockSize*nowBlock;//표시될 페이지의 끝번호	
				startPage = endPage - blockSize + 1;//표시될 페이지의 시작번호
					
				if(endPage>totPage) endPage = totPage; //공갈페이지 없애기
							
				endNo =nowPage*listSize;//표시된 데이터의 끝번호
				startNo = endNo - listSize + 1;//표시된 데이터의 시작번호
									
				if(endNo>totSize) endNo = totSize;
		}
	//---------------------------------------------------admin 회원정보 불러오기------------------------------------------------------------
		public MemberVo ListModify(MemberVo vo){
				MemberVo v = new MemberVo();
				
			try{
				System.out.println("ListModify진입");
				
				//개인회원
				if(vo.getSelection().equals("i")){	
					System.out.println("ListModify i진입");
					 v = sqlSession.selectOne("member.Modify", vo.getMid());
					
				//사업자회원
				}else if(vo.getSelection().equals("c")){	
					System.out.println("ListModify c진입");
					v = sqlSession.selectOne("member.Modify2", vo.getMid());
				}		
				sqlSession.commit();
				
			}catch(Exception ex){
				ex.printStackTrace();
				sqlSession.rollback();				
			}	
			System.out.println(v);
			return v;
		}	

		
	//----------------------------------------------------------get/set---------------------------------------------------------------	
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
