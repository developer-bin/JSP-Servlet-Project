package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
//import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import dto.CartDto;

//사용자가 선택한 메뉴들에 대한 DAO
public class CartDao {
	public static final int MENU_JOIN_SUCCESS = 1;
	
	
	
	
	private static CartDao instance = new CartDao();
	
	private CartDao() {
	}
	
	public static CartDao getInstance(){
		return instance;
	}
	
	
	
	//메뉴를 카트(장바구니)에 넣음
	public int insertCart(CartDto dto) {
		int ri = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "insert into cart values (?,?,?,?,?,?,?)";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getRestaurantName());
			pstmt.setString(2, dto.getBusinessNumber());
			pstmt.setString(3, dto.getMenuName());
			pstmt.setString(4, dto.getMenuText());
			pstmt.setString(5, dto.getMenuPrice());
			pstmt.setString(6, dto.getMenuNumber());
			pstmt.setString(7, dto.getUserId());
			pstmt.executeUpdate();
			ri = CartDao.MENU_JOIN_SUCCESS;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return ri;
	}
	
	//선택한 메뉴들 전체 리스트로 받아옴
	public ArrayList<CartDto> lists() {
		
		ArrayList<CartDto> dtos = new ArrayList<CartDto>();
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			
			String query = "select restaurantName, businessNumber, menuName, menuText, menuPrice, menuNumber, userId from cart";
			pstmt = connection.prepareStatement(query);
			resultSet = pstmt.executeQuery();
			
			while (resultSet.next()) {
				String restaurantName = resultSet.getString("restaurantName");
				String businessNumber = resultSet.getString("businessNumber");
				String menuName = resultSet.getString("menuName");
				String menuText = resultSet.getString("menuText");
				String menuPrice = resultSet.getString("menuPrice");
				String menuNumber = resultSet.getString("menuNumber");
				String userId = resultSet.getString("userId");
				CartDto dto = new CartDto(restaurantName,businessNumber,menuName,menuText,menuPrice,menuNumber,userId);
				dtos.add(dto);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dtos;
	}
	
	
	//userId에 해당하는 카트의 항목만을 가져옴
	public ArrayList<CartDto> list(String userId) {
		
		ArrayList<CartDto> dtos = new ArrayList<CartDto>();
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			
			String query = "select restaurantName, businessNumber, menuName, menuText, menuPrice, menuNumber from cart where userId = ?";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, userId);
			resultSet = pstmt.executeQuery();
			
			while (resultSet.next()) {
				String restaurantName = resultSet.getString("restaurantName");
				String businessNumber = resultSet.getString("businessNumber");
				String menuName = resultSet.getString("menuName");
				String menuText = resultSet.getString("menuText");
				String menuPrice = resultSet.getString("menuPrice");
				String menuNumber = resultSet.getString("menuNumber");
				CartDto dto = new CartDto(restaurantName,businessNumber,menuName,menuText,menuPrice,menuNumber,userId);
				dtos.add(dto);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dtos;
	}	
	
	//데이터베이스 커넥션
	private Connection getConnection() {
		
		Context context = null;
		DataSource dataSource = null;
		Connection connection = null;
		try {
			context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/Oracle11g");
			connection = dataSource.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return connection;
	}
	
	

}
