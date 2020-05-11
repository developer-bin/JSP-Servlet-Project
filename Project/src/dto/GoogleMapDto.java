package dto;

public class GoogleMapDto {
	private String businessNumber;
	private String googledata;
	
	public GoogleMapDto() {}
	public GoogleMapDto(String businessNumber, String googledata) {
		this.businessNumber=businessNumber;
		this.googledata=googledata;
	}
	public String getBusinessNumber() {
		return businessNumber;
	}
	public void setBusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}
	public String getGoogledata() {
		return googledata;
	}
	public void setGoogledata(String googledata) {
		this.googledata = googledata;
	}
}
