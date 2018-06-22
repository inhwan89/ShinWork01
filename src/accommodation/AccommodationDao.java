package accommodation;

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
import restaurant.RestaurantVo;

public class AccommodationDao {
	int size = 1024 * 1024 * 10;
	String encode = "utf-8";
	int listSize = 6; // 한 페이지에 표시될 데이터의 개수
	int blockSize = 2; // 한 블록당 표시될 페이지 번호의 개수
	int totSize = 0; // 검색된 결과의 전체 개수
	int totPage = 0; // 전체 페이지 수
	int totBlock = 1; // 전체 블록 수

	int acco_nowPage = 1; // 현재 페이지
	int nowBlock = 1; // 현재 블록

	int startPage = 1; // 표시될 페이지의 시작번호
	int endPage = 5; // 표시될 페이지의 끝번호

	int startNo = 1; // 표시된 데이터의 시작번호
	int endNo = 2; // 표시된 데이터의 끝번호
	
	String sDirectory = "C:/Program Files/Apache Software Foundation/Tomcat 8.0/webapps/FinalProject/accommodation/accommodation_album/";
	String sDirectory2 = "C:\\Program Files\\Apache Software Foundation\\Tomcat 8.0\\webapps\\FinalProject\\accommodation\\accommodation_album\\";
	String thumbPath = "C:/Program Files/Apache Software Foundation/Tomcat 8.0/webapps/FinalProject/accommodation/accommodation_album_thumbnail/";

	SqlSession sqlSession;

	public AccommodationDao() {
		sqlSession = FinalFactory.getFactory().openSession();
	}

	public void pageCompute(AccommodationVo vo) {
		totSize = sqlSession.selectOne("accommodation.page", vo);

		totPage = (int) Math.ceil(totSize / (double) listSize);// 전체 페이지 수
		totBlock = (int) Math.ceil(totPage / (double) blockSize);// 전체 블록 수

		nowBlock = (int) Math.ceil(acco_nowPage / (double) blockSize);// 현재 블록

		endPage = blockSize * nowBlock;// 표시될 페이지의 끝번호
		startPage = endPage - blockSize + 1;// 표시될 페이지의 시작번호

		if (endPage > totPage)
			endPage = totPage;

		endNo = acco_nowPage * listSize;// 표시된 데이터의 끝번호
		startNo = endNo - listSize + 1;// 표시된 데이터의 시작번호

		if (endNo > totSize)
			endNo = totSize;
	}

	public String save(HttpServletRequest req) {
		String msg = "정상적으로 입력 되었습니다.";
		try {
			AccommodationVo vo = fileSave(req);
			int r = sqlSession.insert("accommodation.insertM", vo);

			for (String key : vo.attFile.keySet()) {
				vo.setMap_key(key);
				vo.setMap_value(vo.attFile.get(key));

				String tag = vo.attFile.get(key);
				String tag_sub = tag.substring(7, tag.length());
				int tag_num = Integer.parseInt(tag_sub);

				if (tag_num == 0) {
					vo.setRserial(0);
				} else {
					vo.setRserial(((tag_num - 1) / 5) + 1);
				}
				r = sqlSession.insert("accommodation.insertP", vo);
				if (r < 1)
					msg = "저장중 오류 발생";
			}

			for (int i = 0; i < vo.getList().size(); i++) {
				int r2 = sqlSession.insert("accommodation.insertR", vo.getList().get(i));
				if (r2 < 1)
					msg = "저장중 오류 발생";
			}
			sqlSession.commit();

		} catch (Exception ex) {
			msg = "저장중 예외 발생...";
			ex.printStackTrace();
			sqlSession.rollback();
		}
		return msg;
	}

	public List<List<AccommodationVo>> list(AccommodationVo vo) {
		String[] part_list = { "리조트", "호텔", "모텔", "게스트하우스" };
		vo.setPart_list(part_list);
		List<List<AccommodationVo>> list4 = new ArrayList<List<AccommodationVo>>();
		for (int i = 0; i < vo.getPart_list().length; i++) {
			vo.setPart(part_list[i]);
			List<AccommodationVo> list = sqlSession.selectList("accommodation.select", vo);
			List<AccommodationVo> tempList = new ArrayList<AccommodationVo>();
			for (AccommodationVo v : list) {
				double avg=review(v);
				v.setAvg(avg);
				AccommodationVo tempvo=v;
				tempList.add(tempvo);
			}
			list4.add(tempList);
		}
		return list4;
	}

	public List<RestaurantVo> list_restaurant(AccommodationVo vo) {
		List<RestaurantVo> list2 = sqlSession.selectList("accommodation.list_restaurant", vo);
		return list2;
	}

	public List<AccommodationVo> list_detail(AccommodationVo vo) {
		acco_nowPage = vo.getAcco_nowPage();
		pageCompute(vo);
		vo.setStartNo(startNo);
		vo.setEndNo(endNo);
		List<AccommodationVo> list = sqlSession.selectList("accommodation.select_detail", vo);
		return list;
	}

	public AccommodationVo selectOne(AccommodationVo vo) {
		sqlSession.update("accommodation.updateHit", vo.getSerial());
		sqlSession.commit();
		AccommodationVo vo1 = sqlSession.selectOne("accommodation.selectOne", vo.getSerial());
		return vo1;
	}

	public List<RoomVo> roomList(AccommodationVo vo) {
		List<RoomVo> list = new ArrayList<RoomVo>();
		list = sqlSession.selectList("accommodation.roomList", vo.getSerial());
		return list;
	}

	public double review(AccommodationVo vo) {
		String temp = sqlSession.selectOne("accommodation.review", vo.getSerial());
		double avg = 0;
		if (temp != null) {
			avg = Double.parseDouble(temp);
		}
		return avg;
	}

	public RoomVo picList(AccommodationVo vo1, int rsize) {
		RoomVo vo = new RoomVo();
		List<RoomAttVo> picList = sqlSession.selectList("accommodation.picList", vo1.getSerial());
		Map<String, String> map = new HashMap<String, String>();
		for (RoomAttVo attVo : picList) {
			map.put(attVo.getOriattFile(), attVo.getAttFile());
		}

		List<String> list = new ArrayList<String>();
		int cnt = 0;
		for (int i = 0; i < rsize * 5 + 1; i++) {
			String temp = map.get("attfile" + cnt);
			list.add(i, temp);
			cnt++;
		}
		vo.setPicList(list);
		return vo;

	}

	public String modify(HttpServletRequest req) {
		String msg = "정상적으로 입력 되었습니다.";
		try {
			AccommodationVo vo = fileSave(req);

			// room 삭제
			int r = sqlSession.delete("accommodation.deleteR", vo);
			// accommodation 정보 업데이트
			r = sqlSession.update("accommodation.modify", vo);
			sqlSession.commit();
			// 사진 업로드
			if (vo.attFile.size() > 0) {
				for (String key : vo.attFile.keySet()) {
					vo.setMap_key(key);
					vo.setMap_value(vo.attFile.get(key));

					String tag = vo.attFile.get(key);
					String tag_sub = tag.substring(7, tag.length());
					int tag_num = Integer.parseInt(tag_sub);

					if (tag_num == 0) {
						vo.setRserial(0);
					} else {
						vo.setRserial(((tag_num - 1) / 5) + 1);
					}
					r = sqlSession.insert("accommodation.modifyP", vo);
					sqlSession.commit();
				}
			}

			// 자바와 데이터 베이스에 있는 있는 사진정보 삭제
			if (vo.getDeleteAtt() != null) {
				for (String delFile : vo.getDeleteAtt()) {
					sqlSession.delete("accommodation.deleteP", delFile);
					sqlSession.commit();
					File file = new File(sDirectory + delFile);
					File file2 = new File(thumbPath + "thumb_" + delFile);
					if (file.exists())
						file.delete();
					if (file2.exists())
						file2.delete();
				}
			}

			// 방 정보 안에 있는 사진 지우기
			if (vo.getDeleteAttG() != null) {
				List<AccommodationVo> list = new ArrayList<AccommodationVo>();
				for (String delFile : vo.getDeleteAttG()) {
					list = sqlSession.selectList("accommodation.selectP", Integer.parseInt(delFile));
					for (int i = 0; i < list.size(); i++) {
						File file = new File(sDirectory + list.get(i).getDelfile());
						if (file.exists())
							file.delete();
					}
				}
			}

			// 방정보 안에 있는 사진정보 데이터베이스에서 지우기
			if (vo.getDeleteAttG() != null) {
				for (String delFile : vo.getDeleteAttG()) {
					sqlSession.delete("accommodation.deletePG", Integer.parseInt(delFile));
					sqlSession.commit();
				}
			}

			// room 정보 추가
			if (vo.getList() != null) {
				for (int i = 0; i < vo.getList().size(); i++) {
					r = sqlSession.insert("accommodation.modifyR", vo.getList().get(i));
				}

				if (r < 1) {
					msg = "저장중 오류 발생";
					sqlSession.rollback();
				} else {
					sqlSession.commit();
				}

			}

		} catch (Exception ex) {
			msg = "저장중 예외 발생...";
			ex.printStackTrace();
			sqlSession.rollback();
		}
		return msg;
	}

	public String delete(HttpServletRequest req) {
		String msg = "정상적으로 입력 되었습니다.";
		int serial = Integer.parseInt(req.getParameter("serial"));

		// 특정 Accommodation 전체 방 사진 삭제하기
		List<AccommodationVo> list = new ArrayList<AccommodationVo>();
		list = sqlSession.selectList("accommodation.selectPToDel", serial);
		for (int i = 0; i < list.size(); i++) {
			File file = new File(sDirectory + list.get(i).getDelfile());
			File file2 = new File(thumbPath + "thumb_" + list.get(i).getDelfile());

			if (file.exists())
				file.delete();
			if (file2.exists())
				file2.delete();
		}

		// 데이터 베이스에 있는 사진 정보 지우기
		int r = sqlSession.delete("accommodation.delAllP", serial);
		r = sqlSession.delete("accommodation.delAllA", serial);
		r = sqlSession.delete("accommodation.delAllR", serial);
		if (r < 1) {
			msg = "삭제중 오류 발생";
			sqlSession.rollback();
		} else {
			sqlSession.commit();
		}

		return msg;
	}

	public AccommodationVo fileSave(HttpServletRequest req) {
		AccommodationVo vo = new AccommodationVo();
		try {
			MultipartRequest multi = new MultipartRequest(req, sDirectory, size, encode, new DefaultFileRenamePolicy());

			// BoardVo에 저장할 값을 set한다.

			if (multi.getParameter("rserial") != null) {
				vo.setRserial(Integer.parseInt(multi.getParameter("rserial")));
			}

			if (multi.getParameter("serial") != null) {
				vo.setSerial(Integer.parseInt(multi.getParameter("serial")));
			}

			if (multi.getParameter("worker") != null) {
				vo.setWorker(multi.getParameter("worker"));
			}
			if (multi.getParameter("content") != null) {
				vo.setContent(multi.getParameter("content"));
			}
			if (multi.getParameter("aname") != null) {
				vo.setAname(multi.getParameter("aname"));
			}

			if (multi.getParameter("phone") != null) {
				vo.setPhone(multi.getParameter("phone"));
			}

			if (multi.getParameter("email") != null) {
				vo.setEmail(multi.getParameter("email"));
			}

			if (multi.getParameter("freeparking") == null) {
				vo.setFreeparking("X");
			} else {
				vo.setFreeparking(multi.getParameter("freeparking"));
			}
			if (multi.getParameter("freemeal") == null) {
				vo.setFreemeal("X");
			} else {
				vo.setFreemeal(multi.getParameter("freemeal"));
			}
			if (multi.getParameter("aircondition") == null) {
				vo.setAircondition("X");
			} else {
				vo.setAircondition(multi.getParameter("aircondition"));
			}
			if (multi.getParameter("pool") == null) {
				vo.setPool("X");
			} else {
				vo.setPool(multi.getParameter("pool"));
			}
			if (multi.getParameter("nosmoking") == null) {
				vo.setNosmoking("X");
			} else {
				vo.setNosmoking(multi.getParameter("nosmoking"));
			}
			if (multi.getParameter("restaurant") == null) {
				vo.setRestaurant("X");
			} else {
				vo.setRestaurant(multi.getParameter("restaurant"));
			}

			if (multi.getParameter("freewifi") == null) {
				vo.setFreewifi("X");
			} else {
				vo.setFreewifi(multi.getParameter("freewifi"));
			}
			if (multi.getParameter("fitness") == null) {
				vo.setFitness("X");
			} else {
				vo.setFitness(multi.getParameter("fitness"));
			}
			if (multi.getParameter("parkingspace") != null) {
				vo.setParkingspace(multi.getParameter("parkingspace"));
			}
			if (multi.getParameter("address1") != null) {
				vo.setAddress1(multi.getParameter("address1"));
			}
			if (multi.getParameter("address2") != null) {
				vo.setAddress2(multi.getParameter("address2"));
			}
			if (multi.getParameter("address3") != null) {
				vo.setAddress3(multi.getParameter("address3"));
			}
			if (multi.getParameter("privacy") != null) {
				vo.setPrivacy(multi.getParameter("privacy"));
			}
			if (multi.getParameter("part") != null) {
				vo.setPart(multi.getParameter("part"));
			}

			// 첨부파일을 map을 만듬
			Map<String, String> map = new HashMap<String, String>();
			Enumeration<String> e = multi.getFileNames();
			while (e.hasMoreElements()) {
				String tag = (String) e.nextElement();
				String value = multi.getOriginalFileName(tag);
				String key = multi.getFilesystemName(tag);

				if (tag.equals("attfile0") && key != null) {
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

				if (value == null)
					continue;
				map.put(key, tag);
			}
			vo.setAttFile(map);

			if (multi.getParameterValues("deleteAtt") != null) {
				String[] temp = multi.getParameterValues("deleteAtt");
				vo.setDeleteAtt(temp);
			}

			if (multi.getParameterValues("rserial") != null) {
				String[] temp = multi.getParameterValues("rserial");
				vo.setDeleteAttG(temp);
			}

			List<RoomVo> list = new ArrayList<RoomVo>();

			for (int i = 0; i < multi.getParameterValues("room").length; i++) {
				RoomVo vo1 = new RoomVo();

				if (multi.getParameterValues("pserial") != null) {
					vo1.setPserial(Integer.parseInt(multi.getParameterValues("pserial")[i]));
				}

				if (!multi.getParameterValues("room")[i].equals("")) {
					vo1.setRoom(multi.getParameterValues("room")[i]);
				} else {
					vo1.setRoom("");
				}

				if (!multi.getParameterValues("room_num")[i].equals("")) {
					vo1.setRoom_num(Integer.parseInt(multi.getParameterValues("room_num")[i]));
				} else {
					vo1.setRoom_num(0);
				}

				if (!multi.getParameterValues("checkin")[i].equals("")) {
					vo1.setCheckin(multi.getParameterValues("checkin")[i]);
				} else {
					vo1.setCheckin("");
				}

				if (!multi.getParameterValues("checkins")[i].equals("")) {
					vo1.setCheckins(multi.getParameterValues("checkins")[i]);
				} else {
					vo1.setCheckins("");
				}

				if (!multi.getParameterValues("checkout")[i].equals("")) {
					vo1.setCheckout(multi.getParameterValues("checkout")[i]);
				} else {
					vo1.setCheckout("");
				}

				if (!multi.getParameterValues("checkouts")[i].equals("")) {
					vo1.setCheckouts(multi.getParameterValues("checkouts")[i]);
				} else {
					vo1.setCheckouts("");
				}

				if (!multi.getParameterValues("weekdayss")[i].equals("")) {
					vo1.setWeekdayss(Integer.parseInt(multi.getParameterValues("weekdayss")[i]));
				} else {
					vo1.setWeekdayss(0);
				}
				if (!multi.getParameterValues("weekdays")[i].equals("")) {
					vo1.setWeekdays(Integer.parseInt(multi.getParameterValues("weekdays")[i]));
				} else {
					vo1.setWeekdays(0);
				}
				if (!multi.getParameterValues("weekendss")[i].equals("")) {
					vo1.setWeekendss(Integer.parseInt(multi.getParameterValues("weekendss")[i]));
				} else {
					vo1.setWeekendss(0);
				}
				if (!multi.getParameterValues("weekends")[i].equals("")) {
					vo1.setWeekends(Integer.parseInt(multi.getParameterValues("weekends")[i]));
				} else {
					vo1.setWeekends(0);
				}
				if (!multi.getParameterValues("rcontent")[i].equals("")) {
					vo1.setRcontent(multi.getParameterValues("rcontent")[i]);
				} else {
					vo1.setRcontent("");
				}

				vo1.setR_breakfast(multi.getParameterValues("r_breakfast")[i]);
				vo1.setR_pc(multi.getParameterValues("r_pc")[i]);
				vo1.setR_tv(multi.getParameterValues("r_tv")[i]);
				vo1.setR_wifi(multi.getParameterValues("r_wifi")[i]);
				vo1.setR_bath(multi.getParameterValues("r_bath")[i]);

				list.add(vo1);
			}
			vo.setList(list);

		} catch (Exception ex) {
			ex.printStackTrace();
			sqlSession.rollback();
		}
		return vo;
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

	public int getAcco_nowPage() {
		return acco_nowPage;
	}

	public void setAcco_nowPage(int acco_nowPage) {
		this.acco_nowPage = acco_nowPage;
	}

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
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

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

}