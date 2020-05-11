package dto;

public class RestaurantDto {
	private String restaurantName;
	private String businessNumber;
	private String category;
	
	public RestaurantDto(){}
	public RestaurantDto(String restaurantName ,String category, String businessNumber) {
		this.restaurantName=restaurantName;
		this.category=category;
		this.businessNumber=businessNumber;
	}
	
	
	public String getRestaurantName() {
		return restaurantName;
	}
	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}
	public String getBusinessNumber() {
		return businessNumber;
	}
	public void setBusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
	
}
