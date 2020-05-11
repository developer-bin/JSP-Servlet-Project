package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReservationDao;
import dto.ReservationDto;

public class ReservationCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		String businessNumber=request.getParameter("businessNumber");
		String userName=(String)session.getAttribute("name");
		String userMail=request.getParameter("userMail");
		String userPhone=request.getParameter("userPhone");
		String userDate=request.getParameter("userDate");
		String userTime=request.getParameter("userTime");
		String userSit=request.getParameter("userSit");
		String userId=(String)session.getAttribute("id");
		
		ReservationDto dto=new ReservationDto(businessNumber,userName,userMail,userPhone,userDate,userTime,userSit,userId);
		ReservationDao dao=ReservationDao.getInstance();
		dao.insertReservation(dto);
	}

}
