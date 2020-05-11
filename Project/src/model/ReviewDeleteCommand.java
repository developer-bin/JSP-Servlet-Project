package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReviewDao;

public class ReviewDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String sessionid=(String)session.getAttribute("id");
		String businessNumber = request.getParameter("businessNumber");

		ReviewDao dao=ReviewDao.getInstance();
		
		dao.deleteReview(businessNumber, sessionid);
		
	}

}
