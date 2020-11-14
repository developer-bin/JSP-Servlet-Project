package model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.ReviewDao;
import dto.ReviewDto;

//식당 리뷰를 수정하기 위한 서비스 로직
public class ReviewModifyCommand implements Command {

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
		
		dao.updateReview(dto);
		
	}

}
