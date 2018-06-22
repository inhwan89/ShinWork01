package restaurant;

public class RestaurantPhotoVo {
	int		serial;
	int		pserial;
	String	tagName		= "";
	String	rmAttFile	= "";

	
	
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
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public String getRmAttFile() {
		return rmAttFile;
	}
	public void setRmAttFile(String rmAttFile) {
		this.rmAttFile = rmAttFile;
	}
}
