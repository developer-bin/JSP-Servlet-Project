package dto;

public class MenuDto {
	private String restaurantName;
	private String businessNumber;
	private String menuName;
	private String menuText;
	private String menuPrice;
	private String menuNumber;
	

	public MenuDto() {
		// TODO Auto-generated constructor stub
	}
	
	public MenuDto(String restaurantName,String businessNumber,String menuName,String menuText,String menuPrice,String menuNumber) {
		// TODO Auto-generated constructor stub
		this.restaurantName=restaurantName;
		this.businessNumber=businessNumber;
		this.menuName=menuName;
		this.menuText=menuText;
		this.menuPrice=menuPrice;
		this.menuNumber=menuNumber;
	}
	
	
	public String getMenuNumber() {
		return menuNumber;
	}

	public void setMenuNumber(String menuNumber) {
		this.menuNumber = menuNumber;
	}
	
	
	public String getbusinessNumber() {
		return businessNumber;
	}

	public void setbusinessNumber(String businessNumber) {
		this.businessNumber = businessNumber;
	}
	
	
	public String getmenuName() {
		return menuName;
	}

	public void setmenuName(String menuName) {
		this.menuName = menuName;
	}
	
	
	public String getmenuText() {
		return menuText;
	}

	public void setmenuText(String menuText) {
		this.menuText = menuText;
	}
	
	
	public String getmenuPrice() {
		return menuPrice;
	}

	public void setmenuPrice(String menuPrice) {
		this.menuPrice = menuPrice;
	}
	
	public String getRestaurantName() {
		return restaurantName;
	}

	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}
	

	
	
}
