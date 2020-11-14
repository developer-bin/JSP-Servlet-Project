package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CartDao;
import dto.CartDto;

//������� ���� �޴��� īƮ(��ٱ���)�� ����ϱ� ���� ���� ����
public class MenuCartCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		String restaurantName=request.getParameter("restaurantName");
		String businessNumber=request.getParameter("businessNumber");
		String menuName=request.getParameter("menuName");
		String menuText=request.getParameter("menuText");
		String menuPrice=request.getParameter("menuPrice");
		String menuNumber=request.getParameter("menuNumber");
		String userId=(String)session.getAttribute("id");
		
		CartDto dto=new CartDto(restaurantName,businessNumber,menuName,menuText,menuPrice,menuNumber,userId);
		CartDao dao=CartDao.getInstance();
		dao.insertCart(dto);
	}

}
