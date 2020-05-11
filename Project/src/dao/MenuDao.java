package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import dto.MenuDto;


public class MenuDao {
	public static final int MENU_JOIN_SUCCESS = 1;
	
	
	
	
	private static MenuDao instance = new MenuDao();
	
	private MenuDao() {
	}
	
	public static MenuDao getInstance(){
		return instance;
	}
	
	
	
	
	public int insertMenu(MenuDto dto) {
		int ri = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "insert into menu values (?,?,?,?,?,?)";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getRestaurantName());
			pstmt.setString(2, dto.getbusinessNumber());
			pstmt.setString(3, dto.getmenuName());
			pstmt.setString(4, dto.getmenuText());
			pstmt.setString(5, dto.getmenuPrice());
			pstmt.setString(6, dto.getMenuNumber());
			pstmt.executeUpdate();
			ri = MenuDao.MENU_JOIN_SUCCESS;
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
	
	
	
	
	
	
	public ArrayList<MenuDto> lists() {
		
		ArrayList<MenuDto> dtos = new ArrayList<MenuDto>();
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			
			String query = "select restaurantName, businessNumber, menuName, menuText, menuPrice, menuNumber from menu order by menuPrice asc";
			pstmt = connection.prepareStatement(query);
			resultSet = pstmt.executeQuery();
			
			while (resultSet.next()) {
				String restaurantName = resultSet.getString("restaurantName");
				String businessNumber = resultSet.getString("businessNumber");
				String menuName = resultSet.getString("menuName");
				String menuText = resultSet.getString("menuText");
				String menuPrice = resultSet.getString("menuPrice");
				String menuNumber = resultSet.getString("menuNumber");
				MenuDto dto = new MenuDto(restaurantName,businessNumber,menuName,menuText,menuPrice,menuNumber);
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
	
	
	
	
	
	
	
	
	
	public MenuDto MenuCheck( String businessNumber, String menuNumber) {
		int ri = 0;
		MenuDto dto=new MenuDto();
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select restaurantName, businessNumber, menuName, menuText, menuPrice, menuNumber from menu where businessNumber=? and menuNumber=?";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, businessNumber);
			pstmt.setString(2, menuNumber);
			
			set = pstmt.executeQuery();
			
			if(set.next()) {
				dto.setRestaurantName(set.getString("restaurantName"));
				dto.setbusinessNumber(set.getString("businessNumber"));
				dto.setmenuName(set.getString("menuName"));
				dto.setmenuText(set.getString("menuText"));
				dto.setmenuPrice(set.getString("menuPrice"));
				dto.setMenuNumber(set.getString("menuNumber"));
				
			} 
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				set.close();
				pstmt.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return dto;
	}
	
	
	
	
	
	
	
	
public int MenuCnt(String businessNumber) {
		
		MenuDto dto = new MenuDto();
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		int cnt=0;
		try {
			connection = getConnection();
			
			String query = "select * from menu where businessNumber = ?";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, businessNumber);
			resultSet = pstmt.executeQuery();
			
			while (resultSet.next()) {
				cnt++;
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
		return cnt;
	}	
	
	
	
	
	public int deleteMenu(String businessNumber, String menuNumber) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "delete from menu where businessNumber = ? and menuNumber = ?";
		int rn=0;
		try {
			
			connection = getConnection();
			
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, businessNumber);
			pstmt.setString(2, menuNumber);
			
			rn = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return rn;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

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
