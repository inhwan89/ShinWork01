package accommodation;

import java.util.List;
import java.util.Map;

public class AccommodationVo {
	int serial;
	int pserial;
	int rserial;
	String aname="";
	String mdate;
	String worker="";
	String parkingspace = "";
	String freeparking = "";
	String freemeal = "";
	String aircondition = "";
	String pool = "";
	String nosmoking = "";
	String restaurant = "";
	String freewifi = "";
	String fitness= "";
	int hit;
	String content = "";
	String address1 = "";
	String address2 = "";
	String address3 = "";
	String attfileshow = "";
	String privacy="";
	String part = "";
	String delfile;
	String map_key;
	String map_value;
	String email = "";
	String phone = "";
	String findStr = "";
	int startNo = 0;
	int endNo = 0;
	int acco_nowPage = 1;
	int acco_nowPage1 = 1;
	
	double avg;
	
	String [] part_list;
	
	
	Map<String, String> attFile;
	String[] deleteAtt;
	List<RoomVo> list;
	String[] deleteAttG;
	
	public int getSerial() {
		return serial;
	}

	public void setSerial(int serial) {
		this.serial = serial;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getMdate() {
		return mdate;
	}

	public void setMdate(String mdate) {
		this.mdate = mdate;
	}

	public String getWorker() {
		return worker;
	}

	public void setWorker(String worker) {
		this.worker = worker;
	}

	public String getFreeparking() {
		return freeparking;
	}

	public void setFreeparking(String freeparking) {
		this.freeparking = freeparking;
	}

	public String getFreemeal() {
		return freemeal;
	}

	public void setFreemeal(String freemeal) {
		this.freemeal = freemeal;
	}

	public String getAircondition() {
		return aircondition;
	}

	public void setAircondition(String aircondition) {
		this.aircondition = aircondition;
	}

	public String getPool() {
		return pool;
	}

	public void setPool(String pool) {
		this.pool = pool;
	}

	public String getNosmoking() {
		return nosmoking;
	}

	public void setNosmoking(String nosmoking) {
		this.nosmoking = nosmoking;
	}

	public String getFreewifi() {
		return freewifi;
	}

	public void setFreewifi(String freewifi) {
		this.freewifi = freewifi;
	}

	public String getFitness() {
		return fitness;
	}

	public void setFitness(String fitness) {
		this.fitness = fitness;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getAddress3() {
		return address3;
	}

	public void setAddress3(String address3) {
		this.address3 = address3;
	}

	public String getPrivacy() {
		return privacy;
	}

	public void setPrivacy(String privacy) {
		this.privacy = privacy;
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

	public String getParkingspace() {
		return parkingspace;
	}

	public void setParkingspace(String parkingspace) {
		this.parkingspace = parkingspace;
	}

	public String getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(String restaurant) {
		this.restaurant = restaurant;
	}

	public List<RoomVo> getList() {
		return list;
	}

	public void setList(List<RoomVo> list) {
		this.list = list;
	}

	public String getAttfileshow() {
		return attfileshow;
	}

	public void setAttfileshow(String attfileshow) {
		this.attfileshow = attfileshow;
	}

	public int getPserial() {
		return pserial;
	}

	public void setPserial(int pserial) {
		this.pserial = pserial;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}

	public String getDelfile() {
		return delfile;
	}

	public void setDelfile(String delfile) {
		this.delfile = delfile;
	}

	public int getRserial() {
		return rserial;
	}

	public void setRserial(int rserial) {
		this.rserial = rserial;
	}

	public String getMap_key() {
		return map_key;
	}

	public void setMap_key(String map_key) {
		this.map_key = map_key;
	}

	public String getMap_value() {
		return map_value;
	}

	public void setMap_value(String map_value) {
		this.map_value = map_value;
	}

	public String[] getDeleteAttG() {
		return deleteAttG;
	}

	public void setDeleteAttG(String[] deleteAttG) {
		this.deleteAttG = deleteAttG;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getFindStr() {
		return findStr;
	}

	public void setFindStr(String findStr) {
		this.findStr = findStr;
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

	public int getAcco_nowPage() {
		return acco_nowPage;
	}

	public void setAcco_nowPage(int acco_nowPage) {
		this.acco_nowPage = acco_nowPage;
	}

	public int getAcco_nowPage1() {
		return acco_nowPage1;
	}

	public void setAcco_nowPage1(int acco_nowPage1) {
		this.acco_nowPage1 = acco_nowPage1;
	}

	public String[] getPart_list() {
		return part_list;
	}

	public void setPart_list(String[] part_list) {
		this.part_list = part_list;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}


	
	
	
}