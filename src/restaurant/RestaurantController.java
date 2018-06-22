package restaurant;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class RestaurantController {
	RestaurantDao dao;
	
	
	public RestaurantController(RestaurantDao dao) {
		this.dao = dao;
		
	}
	
	@RequestMapping(value="/insertR.donghwan")
	public void insertR(HttpServletRequest req, HttpServletResponse resp){	
		dao.insert(req);
		PrintWriter pw;
		try {
			pw = resp.getWriter();
		pw.println("<script>alert");	
		pw.println("location.href='list.donghwan';");
		pw.println("</script>");
		pw.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	@RequestMapping(value="/insert.donghwan")
	public ModelAndView insert(RestaurantVo vo){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("insert");
		
		return mv;
	}
	
	@RequestMapping(value="/list.donghwan")
	public ModelAndView list(RestaurantVo vo){
		ModelAndView mv = new ModelAndView();
		List<RestaurantVo> list = dao.select(vo);
		List<RestaurantPhotoVo> photoList = dao.sel(list);
		
		for(int i=0; i<photoList.size(); i++) {		// 메인 사진과 pserial rvo에 담음
			list.get(i).setRmAttFile(photoList.get(i).getRmAttFile());
			list.get(i).setPserial(photoList.get(i).getPserial());
		}
		
		mv.addObject("dao", dao);
		mv.addObject("list", list);		// 목록
		mv.setViewName("list");
		
		return mv;
	}
	
	@RequestMapping(value="/view.donghwan")
	public ModelAndView view(RestaurantVo vo){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("view");
		RestaurantVo rvo = dao.view(vo);
		List<String> rphotoList = dao.photoView(vo);
		List<String> menuPhotoList = dao.photoView2(vo);
		List<String> rphotoList2 = dao.photoView3(vo);
		List<RestaurantMenuVo> menuList = dao.menuView(vo);
		
		mv.addObject("rvo", rvo);					// 음식점 전체 정보
		mv.addObject("rphotoList", rphotoList);		// 음식점 메인
		mv.addObject("rphotoList2", rphotoList2);	// 음식점 서브
		mv.addObject("menuList", menuList);			// 음식점 메뉴 정보
		mv.addObject("menuPhotoList", menuPhotoList);	// 음식점 메뉴 사진
		
		return mv;
	}
	
	@RequestMapping(value="/modify.donghwan")
	public ModelAndView modify(RestaurantVo vo){
		ModelAndView mv = new ModelAndView();
		
		RestaurantVo rvo = dao.modifyReady(vo);
		List<String> rphotoList = dao.photoView(vo);
		List<String> menuPhotoList = dao.photoView2(vo);
		List<String> rphotoList2 = dao.photoView3(vo);
		List<RestaurantMenuVo> menuList = dao.menuView(vo);
		
		mv.addObject("rvo", rvo);					// 음식점 전체 정보
		mv.addObject("rphotoList", rphotoList);		// 음식점 메인
		mv.addObject("rphotoList2", rphotoList2);	// 음식점 서브
		mv.addObject("menuList", menuList);			// 음식점 메뉴 정보
		mv.addObject("menuPhotoList", menuPhotoList);	// 음식점 메뉴 사진
		
		
		mv.setViewName("modify");

		return mv;
	}
	
	@RequestMapping(value="/modifyR.donghwan")
	public void modifyR(HttpServletRequest req, HttpServletResponse resp){
		dao.modify(req);
		
		PrintWriter pw;
		try {
			pw = resp.getWriter();
		pw.println("<script>alert");	
		pw.println("location.href='list.donghwan';");
		pw.println("</script>");
		pw.flush();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	
	@RequestMapping(value="/delete.donghwan")
	public ModelAndView delete(RestaurantVo vo){
		ModelAndView mv = new ModelAndView();
		RestaurantVo rvo = dao.delete(vo);
		
		mv.addObject("rvo", rvo);
		mv.setViewName("delete");
		return mv;
	}
	
	
}
