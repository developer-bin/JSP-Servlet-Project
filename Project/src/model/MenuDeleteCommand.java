package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MenuDao;
import dto.MenuDto;

//식당의 메뉴를 삭제하기 위한 서비스 로직
public class MenuDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		String businessNumber=request.getParameter("businessNumber");
		String menuNumber=request.getParameter("menuNumber");
		
		MenuDao dao = MenuDao.getInstance();
		dao.deleteMenu(businessNumber, menuNumber);
		
		
	}

}
