package reservation;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Member.MemberVo;
import accommodation.AccommodationVo;
import accommodation.RoomVo;
import restaurant.RestaurantMenuVo;
import restaurant.RestaurantVo;

@Controller
public class ReservationController {
	ReservationDao dao;
	
	public ReservationController(ReservationDao dao) {
		this.dao=dao;
	}
	@RequestMapping(value="reservation_acc.reserve")
	public ModelAndView insert_acc(ReservationVo vo,HttpSession session){
		ModelAndView mv = new ModelAndView();
		if(vo.getStartDate()!=null && vo.getEndDate()!=null){
			List<RoomVo> roomlist = dao.selectRoom(vo);
			Map<String, Integer> roomCnt = new HashMap<String,Integer>();
			int weekendCnt = dao.weekendCnt(vo);
			vo.setWeekendCnt(weekendCnt);
			for(RoomVo v:roomlist){
				vo.setRoom(v.getRoom());
				int cnt =dao.checkReservation(vo);
				roomCnt.put(v.getRoom(), cnt);
			}
			mv.addObject("roomCnt",roomCnt);
			mv.addObject("roomlist",roomlist);
		}
		MemberVo mem_vo = dao.selectMem(session.getAttribute("sId").toString());
		mv.addObject("vo",vo);
		mv.addObject("mem_vo",mem_vo);
		mv.setViewName("index.jsp?inc=/reservation/reservation_acc");
		return mv;
	}
	@RequestMapping(value="reservation_acc_room.reserve")
	public ModelAndView select_acc_room(ReservationVo vo){
		ModelAndView mv = new ModelAndView();
		mv.addObject("weekendCnt",vo.getWeekendCnt());
		mv.addObject("period",vo.getPeriod());
		RoomVo v = dao.selectRoom2(vo.getSerial());
		mv.addObject("vo",v);
		mv.setViewName("./reservation/reservation_acc_room");
		return mv;
	}
	@RequestMapping(value="reservation_acc_result.reserve")
	public ModelAndView insert_acc_result(ReservationVo vo){
		ModelAndView mv = new ModelAndView();
		dao.insertAcc(vo);
		dao.updateMile(vo);
		mv.addObject("vo",vo);
		mv.setViewName("index.jsp?inc=/reservation/reservation_acc_result");
		return mv;
	}
	@RequestMapping(value="reservation_res.reserve")
	public ModelAndView insert_res(ReservationVo vo,HttpSession session){
		ModelAndView mv = new ModelAndView();
		RestaurantVo rvo = dao.selectRestaurant(vo.getSerial());
		List<String> menuPhotoList = dao.photoView2(vo.getSerial());
		List<RestaurantMenuVo> menuList = dao.menuView(vo.getSerial());
		if(vo.getRdate()!=null){
			List<Integer> rtimelist = new ArrayList<Integer>();
			for(int i=rvo.getRtimeOpen(); i<rvo.getRtimeClose();i++){
				rtimelist.add(i);
			}
			Map<Integer, Integer> tableCnt = new HashMap<Integer,Integer>();
			tableCnt=dao.checkrtime(vo,rtimelist);
			mv.addObject("tableCnt",tableCnt);
			mv.addObject("rtimelist",rtimelist);
		}
		MemberVo mem_vo = dao.selectMem(session.getAttribute("sId").toString());
		mv.addObject("rvo",rvo);
		mv.addObject("menuList", menuList);			// 음식점 메뉴 정보
		mv.addObject("menuPhotoList", menuPhotoList);	// 음식점 메뉴 사진
		mv.addObject("vo",vo);
		mv.addObject("mem_vo",mem_vo);
		mv.setViewName("index.jsp?inc=/reservation/reservation_res");
		return mv;
	}
	@RequestMapping(value="reservation_res_result.reserve")
	public ModelAndView insert_res_result(ReservationVo vo){
		ModelAndView mv = new ModelAndView();
		dao.updateMile(vo);
		dao.insertRes(vo);
		mv.addObject("vo",vo);
		mv.setViewName("index.jsp?inc=/reservation/reservation_res_result");
		return mv;
	}
	@RequestMapping(value="list_Individual.reserve", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView list_Indiviual(ReservationVo vo,HttpSession session,HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		MemberVo mem_vo = dao.selectMem(session.getAttribute("sId").toString());
		vo.setMem_se(mem_vo.getSerial());
		List<ReservationVo> list = dao.list_Individual(vo,req);
		mv.addObject("list",list);
		mv.addObject("vo",vo);
		mv.addObject("dao",dao);
		mv.setViewName("index.jsp?inc=/reservation/list_Individual");
		return mv;
	}
	@RequestMapping(value="list_company.reserve", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView list_company(ReservationVo vo,HttpSession session,HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		if(req.getParameter("reservationPage2")==null){
			vo.setReservationPage2(1);	
		}
		List<ReservationVo>list = dao.list_company(session.getAttribute("sId").toString(),vo);
		mv.addObject("list",list);
		mv.addObject("vo",vo);
		mv.addObject("dao",dao);
		mv.setViewName("index.jsp?inc=/reservation/list_company");
		return mv;
	}
	@RequestMapping(value="list_store.reserve", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView list_store(ReservationVo vo,HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		if(req.getParameter("reservationPage")==null){
			vo.setReservationPage(1);
		}
		List<ReservationVo>list=dao.list_store(vo);
		mv.addObject("list",list);
		mv.addObject("vo",vo);
		mv.addObject("dao",dao);
		mv.setViewName("index.jsp?inc=/reservation/list_company_sec");
		return mv;
	}
	@RequestMapping(value="view.reserve")
	public ModelAndView view(ReservationVo vo){
		ModelAndView mv = new ModelAndView();
		ReservationVo v = dao.selectReservation(vo.getSerial());
		v.setSerial2(vo.getSerial2());
		v.setReservationPage(vo.getReservationPage());
		v.setReservationPage2(vo.getReservationPage2());
		v.setSelect(vo.getSelect());
		MemberVo mem_vo=dao.selectMem2(v.getMem_se());
		mv.addObject("vo",v);
		mv.addObject("mem_vo",mem_vo);
		List<ReservationVo> dvoList=dao.selectReservationDetail(vo.getSerial());
		ReservationVo dvo=dvoList.get(0);
		if(v.getAcc_se()==0){
			RestaurantVo rvo =dao.selectRestaurant(v.getRes_se());
			mv.addObject("rvo",rvo);
			mv.addObject("dvo",dvo);
			mv.setViewName("index.jsp?inc=/reservation/view_res");
		}else{
			AccommodationVo avo =dao.selectAccmmodation(v.getAcc_se());
			dvo.setEndDate(dvoList.get(dvoList.size()-1).getRdate());
			mv.addObject("dvo",dvo);
			mv.addObject("avo",avo);
			mv.setViewName("index.jsp?inc=/reservation/view_acc");
		}
		return mv;
	}
	@RequestMapping(value="delete.reserve")
	public ModelAndView delete(ReservationVo vo){
		ModelAndView mv = new ModelAndView();
		mv.addObject("vo",vo);
		mv.setViewName("index.jsp?inc=/reservation/delete");
		return mv;
	}
	@RequestMapping(value="deleteR.reserve")
	public ModelAndView deleteR(ReservationVo vo,HttpSession session){
		ModelAndView mv = new ModelAndView();
		ReservationVo v =dao.insertCancle(vo,session);
		dao.deleteReservation(v);
		mv.addObject("vo",v);
		mv.setViewName("index.jsp?inc=/reservation/delete_result");
		return mv;
	}
	
	@RequestMapping(value="list_cancel_i.reserve", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView list_cancel_i(ReservationVo vo,HttpSession session,HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		MemberVo mem_vo = dao.selectMem(session.getAttribute("sId").toString());
		vo.setMem_se(mem_vo.getSerial());
		List<ReservationVo> list = dao.list_cancel_i(vo,req);
		mv.addObject("list",list);
		mv.addObject("vo",vo);
		mv.addObject("dao",dao);
		mv.setViewName("index.jsp?inc=/reservation/list_cancel_i");
		return mv;
	}
	@RequestMapping(value="list_cancel_c.reserve", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView list_cancel_c(ReservationVo vo,HttpServletRequest req){
		ModelAndView mv = new ModelAndView();
		if(req.getParameter("reservationPage")==null){
			vo.setReservationPage(1);
		}
		List<ReservationVo>list=dao.list_cancel_c(vo);
		mv.addObject("list",list);
		mv.addObject("vo",vo);
		mv.addObject("dao",dao);
		mv.setViewName("index.jsp?inc=/reservation/list_cancel_c");
		return mv;
	}
}