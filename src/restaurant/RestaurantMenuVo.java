package restaurant;

public class RestaurantMenuVo {
	int		serial;
	int		pserial;
	String	rmName		= "";
	String	rmExplain	= "";
	String	rmPrice		= "";
	

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
	public String getRmName() {
		return rmName;
	}
	public void setRmName(String rmName) {
		this.rmName = rmName;
	}
	public String getRmExplain() {
		return rmExplain;
	}
	public void setRmExplain(String rmExplain) {
		this.rmExplain = rmExplain;
	}
	public String getRmPrice() {
		return rmPrice;
	}
	public void setRmPrice(String rmPrice) {
		this.rmPrice = rmPrice;
	}
	
	
}
