package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.GoogleMapDao;
import dto.GoogleMapDto;

public class MapCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String sessionBusinessNumber=(String)session.getAttribute("businessNumber");
		String googledata = request.getParameter("googledata");
		GoogleMapDao dao=GoogleMapDao.getInstance();
		GoogleMapDto dto=new GoogleMapDto(sessionBusinessNumber,googledata);
		dao.insertMap(dto);
		
	}

}
