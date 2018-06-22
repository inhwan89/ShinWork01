package review;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ReviewController {
	ReviewDao dao;
	
	public ReviewController(ReviewDao dao) {
		this.dao=dao;
	}
	@RequestMapping(value="list.review", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView select(ReviewVo vo,HttpServletRequest req){
		ModelAndView mv =new ModelAndView();
		List<ReviewVo>list = dao.select(vo,req);
		mv.addObject("list",list);
		mv.addObject("vo",vo);
		mv.addObject("dao",dao);
		mv.setViewName("list");
		return mv;
	}
	@RequestMapping(value="insert.review")
	public ModelAndView insert(ReviewVo vo){
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo",vo);
		mv.setViewName("insert");
		return mv;
	}
	@RequestMapping(value="insertR.review")
	public void insertR(HttpServletRequest req, HttpServletResponse resp){
		dao.insert(req);
		try {
			resp.setContentType("text/html;charset=utf-8"); //한글깨짐 방지		
			PrintWriter pw;
			pw = resp.getWriter();
			pw.println("<script>location.href='list.review';");
			pw.println("</script>");
			pw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	@RequestMapping(value="/view.review")
	public ModelAndView view(ReviewVo vo){
		ModelAndView mv =new ModelAndView();
		ReviewVo v= dao.view(vo);
		List<ReviewVo> list =dao.repl(vo);
		mv.addObject("list",list);
		mv.addObject("vo",v);
		mv.setViewName("view");
		return mv;
	}
	@RequestMapping(value="/modify.review")
	public ModelAndView modify(ReviewVo vo){
		ModelAndView mv =new ModelAndView();
		ReviewVo v =dao.Mview(vo);
		mv.addObject("vo",v);
		mv.setViewName("modify");
		return mv;
	}
	@RequestMapping(value="/modifyR.review")
	public ModelAndView modifyR(HttpServletRequest req){
		ModelAndView mv =new ModelAndView();
		ReviewVo vo=dao.modifyR(req);
		mv.addObject("vo", vo);
		mv.setViewName("modify_result");
		return mv;
	}
	@RequestMapping(value="/delete.review")
	public void delete(ReviewVo vo, HttpServletResponse resp){
		dao.delete(vo.getSerial());
		try {
			resp.setContentType("text/html;charset=utf-8"); //한글깨짐 방지		
			PrintWriter pw;
			pw = resp.getWriter();
			pw.println("<script>location.href='list.review';");
			pw.println("</script>");
			pw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping(value="/replI.review")
	public ModelAndView replI(ReviewVo vo){
		ModelAndView mv =new ModelAndView();
		dao.replI(vo);
		ReviewVo v= dao.view(vo);
		List<ReviewVo> list =dao.repl(vo);
		mv.addObject("list",list);
		mv.addObject("vo",v);
		mv.setViewName("view");
		return mv;
	}
	@RequestMapping(value="/replD.review")
	public ModelAndView replD(ReviewVo vo){
		ModelAndView mv =new ModelAndView();
		dao.replD(vo);
		ReviewVo v= dao.view(vo);
		List<ReviewVo> list =dao.repl(vo);
		mv.addObject("list",list);
		mv.addObject("vo",v);
		mv.setViewName("view");
		return mv;
	}
}
