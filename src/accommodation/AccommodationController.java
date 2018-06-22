package accommodation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import restaurant.RestaurantVo;

@Controller
public class AccommodationController {
	AccommodationDao dao;
	
	public AccommodationController(AccommodationDao dao){
		this.dao = dao; // Controller에 BoardDao 추가를 한다.
	}
	
	@RequestMapping(value="/save.ac")
	public ModelAndView insert(HttpServletRequest req){
		ModelAndView mv =new ModelAndView();
		String msg = dao.save(req);
		mv.addObject("msg", msg);
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.setViewName("list.ac");
		return mv;
	}
	
	
	
	  @RequestMapping(value="/list.ac", method={RequestMethod.GET, RequestMethod.POST})
		public ModelAndView list(AccommodationVo vo){
		ModelAndView mv =new ModelAndView();
		List<List<AccommodationVo>>  list  = dao.list(vo);
		mv.addObject("list",list);
		mv.addObject("vo",vo);
		mv.setViewName("index.jsp?inc=/accommodation/list.jsp");
		return mv;	
		}
		
		@RequestMapping(value="/list_detail_inner.ac", method={RequestMethod.GET, RequestMethod.POST})
		public ModelAndView list_detail_inner(AccommodationVo vo){
		ModelAndView mv =new ModelAndView();
		List<AccommodationVo> list  = dao.list_detail(vo);
		mv.addObject("list",list);
		mv.addObject("vo",vo);
		mv.addObject("dao", dao);
		mv.setViewName("./accommodation/list_detail_inner.jsp");
		return mv;	
		}
		@RequestMapping(value="/list_detail", method={RequestMethod.GET, RequestMethod.POST})
		public ModelAndView list_detail(AccommodationVo vo){
		ModelAndView mv =new ModelAndView();
		mv.addObject("vo",vo);
		mv.setViewName("index.jsp?inc=/accommodation/list_detail.jsp");
		return mv;	
		}
		
		@RequestMapping(value="/selectOne.ac")
		public ModelAndView selectOne(AccommodationVo vo){
		ModelAndView mv =new ModelAndView();
		AccommodationVo vo1  = dao.selectOne(vo);
		List<RoomVo> list = dao.roomList(vo);
		List<RestaurantVo> list2 = dao.list_restaurant(vo);
		RoomVo vo2 = dao.picList(vo,list.size());
		double avg = dao.review(vo);
		mv.addObject("vo",vo1);
		mv.addObject("list", list);
		mv.addObject("restaurant_list",list2);
		mv.addObject("avg",avg);
		mv.addObject("picList",vo2.getPicList());
		
		
		mv.setViewName("index.jsp?inc=/accommodation/view.jsp");
		return mv;	
		}
		
		@RequestMapping(value="/selectToModify.ac")
		public ModelAndView selectToModify(AccommodationVo vo){
		ModelAndView mv =new ModelAndView();
		AccommodationVo vo1  = dao.selectOne(vo);
		List<RoomVo> list = dao.roomList(vo);
		RoomVo vo2 = dao.picList(vo,list.size());
		mv.addObject("vo",vo1);
		mv.addObject("list", list);
		mv.addObject("picList",vo2.getPicList());
		mv.setViewName("index.jsp?inc=/accommodation/modify.jsp");
		return mv;	
	}
		
		@RequestMapping(value="/modify.ac")
		public ModelAndView modify(HttpServletRequest req){
		ModelAndView mv =new ModelAndView();
		String msg = dao.modify(req);
		mv.addObject("msg", msg);
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.setViewName("list.ac");
		return mv;
		}
		
		@RequestMapping(value="/delete.ac")
		public ModelAndView delete(HttpServletRequest req){
		ModelAndView mv =new ModelAndView();
		String msg = dao.delete(req);
		mv.addObject("msg", msg);
		try {
			Thread.sleep(2000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mv.setViewName("list.ac");
		return mv;
		}
		
}
