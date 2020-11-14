package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import model.Command;
import model.MapCommand;
import model.MenuCartCommand;
import model.MenuDeleteCommand;
import model.MenuWriteCommand;
import model.RegisterRestaurantCommand;
import model.ReservationCommand;
import model.ReservationDeleteCommand;
import model.ReviewDeleteCommand;
import model.ReviewModifyCommand;
import model.ReviewWriteCommand;



/**
 * Servlet implementation class BoardFrontController
 */
@WebServlet("*.do")
public class control extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public control() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doGet");
		actionDo(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doPost");
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("actionDo");
		
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String sessionid=(String)session.getAttribute("id");
		String viewPage = null;
		Command command = null;
		
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		if(com.equals("/register_restaurant.do")) {//식당 등록 요청
			command = new RegisterRestaurantCommand();
			command.execute(request, response);
			viewPage = "index.jsp";

		} else if(com.equals("/menu_write.do")) {//식당 메뉴 추가 요청
			command = new MenuWriteCommand();
			command.execute(request, response);
			viewPage="mymenu.jsp";
		} else if(com.equals("/map.do")) {
			command = new MapCommand();
			command.execute(request, response);
			viewPage="index.jsp";
			
		} else if(com.equals("/review_write.do")){
			if(sessionid==null) {
				viewPage="alert_review.html";
			}else {
				command = new ReviewWriteCommand();
				command.execute(request, response);
				viewPage="restaurant-single.jsp";
			}
		} else if(com.equals("/review_modify.do")) {
				command = new ReviewModifyCommand();
				command.execute(request, response);
				viewPage="restaurant-single.jsp";
			
		} else if(com.equals("/review_delete.do")) {
			command = new ReviewDeleteCommand();
			command.execute(request, response);
			viewPage="restaurant-single.jsp";
		} else if(com.equals("/menu_cart.do")) {
			command = new MenuCartCommand();
			command.execute(request, response);
			viewPage="restaurant-single.jsp";
			
		} else if(com.equals("/reservation.do")) {
			command = new ReservationCommand();
			command.execute(request, response);
			viewPage="restaurant-single.jsp";
		}else if(com.equals("/reservation_delete.do")) {
			command = new ReservationDeleteCommand();
			command.execute(request, response);
			viewPage="reservation_view.jsp";
		}else if(com.equals("/menu_delete.do")) {
			command = new MenuDeleteCommand();
			command.execute(request, response);
			viewPage="mymenu.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}

}
