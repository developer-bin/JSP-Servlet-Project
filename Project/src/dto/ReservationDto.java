package dto;

public class ReservationDto {
	
	private String businessNumber;
	private String userName;
	
	private String userMail;
	private String userPhone;
	private String userDate;
	private String userTime;
	private String userSit;
	private String userId;
	
	
	public ReservationDto() {}
	public ReservationDto(String businessNumber,String userName,String userMail,String userPhone,String userDate,String userTime,String userSit,String userId) {
		this.businessNumber=businessNumber;
		this.userName=userName;
		this.userMail=userMail;
		this.userPhone=userPhone;
		this.userDate=userDate;
		this.userTime=userTime;
		this.userSit=userSit;
		this.userId=userId;
	}
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	public String getBusinessNumber() {
		return businessNumber;
	}
	public void setBusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}

	public String getUserMail() {
		return userMail;
	}
	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserDate() {
		return userDate;
	}
	public void setUserDate(String userDate) {
		this.userDate = userDate;
	}
	public String getUserTime() {
		return userTime;
	}
	public void setUserTime(String userTime) {
		this.userTime = userTime;
	}
	public String getUserSit() {
		return userSit;
	}
	public void setUserSit(String userSit) {
		this.userSit = userSit;
	}
	
	
	
	
	
	
	
}
