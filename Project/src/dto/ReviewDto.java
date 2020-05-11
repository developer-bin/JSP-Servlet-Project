package dto;

public class ReviewDto {
	private String businessNumber;
	private String userId;
	private String userName;
	private String starCount;
	private String reviewText;
	
	public ReviewDto() {}
	public ReviewDto(String businessNumber, String userId, String userName, String starCount, String reviewText) {
		this.businessNumber=businessNumber;
		this.userId=userId;
		this.userName=userName;
		this.starCount=starCount;
		this.reviewText=reviewText;
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getStarCount() {
		return starCount;
	}
	public void setStarCount(String starCount) {
		this.starCount = starCount;
	}
	public String getReviewText() {
		return reviewText;
	}
	public void setReviewText(String reviewText) {
		this.reviewText = reviewText;
	}

}
