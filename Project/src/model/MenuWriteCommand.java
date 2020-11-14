package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MenuDao;
import dto.MenuDto;

//식당 메뉴를 등록하기 위한 서비스 로직
public class MenuWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String sessionBusinessNumber=(String)session.getAttribute("businessNumber");
		String sessionRestaurantName=(String)session.getAttribute("restaurantName");
		
		String menuNumber=(String)session.getAttribute("mNum");		
		
		MenuDto Mdto=new MenuDto();
		Mdto.setbusinessNumber(sessionBusinessNumber);
		Mdto.setRestaurantName(sessionRestaurantName);
		Mdto.setmenuPrice(request.getParameter("menuPrice"));
		Mdto.setmenuText(request.getParameter("menuText"));
		Mdto.setmenuName(request.getParameter("menuName"));
		Mdto.setMenuNumber(menuNumber);
		int menuNum=Integer.parseInt(menuNumber);
		menuNum++;
		String menuPlusNum=String.valueOf(menuNum);
		session.setAttribute("mNum",menuPlusNum);
		MenuDao dao = MenuDao.getInstance();
		int ri=dao.insertMenu(Mdto);
		
		
	}

}
