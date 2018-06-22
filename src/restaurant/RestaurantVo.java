package restaurant;

import java.util.HashMap;
import java.util.Map;

public class RestaurantVo {
	int 	serial;
	String 	rname		= "";
	int	rtimeOpen;
	int	rtimeClose;
	String	rholiday	= "";
	String	rbathroom	= "";
	String	rdrink		= "";
	String	rfacilities = "";
	 String	raddress1	= "";
	 String	raddress2	= "";
	String	rdate		= "";
	int		rhit;
	String	rpwd		= "";
	int		rpoint;
	String 	mid			= "";
	int		mserial;
	String	rjuso		= "";
	String  rmenus		= "";
	String  rinfo		= "";
	
	int  rtable;
	String  rphone = "";
	
	String 	findStr 	= "";
	String 	msg			= "";
	String  orderBy		= "등록순";
	String[] rmName;
	String[] rmPrice;
	String[] rmExplain;
	String rmAttFile 	= "";
	int	pserial;
	
	Map<String,String> map = new HashMap<String,String>(); 
	
	int nowPage =1;
	int startNo = 0;
	int endNo   = 0;
	
	
	
	
	public int getPserial() {
		return pserial;
	}
	public void setPserial(int pserial) {
		this.pserial = pserial;
	}
	public String getRmAttFile() {
		return rmAttFile;
	}
	public void setRmAttFile(String rmAttFile) {
		this.rmAttFile = rmAttFile;
	}
	public Map<String, String> getMap() {
		return map;
	}
	public void setMap(Map<String, String> map) {
		this.map = map;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getMserial() {
		return mserial;
	}
	public void setMserial(int mserial) {
		this.mserial = mserial;
	}
	public String getRjuso() {
		return rjuso;
	}
	public void setRjuso(String rjuso) {
		this.rjuso = rjuso;
	}
	public int getSerial() {
		return serial;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	
	public String getRholiday() {
		return rholiday;
	}
	public void setRholiday(String rholiday) {
		this.rholiday = rholiday;
	}
	public String getRbathroom() {
		return rbathroom;
	}
	public void setRbathroom(String rbathroom) {
		this.rbathroom = rbathroom;
	}
	public String getRdrink() {
		return rdrink;
	}
	public void setRdrink(String rdrink) {
		this.rdrink = rdrink;
	}
	public String getRfacilities() {
		return rfacilities;
	}
	public void setRfacilities(String rfacilities) {
		this.rfacilities = rfacilities;
	}
	public String getRaddress1() {
		return raddress1;
	}
	public void setRaddress1(String raddress1) {
		this.raddress1 = raddress1;
	}
	public String getRaddress2() {
		return raddress2;
	}
	public void setRaddress2(String raddress2) {
		this.raddress2 = raddress2;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public int getRhit() {
		return rhit;
	}
	public String getRphone() {
		return rphone;
	}
	public void setRphone(String rphone) {
		this.rphone = rphone;
	}
	public void setRtable(int rtable) {
		this.rtable = rtable;
	}
	public void setRhit(int rhit) {
		this.rhit = rhit;
	}
	public String getRpwd() {
		return rpwd;
	}
	public void setRpwd(String rpwd) {
		this.rpwd = rpwd;
	}
	public int getRpoint() {
		return rpoint;
	}
	public void setRpoint(int rpoint) {
		this.rpoint = rpoint;
	}
	public String getFindStr() {
		return findStr;
	}
	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public String[] getRmName() {
		return rmName;
	}
	public void setRmName(String[] rmName) {
		this.rmName = rmName;
	}
	public String[] getRmPrice() {
		return rmPrice;
	}
	public void setRmPrice(String[] rmPrice) {
		this.rmPrice = rmPrice;
	}
	public String[] getRmExplain() {
		return rmExplain;
	}
	public void setRmExplain(String[] rmExplain) {
		this.rmExplain = rmExplain;
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

	public String getRmenus() {
		return rmenus;
	}
	public void setRmenus(String rmenus) {
		this.rmenus = rmenus;
	}
	public String getRinfo() {
		return rinfo;
	}
	public void setRinfo(String rinfo) {
		this.rinfo = rinfo;
	}
	public String getOrderBy() {
		return orderBy;
	}
	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public int getRtimeOpen() {
		return rtimeOpen;
	}
	public void setRtimeOpen(int rtimeOpen) {
		this.rtimeOpen = rtimeOpen;
	}
	public int getRtimeClose() {
		return rtimeClose;
	}
	public void setRtimeClose(int rtimeClose) {
		this.rtimeClose = rtimeClose;
	}
	public int getRtable() {
		return rtable;
	}
	
	
}
