package dto;

public class CartDto {
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

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuText() {
		return menuText;
	}

	public void setMenuText(String menuText) {
		this.menuText = menuText;
	}

	public String getMenuPrice() {
		return menuPrice;
	}

	public void setMenuPrice(String menuPrice) {
		this.menuPrice = menuPrice;
	}

	public String getMenuNumber() {
		return menuNumber;
	}

	public void setMenuNumber(String menuNumber) {
		this.menuNumber = menuNumber;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	private String restaurantName;
	private String businessNumber;
	private String menuName;
	private String menuText;
	private String menuPrice;
	private String menuNumber;
	private String userId;

	public CartDto() {
		// TODO Auto-generated constructor stub
	}
	
	public CartDto(String restaurantName,String businessNumber,String menuName,String menuText,String menuPrice,String menuNumber,String userId) {
		// TODO Auto-generated constructor stub
		this.restaurantName=restaurantName;
		this.businessNumber=businessNumber;
		this.menuName=menuName;
		this.menuText=menuText;
		this.menuPrice=menuPrice;
		this.menuNumber=menuNumber;
		this.userId=userId;
	}
}
