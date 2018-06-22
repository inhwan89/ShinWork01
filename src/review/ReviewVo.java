package review;

import java.util.List;
import java.util.Map;

public class ReviewVo {
	
	int reviewPage=1;
	String findStr="";
	int serial;
	int service;
	int quality;
	int cleans;
	double avg;
	String store;
	String subject;
	String content;
	String seasons;
	String posted_date;
	String worker;
	List<String> attlist;
	Map<String, String> attFile;
	String msg;
	String[] deleteAtt;
	int StartNo;
	int endNo;
	int rserial;
	String mdate;
	String address1;
	String address2;
	int acc_se;
	int res_se;
	
	public String getMdate() {
		return mdate;
	}

	public void setMdate(String mdate) {
		this.mdate = mdate;
	}

	public int getRserial() {
		return rserial;
	}

	public void setRserial(int rserial) {
		this.rserial = rserial;
	}

	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public int getStartNo() {
		return StartNo;
	}

	public int getEndNo() {
		return endNo;
	}

	public void setStartNo(int startNo) {
		StartNo = startNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public String getWorker() {
		return worker;
	}

	public void setWorker(String worker) {
		this.worker = worker;
	}

	public String[] getDeleteAtt() {
		return deleteAtt;
	}

	public void setDeleteAtt(String[] deleteAtt) {
		this.deleteAtt = deleteAtt;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getFindStr() {
		return findStr;
	}

	public int getSerial() {
		return serial;
	}

	public int getService() {
		return service;
	}

	public int getQuality() {
		return quality;
	}

	public int getCleans() {
		return cleans;
	}

	public String getSubject() {
		return subject;
	}

	public String getContent() {
		return content;
	}

	public String getSeasons() {
		return seasons;
	}

	public String getPosted_date() {
		return posted_date;
	}

	public Map<String, String> getAttFile() {
		return attFile;
	}
	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}

	public void setSerial(int serial) {
		this.serial = serial;
	}

	public void setService(int service) {
		this.service = service;
	}

	public void setQuality(int quality) {
		this.quality = quality;
	}

	public void setCleans(int cleans) {
		this.cleans = cleans;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setSeasons(String seasons) {
		this.seasons = seasons;
	}

	public void setPosted_date(String posted_date) {
		this.posted_date = posted_date;
	}

	public void setAttFile(Map<String, String> attFile) {
		this.attFile = attFile;
	}

	public List<String> getAttlist() {
		return attlist;
	}

	public void setAttlist(List<String> attlist) {
		this.attlist = attlist;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}

	public String getAddress1() {
		return address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public int getReviewPage() {
		return reviewPage;
	}

	public void setReviewPage(int reviewPage) {
		this.reviewPage = reviewPage;
	}

	public int getAcc_se() {
		return acc_se;
	}

	public int getRes_se() {
		return res_se;
	}

	public void setAcc_se(int acc_se) {
		this.acc_se = acc_se;
	}

	public void setRes_se(int res_se) {
		this.res_se = res_se;
	}

	
}
