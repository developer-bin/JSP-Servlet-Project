package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.RestaurantDao;

//식당을 등록하기 위한 서비스 로직
public class RegisterRestaurantCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		String restaurantName = request.getParameter("restaurantName");
		String category = request.getParameter("category");
		String businessNumber = request.getParameter("businessNumber");
		
		RestaurantDao dao = new RestaurantDao();
		dao.insertRestaurant(restaurantName, category, businessNumber);
		
		
	}

}
