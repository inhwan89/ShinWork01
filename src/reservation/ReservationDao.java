package reservation;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import Member.MemberVo;
import accommodation.AccommodationVo;
import accommodation.RoomVo;
import bean.FinalFactory;
import restaurant.RestaurantMenuVo;
import restaurant.RestaurantPhotoVo;
import restaurant.RestaurantVo;

public class ReservationDao {
	
	SqlSession sqlSession;
	
	//페이지 분리와 관련된 변수들
	int listSize=5;//한페이지에 표시될 데이터의 갯수
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
	
	public ReservationDao(){
		sqlSession =FinalFactory.getFactory().openSession();
	}
	public MemberVo selectMem(String mid){
		MemberVo mem_vo = sqlSession.selectOne("reservation.selectMem",mid);
		return mem_vo;
	}
	
	public MemberVo selectMem2(int serial){
		MemberVo mem_vo = sqlSession.selectOne("reservation.selectMem2",serial);
		return mem_vo;
	}
	public List<RoomVo> selectRoom(ReservationVo vo){
		List<RoomVo> roomlist= sqlSession.selectList("reservation.selectRoom",vo.getSerial());
		return roomlist;
	}
	public RoomVo selectRoom2(int serial){
		RoomVo room= sqlSession.selectOne("reservation.selectRoom2",serial);
		return room;
	}
	public int checkReservation(ReservationVo vo){
		int cnt =0;
		try {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateInString = vo.getStartDate();
		Date date;
		date = formatter.parse(dateInString);
		date.setDate(date.getDate()-1);
		for(int i =0; i<vo.getPeriod();i++){
			date.setDate(date.getDate()+1);
			String temp =formatter.format(date);
			vo.setRdate(temp);
			int cnt2 = sqlSession.selectOne("reservation.checkReservation",vo);
			if(cnt2>cnt)cnt=cnt2;
		}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	public int weekendCnt(ReservationVo vo){
		int cnt =0;
		try {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String dateInString = vo.getStartDate();
		Date date;
		date = formatter.parse(dateInString);
		date.setDate(date.getDate()-1);
		for(int i =0; i<vo.getPeriod();i++){
			date.setDate(date.getDate()+1);
			Calendar cal =Calendar.getInstance();
			cal.setTime(date);
			int day_num =cal.get(Calendar.DAY_OF_WEEK);
			if(day_num==6 || day_num==7){			
				cnt++;
			}
		}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	public void insertAcc(ReservationVo vo){
		try {
			int r = sqlSession.insert("reservation.insertAcc",vo);
			if(r<1) sqlSession.rollback();
			sqlSession.commit();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String dateInString = vo.getStartDate();
			Date date = formatter.parse(dateInString);
			date.setDate(date.getDate()-1);
			for(int i =0; i<vo.getPeriod();i++){
				date.setDate(date.getDate()+1);
				Calendar cal =Calendar.getInstance();
				cal.setTime(date);
				int day_num =cal.get(Calendar.DAY_OF_WEEK);
				String temp =formatter.format(date);
				vo.setRdate(temp);
				if(day_num==6 || day_num==7){
					sqlSession.insert("reservation.insert_detail_weekend",vo);
				}else{
					sqlSession.insert("reservation.insert_detail_weekday",vo);
				}
				sqlSession.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
		}
		
	}
	public void updateMile(ReservationVo vo){
		try {
			sqlSession.update("reservation.memMile",vo);
			sqlSession.commit();
			sqlSession.update("reservation.comMile",vo);
			sqlSession.commit();
		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
		}
	}
	public RestaurantVo selectRestaurant(int serial){
		RestaurantVo rvo =sqlSession.selectOne("reservation.selectRes",serial);
		return rvo;
	}
	public Map<Integer, Integer> checkrtime(ReservationVo vo,List<Integer> tablelist){
		Map<Integer, Integer> tableCnt = new HashMap<Integer,Integer>();
		for(int i:tablelist){
			vo.setRtime(i);
			int cnt =sqlSession.selectOne("reservation.checkrtime",vo);
			tableCnt.put(vo.getRtime(), cnt);
		}
		return tableCnt;
	}
	public List<String> photoView2(int serial){
		List<RestaurantPhotoVo> rmAttFileList = new ArrayList<RestaurantPhotoVo>();
		rmAttFileList = sqlSession.selectList("restaurant.photoView3", serial);
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
	
	public List<RestaurantMenuVo> menuView(int serial){
		List<RestaurantMenuVo> menuList 
				= sqlSession.selectList("restaurant.menuView", serial);

		return menuList;
	}
	public void insertRes(ReservationVo vo){
		try {
			sqlSession.insert("reservation.insertRes",vo);
			for(int i=0; i<vo.getTable();i++){	
				if(i!=0){
					vo.setMenu("복수 테이블 예약");
					vo.setPrice(0);
				}
				sqlSession.insert("reservation.insert_detail_res",vo);					
			}
			sqlSession.commit();
		} catch(Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
		}
	}
	public void pageCompute(ReservationVo vo){
		totSize = sqlSession.selectOne("reservation.page", vo);
		
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
	public List<ReservationVo> list_Individual(ReservationVo rvo,HttpServletRequest req){
		if(req.getParameter("reservationPage")==null){
			rvo.setReservationPage(1);	
		}
		nowPage= rvo.getReservationPage();
		pageCompute(rvo);
		rvo.setStartNo(startNo);
		rvo.setEndNo(endNo);
		List<ReservationVo> Templist =sqlSession.selectList("reservation.selectAll",rvo);
		List<ReservationVo> list = new ArrayList<ReservationVo>();
		for(ReservationVo vo:Templist){
			List<ReservationVo> Temp = sqlSession.selectList("reservation.selectOne",vo.getSerial());
			if(vo.getAcc_se()==0){
				RestaurantVo v = sqlSession.selectOne("restaurant.view",vo.getRes_se());
				vo.setStore(v.getRname());
				vo.setMenu(Temp.get(0).getMenu());
				vo.setRdate(Temp.get(0).getRdate());
				vo.setRtime(Temp.get(0).getRtime());
				list.add(vo);
			}else{
				String store =sqlSession.selectOne("reservation.selectStore",vo.getAcc_se());
				vo.setStore(store);
				vo.setStartDate(Temp.get(0).getRdate());
				String day=Temp.get(Temp.size()-1).getRdate();
				 DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				    try {
				        Date date = df.parse(day);
				        // 날짜 더하기
				        Calendar cal = Calendar.getInstance();
				        cal.setTime(date);
				        cal.add(Calendar.DATE, 1);
				        vo.setEndDate(df.format(cal.getTime()));					
				        vo.setRoom(Temp.get(0).getRoom());
				        vo.setRdate("");
				        list.add(vo);
				    } catch (ParseException e) {
				        e.printStackTrace();
				    }
			}
		}
		return list;
	}
	public ReservationVo selectReservation(int serial){
		ReservationVo vo = sqlSession.selectOne("reservation.selectReservation",serial);
		if(vo.getEndDate()!=null){
			String day=vo.getEndDate();
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			    try {
			        Date date = df.parse(day);
			        // 날짜 더하기
			        Calendar cal = Calendar.getInstance();
			        cal.setTime(date);
			        cal.add(Calendar.DATE, 1);
			        vo.setEndDate(df.format(cal.getTime()));
			    } catch (ParseException e) {
			        e.printStackTrace();
			    }
		}
		return vo;
	}
	public AccommodationVo selectAccmmodation(int serial){
		AccommodationVo vo = sqlSession.selectOne("reservation.selectAcc",serial);
		return vo;
	}
	public List<ReservationVo> selectReservationDetail(int serial){
		List<ReservationVo> list = sqlSession.selectList("reservation.selectOne",serial);
		return list;
	}
	public void pageCompute2(int totSize2){
		totSize = totSize2;
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
	public List<ReservationVo> list_company(String mid,ReservationVo v2){
		List<ReservationVo> listT = new ArrayList<ReservationVo>();
		List<ReservationVo> list = new ArrayList<ReservationVo>();
		List<AccommodationVo> list1 =sqlSession.selectList("reservation.listAcc",mid);
		for(AccommodationVo vo:list1){
			ReservationVo v = new ReservationVo();
			v.setSerial(vo.getSerial());
			v.setSelect("acc");
			v.setStore(vo.getAname());
			v.setAddress1(vo.getAddress1());
			v.setAddress2(vo.getAddress2());
			list.add(v);
		}
		List<RestaurantVo> list2 =sqlSession.selectList("reservation.listRes",mid);
		for(RestaurantVo vo:list2){
			ReservationVo v = new ReservationVo();
			v.setSerial(vo.getSerial());
			v.setSelect("res");
			v.setStore(vo.getRname());
			v.setAddress1(vo.getRaddress1());
			v.setAddress2(vo.getRaddress2());
			list.add(v);
		}
		nowPage = v2.getReservationPage2();
		pageCompute2(list.size());
		for(int i=startNo-1;i<endNo;i++){
			listT.add(list.get(i));
		}
		return listT;
	}
	public void pageCompute3(ReservationVo vo){
		totSize = sqlSession.selectOne("reservation.page2", vo);
	
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
	public List<ReservationVo> list_store(ReservationVo rvo){
		nowPage= rvo.getReservationPage();
		pageCompute3(rvo);
		rvo.setStartNo(startNo);
		rvo.setEndNo(endNo);
		List<ReservationVo> Templist =sqlSession.selectList("reservation.selectAll2",rvo);
		List<ReservationVo> list = new ArrayList<ReservationVo>();
		for(ReservationVo vo:Templist){
			List<ReservationVo> Temp = sqlSession.selectList("reservation.selectOne",vo.getSerial());
			MemberVo mvo = sqlSession.selectOne("reservation.selectMem2",vo.getMem_se());
			vo.setStore(mvo.getIrum());
			if(vo.getAcc_se()==0){
				vo.setMenu(Temp.get(0).getMenu());
				vo.setRdate(Temp.get(0).getRdate());
				vo.setRtime(Temp.get(0).getRtime());
				list.add(vo);
			}else{
				vo.setStartDate(Temp.get(0).getRdate());		
				String day=Temp.get(Temp.size()-1).getRdate();
				 DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				    try {
				        Date date = df.parse(day);
				        // 날짜 더하기
				        Calendar cal = Calendar.getInstance();
				        cal.setTime(date);
				        cal.add(Calendar.DATE, 1);
				        vo.setEndDate(df.format(cal.getTime()));					
				        vo.setRoom(Temp.get(0).getRoom());
				        vo.setRdate("");
				        list.add(vo);
				    } catch (ParseException e) {
				        e.printStackTrace();
				    }
			}			
		}
		return list;
	}
	public ReservationVo insertCancle(ReservationVo vo,HttpSession session){
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String dateInString = vo.getRdate();
			Date date = formatter.parse(dateInString);
			Date date2 = new Date();
			Date date3 = new Date(date2.getYear(), date2.getMonth(), date2.getDate());
			long period = date.getTime() - date3.getTime();
			long diffDays = (long) Math.ceil(period / (24 * 60 * 60 * 1000));
			if(session.getAttribute("selection").equals("i")){				
				if(diffDays>=7){
					int r = sqlSession.insert("reservation.insertCancle",vo);			
					if(r<1) sqlSession.rollback();
					sqlSession.commit();
					vo.setMsg("7일 이전 예약 취소로 100% 환불 되었습니다.");
				}else if(diffDays>=3){
					vo.setPrice((int)Math.ceil(vo.getPrice()*0.8));
					int r = sqlSession.insert("reservation.insertCancle",vo);			
					if(r<1) sqlSession.rollback();
					sqlSession.commit();
					vo.setMsg("3일 이전 예약 취소로 80% 환불 되었습니다.");
				}else if(diffDays>=1){
					vo.setPrice((int)Math.ceil(vo.getPrice()*0.5));
					int r = sqlSession.insert("reservation.insertCancle",vo);			
					if(r<1) sqlSession.rollback();
					sqlSession.commit();
					vo.setMsg("1일 이전 예약 취소로 50% 환불 되었습니다.");
				}else {
					vo.setMsg("환불 불가능한 예약입니다.");
				}
			}else{
				int r = sqlSession.insert("reservation.insertCancle",vo);			
				if(r<1) sqlSession.rollback();
				sqlSession.commit();
				vo.setMsg("사업자 예약취소로 100% 환불 되었습니다.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			sqlSession.rollback();
		}
		return vo;
	}
	public void deleteReservation(ReservationVo vo){
		if(!vo.getMsg().equals("환불 불가능한 예약입니다.")){
			String mid="";
			if(vo.getAcc_se()==0){
				mid=sqlSession.selectOne("reservation.checkC",vo.getRes_se());			
			}else{
				mid=sqlSession.selectOne("reservation.checkC2",vo.getAcc_se());
			}
			vo.setWorker(mid);
			vo.setPrice(vo.getPrice()*(-1));
			updateMile(vo);
			sqlSession.delete("reservation.deleteR",vo.getSerial());
			sqlSession.delete("reservation.deleteRD",vo.getSerial());
			sqlSession.commit();
		}
	}
	public void pageCompute4(ReservationVo vo){
		totSize = sqlSession.selectOne("reservation.cpage", vo);
		
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
	public List<ReservationVo> list_cancel_i(ReservationVo rvo,HttpServletRequest req){
		if(req.getParameter("reservationPage")==null){
			rvo.setReservationPage(1);	
		}
		nowPage= rvo.getReservationPage();
		pageCompute4(rvo);
		rvo.setStartNo(startNo);
		rvo.setEndNo(endNo);
		List<ReservationVo> Templist =sqlSession.selectList("reservation.selectCAll",rvo);
		List<ReservationVo> list = new ArrayList<ReservationVo>();
		for(ReservationVo vo:Templist){
			if(vo.getAcc_se()==0){
				RestaurantVo v = sqlSession.selectOne("restaurant.view",vo.getRes_se());
				vo.setStore(v.getRname());
				list.add(vo);
			}else{
				String store =sqlSession.selectOne("reservation.selectStore",vo.getAcc_se());
				vo.setStore(store);
				list.add(vo);
			}
		}
		return list;
	}
	public void pageCompute5(ReservationVo vo){
		totSize = sqlSession.selectOne("reservation.cpage2", vo);
		
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
	public List<ReservationVo> list_cancel_c(ReservationVo rvo){
		nowPage= rvo.getReservationPage();
		pageCompute5(rvo);
		rvo.setStartNo(startNo);
		rvo.setEndNo(endNo);
		List<ReservationVo> Templist =sqlSession.selectList("reservation.selectCAll2",rvo);
		List<ReservationVo> list = new ArrayList<ReservationVo>();
		for(ReservationVo vo:Templist){
			MemberVo mvo = sqlSession.selectOne("reservation.selectMem2",vo.getMem_se());
			vo.setStore(mvo.getIrum());
			list.add(vo);
		}
		return list;
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