package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.RestaurantDao;

//�Ĵ��� ����ϱ� ���� ���� ����
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
