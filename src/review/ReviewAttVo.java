package review;

public class ReviewAttVo {
	int serial;
	int pserial;
	String attFile;
	String oriAttFile;
	public int getSerial() {
		return serial;
	}
	public int getPserial() {
		return pserial;
	}
	public String getAttFile() {
		return attFile;
	}
	public String getOriAttFile() {
		return oriAttFile;
	}
	public void setSerial(int serial) {
		this.serial = serial;
	}
	public void setPserial(int pserial) {
		this.pserial = pserial;
	}
	public void setAttFile(String attFile) {
		this.attFile = attFile;
	}
	public void setOriAttFile(String oriAttFile) {
		this.oriAttFile = oriAttFile;
	}
}
