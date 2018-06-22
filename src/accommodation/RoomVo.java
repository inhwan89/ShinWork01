package accommodation;

import java.util.List;
import java.util.Map;

public class RoomVo {
	int serial;
	int pserial;
	int rserial;
	String room ="";
	String checkin ="";
	String checkins ="";
	String checkout = "";
	String checkouts ="";
	int room_num;
	int weekdayss;
	int weekdays;
	int weekends;
	int weekendss;
	String rcontent = "";
	String worker;
	String file;
	String r_wifi;
	String r_bath;
	String r_breakfast;
	String r_tv;
	String r_pc;
	
	List<RoomVo> list;
	
	Map<String, String> attFile;
	String[] deleteAtt;
	
	List<String> picList;

	
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	
	public int getPserial() {
		return pserial;
	}
	public void setPserial(int pserial) {
		this.pserial = pserial;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	
	public int getRoom_num() {
		return room_num;
	}
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	public int getWeekdays() {
		return weekdays;
	}
	public void setWeekdays(int weekdays) {
		this.weekdays = weekdays;
	}
	public int getWeekends() {
		return weekends;
	}
	public void setWeekends(int weekends) {
		this.weekends = weekends;
	}
	public String getWorker() {
		return worker;
	}
	public void setWorker(String worker) {
		this.worker = worker;
	}
	public List<RoomVo> getList() {
		return list;
	}
	public void setList(List<RoomVo> list) {
		this.list = list;
	}
	public Map<String, String> getAttFile() {
		return attFile;
	}
	public void setAttFile(Map<String, String> attFile) {
		this.attFile = attFile;
	}
	public String[] getDeleteAtt() {
		return deleteAtt;
	}
	public void setDeleteAtt(String[] deleteAtt) {
		this.deleteAtt = deleteAtt;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public List<String> getPicList() {
		return picList;
	}
	public void setPicList(List<String> picList) {
		this.picList = picList;
	}
	public int getRserial() {
		return rserial;
	}
	public void setRserial(int rserial) {
		this.rserial = rserial;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckins() {
		return checkins;
	}
	public void setCheckins(String checkins) {
		this.checkins = checkins;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public String getCheckouts() {
		return checkouts;
	}
	public void setCheckouts(String checkouts) {
		this.checkouts = checkouts;
	}
	public int getWeekdayss() {
		return weekdayss;
	}
	public void setWeekdayss(int weekdayss) {
		this.weekdayss = weekdayss;
	}
	public int getWeekendss() {
		return weekendss;
	}
	public void setWeekendss(int weekendss) {
		this.weekendss = weekendss;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getR_wifi() {
		return r_wifi;
	}
	public void setR_wifi(String r_wifi) {
		this.r_wifi = r_wifi;
	}
	public String getR_bath() {
		return r_bath;
	}
	public void setR_bath(String r_bath) {
		this.r_bath = r_bath;
	}
	public String getR_breakfast() {
		return r_breakfast;
	}
	public void setR_breakfast(String r_breakfast) {
		this.r_breakfast = r_breakfast;
	}
	public String getR_tv() {
		return r_tv;
	}
	public void setR_tv(String r_tv) {
		this.r_tv = r_tv;
	}
	public String getR_pc() {
		return r_pc;
	}
	public void setR_pc(String r_pc) {
		this.r_pc = r_pc;
	}
	
	
	
}
