package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReviewDao;
import dto.ReviewDto;

public class ReviewWriteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String sessionid=(String)session.getAttribute("id");
		String sessionName=(String)session.getAttribute("name");
		String businessNumber = request.getParameter("businessNumber");
		String starCount = request.getParameter("starCount");
		String reviewText = request.getParameter("reviewText");
		
		ReviewDao dao=ReviewDao.getInstance();
		ReviewDto dto=new ReviewDto(businessNumber,sessionid,sessionName,starCount,reviewText);
		
		dao.insertReview(dto);
		
	}

}
