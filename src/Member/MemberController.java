package Member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {	
	
	MemberDao dao;
	
	public MemberController(MemberDao dao){
		this.dao = dao;
	}
	
	//---------------------------------------------------MemberJoin(회원가입)----------------------------------------------------------
	@RequestMapping(value="/MemberJoin.member")
	public ModelAndView insert(HttpServletRequest req){ 
		ModelAndView mv = new ModelAndView();
		MemberVo vo = dao.MemberJoin(req); 
		mv.addObject("vo", vo);
		mv.setViewName("index.jsp?inc=/member/MemberJoin_result.jsp");
		
		return mv;
	}
	
	//---------------------------------------------------MemberIdCheck(아이디 중복체크)--------------------------------------------------
	@RequestMapping(value="member/MemberIdCheck.check")
	public ModelAndView idCheck(MemberVo vo){		
		ModelAndView mv = new ModelAndView();		
		String msg = dao.MemberIdCheck(vo);		
		System.out.println(msg);
		mv.addObject("msg", msg);
		mv.setViewName("MemberIdCheck");
		
		return mv;				
	}
	//---------------------------------------------------MemberModify(회원수정불러오기)--------------------------------------------------	
	@RequestMapping(value="/MemberModify.member")
	public ModelAndView Modify(MemberVo vo, HttpSession session){
		ModelAndView mv = new ModelAndView();
		MemberVo v= dao.Modify(vo, session); 
		if(session.getAttribute("selection").equals("i")){
			v.setSelection("i");		
		}else{
			v.setSelection("c");
		}
		//email text 분기 (subString 방식/ split방식) -- subString 방식은 index 오류 가능성이 높음		
		/*String email = v.getEmail();
		String email2=email.substring(0, email.indexOf("@")); // @앞부분
		String email3=email.substring(email.indexOf("@")+1); // @뒷부분
		v.setEmail(email2);
		v.setEmail2(email3);*/
		
		
		//email text 분기 (split 방식 )
		String email = v.getEmail();
		String[] loadEmail = email.split("@");
		
		String email2 = loadEmail[0];
		String email3 = loadEmail[1];
		v.setEmail(email2);
		v.setEmail2(email3);
		
		//phone text 분기 (split 방식 )
		
		
		String phone = v.getPhone();
		String[] loadPhone = phone.split("-");
		
		String phone2 = loadPhone[0];
		String phone3 = loadPhone[1];
		String phone4 = loadPhone[2];
		
		v.setPhone(phone2);
		v.setPhone2(phone3);
		v.setPhone3(phone4);	
		mv.addObject("vo", v);
		mv.setViewName("index.jsp?inc=/member/MemberModify.jsp");
		return mv;	
	}
	//---------------------------------------------------MemberUpdate(회원수정)--------------------------------------------------
	@RequestMapping(value="/MemberUpdate.member")
	public ModelAndView update(HttpSession session, HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		MemberVo vo = dao.Update(session, req);
		System.out.println(vo);
		mv.addObject("vo", vo);
		mv.setViewName("index.jsp?inc=/member/MemberUpdate_result.jsp");
		
		return mv;

	}
	
	//---------------------------------------------------MemberDelete(회원삭제)--------------------------------------------------
	@RequestMapping(value="/MemberDelete.member")
	public ModelAndView delete(MemberVo vo, HttpSession session){
		ModelAndView mv = new ModelAndView();
		System.out.println(vo.getMid());
		String msg = dao.delete(vo, session);
		session.setAttribute("sId", null); // null값으로 변경
		
		mv.addObject("msg", msg);
		mv.setViewName("index.jsp?inc=intro.jsp");
		return mv;

		
	}
	
	//----------------------------------------------MemberLogin/Logout(로그인/로그아웃)--------------------------------------------------
	//로그인
	@RequestMapping(value="/MemberLogin.member")
	public ModelAndView login(MemberVo vo, HttpSession session, HttpServletResponse resp){ 
		ModelAndView mv = new ModelAndView();
		int r = dao.MemberLogin(vo);
		if(r>0){
			
			try{
				session.setAttribute("sId", vo.getMid()); //로그인시 session에 mid 값을 넣음
				session.setAttribute("selection", vo.getSelection()); // 로그인시 session에 selection값을 넣음(개인/사업자 구분 용도)
				resp.setContentType("text/html;charset=utf-8"); //한글깨짐 방지		
			/*	PrintWriter pw = resp.getWriter();	
				pw.println("<script>alert");	
				pw.println("location.href='index.jsp?inc=intro.jsp';");
				pw.println("</script>");
				pw.flush();*/
				mv.setViewName("index.jsp?inc=intro.jsp");
			}catch(Exception ex){
				ex.printStackTrace();
			}
			
		}else{
			resp.setContentType("text/html;charset=utf-8"); //한글깨짐 방지		
			PrintWriter pw;
			try {
				pw = resp.getWriter();
				pw.println("<script>alert('아이디나 또는 비밀번호를 확인해 주세요.');");	
				pw.println("var url = document.referrer;"); //이전 페이지 정보를 요청
				pw.println("location.href=url;");
				pw.println("</script>");
				pw.flush();
				} catch (IOException e) {
					e.printStackTrace();
			}	
		}
		return mv;	
	}
	//로그아웃
	@RequestMapping(value="/MemberLogout.member")
	public void logout(MemberVo vo, HttpSession session, HttpServletResponse resp){
		
		try{
			session.setAttribute("sId", null); // null값으로 변경
			session.setAttribute("selection", null);
			resp.setContentType("text/html;charset=utf-8"); //한글깨짐 방지		
			PrintWriter pw = resp.getWriter();	
			pw.println("<script>alert('로그아웃 되셨습니다.');");
			pw.println("location.href='index.jsp';");
			pw.println("</script>");
			pw.flush();

		}catch(Exception ex){
			ex.printStackTrace();
		}	
	}
	
	//----------------------------------------------MemberFind(아이디/비밀번호찾기)--------------------------------------------------
	@RequestMapping(value="/MemberFind.member")
	public ModelAndView find(MemberVo vo, HttpSession session, HttpServletResponse resp){ 
		ModelAndView mv = new ModelAndView();		
		MemberVo v = dao.MemberFind(vo);
		mv.addObject("vo", v);

			if(v != null){		
				try {
					mv.setViewName("index.jsp?inc=/member/MemberFind2.jsp");		
				} catch (Exception e) {				
					e.printStackTrace();
				}	
			}else{
				System.out.println("MemberController else 진입");
				resp.setContentType("text/html;charset=utf-8"); //한글깨짐 방지		
				PrintWriter pw;
				try {		
					pw = resp.getWriter();
					pw.println("<script>alert('해당 정보를 찾을 수 없습니다.');");			
					pw.println("location.href=MemberFind.member");				
					pw.println("</script>");
					pw.flush();			
				} catch (IOException e) {
					e.printStackTrace();
				}		
			}
		return mv;
	}
	
	//----------------------------------------------MemberIndividualList(개인회원리스트)--------------------------------------------------
	//초기리스트
	@RequestMapping(value="/MemberIndividualList.member")
	public ModelAndView MemberIndividualList(MemberVo vo){
		ModelAndView mv = new ModelAndView();
		List<MemberVo> v = dao.MemberIndividualList(vo);
		mv.addObject("list", v);
		mv.addObject("dao",dao); //페이지 분리를 위한 dao
		mv.setViewName("index.jsp?inc=/member/MemberIndividualList.jsp");
	
		return mv;
		
	}
	//등록순
	@RequestMapping(value="/MemberI_rgisterOrderList.member")
	public ModelAndView MemberI_rgisterOrderList(MemberVo vo){
		System.out.println("MemberI_rgisterOrderList 컨트롤러 진입");
		ModelAndView mv = new ModelAndView();
		List<MemberVo> v = dao.MemberI_rgisterOrderList(vo);
		mv.addObject("list", v);
		mv.addObject("dao",dao); //페이지 분리를 위한 dao
		mv.setViewName("index.jsp?inc=/member/MemberIndividualList.jsp");		
		
		return mv;	
	}
	//이름순
	@RequestMapping(value="/MemberI_IrumOrderList.member")
	public ModelAndView MemberI_IrumOrderList(MemberVo vo){
		System.out.println("MemberI_IrumOrderList 컨트롤러 진입");
		ModelAndView mv = new ModelAndView();
		List<MemberVo> v = dao.MemberI_IrumOrderList(vo);
		mv.addObject("list", v);
		mv.addObject("dao",dao); //페이지 분리를 위한 dao
		mv.setViewName("index.jsp?inc=/member/MemberIndividualList.jsp");
		
		return mv;	
	}
	
	//----------------------------------------------MemberCompanyList(사업자회원리스트)-----------------------------------------------------
	//초기리스트
	@RequestMapping(value="/MemberCompanyList.member")
	public ModelAndView MemberCompanyList(MemberVo vo){
		System.out.println("MemberCompanyList 컨트롤러 진입");
		ModelAndView mv = new ModelAndView();
		List<MemberVo> v = dao.MemberCompanyList(vo);
		mv.addObject("list", v);
		mv.addObject("dao",dao); //페이지 분리를 위한 dao
		mv.setViewName("index.jsp?inc=/member/MemberCompanyList.jsp");
				
		return mv;
		
	}
	//등록순
	@RequestMapping(value="/MemberC_rgisterOrderList.member")
	public ModelAndView MemberC_rgisterOrderList(MemberVo vo){
		ModelAndView mv = new ModelAndView();
		List<MemberVo> v = dao.MemberC_rgisterOrderList(vo);
		mv.addObject("list", v);
		mv.addObject("dao",dao); //페이지 분리를 위한 dao
		mv.setViewName("index.jsp?inc=/member/MemberCompanyList.jsp");
			
		return mv;	
	}
	//이름순
	@RequestMapping(value="/MemberC_IrumOrderList.member")
	public ModelAndView MemberC_IrumOrderList(MemberVo vo){	
		ModelAndView mv = new ModelAndView();
		List<MemberVo> v = dao.MemberC_IrumOrderList(vo);
		mv.addObject("list", v);
		mv.addObject("dao",dao); //페이지 분리를 위한 dao
		mv.setViewName("index.jsp?inc=/member/MemberCompanyList.jsp");
			
		return mv;	
	}
	//hit순
	@RequestMapping(value="/MemberC_HitOrderList.member")
	public ModelAndView MemberC_HitOrderList(MemberVo vo){	
		ModelAndView mv = new ModelAndView();
		List<MemberVo> v = dao.MemberC_HitOrderList(vo);
		mv.addObject("list", v);
		mv.addObject("dao",dao); //페이지 분리를 위한 dao
		mv.setViewName("index.jsp?inc=/member/MemberCompanyList.jsp");
					
		return mv;	
	}
	//---------------------------------------------MemberListModify(admin 리스트 수정)----------------------------------------------------
	@RequestMapping(value="/MemberListModify.member")
	public ModelAndView ListModify(MemberVo vo,HttpSession session){
			ModelAndView mv = new ModelAndView();
			MemberVo v= dao.ListModify(vo);
			v.setSelection(vo.getSelection());
			
			//email text 분기 (split 방식 )
			
			String email = v.getEmail();
			String[] loadEmail = email.split("@");
			
			String email2 = loadEmail[0];
			String email3 = loadEmail[1];
			v.setEmail(email2);
			v.setEmail2(email3);
			
			//phone text 분기 (split 방식 )
			
			String phone = v.getPhone();
			String[] loadPhone = phone.split("-");
			
			String phone2 = loadPhone[0];
			String phone3 = loadPhone[1];
			String phone4 = loadPhone[2];
			
			v.setPhone(phone2);
			v.setPhone2(phone3);
			v.setPhone3(phone4);
			
			mv.addObject("vo", v);
			mv.setViewName("index.jsp?inc=/member/MemberModify.jsp");
		
			return mv;	
	}
}