package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReservationDao;
import dto.ReservationDto;

public class ReservationDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		String businessNumber=request.getParameter("businessNumber");
		String userId=request.getParameter("userId");
		
		ReservationDao dao=ReservationDao.getInstance();
		dao.deleteReservation(businessNumber, userId);
	}

}
