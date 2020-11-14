package dto;

//구글 맵 api에 대한 정보 (api key 값을 담는것은 googledata)를 표현
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
