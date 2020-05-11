package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.ReservationDto;

public class ReservationDao {

	
	
	private static ReservationDao instance = new ReservationDao();
	
	private ReservationDao() {
	}
	
	public static ReservationDao getInstance(){
		return instance;
	}
	
	


	public int insertReservation(ReservationDto dto) {
		int ri = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "insert into reservation values (?,?,?,?,?,?,?,?)";
		
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getBusinessNumber());
			pstmt.setString(2, dto.getUserName());
			pstmt.setString(3, dto.getUserMail());
			pstmt.setString(4, dto.getUserPhone());
			pstmt.setString(5, dto.getUserDate());
			pstmt.setString(6, dto.getUserTime());
			pstmt.setString(7, dto.getUserSit());
			pstmt.setString(8, dto.getUserId());
			pstmt.executeUpdate();
			ri = 1;
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
	
	
	public ArrayList<ReservationDto> list(String businessNumber) {
		
		ArrayList<ReservationDto> dtos = new ArrayList<ReservationDto>();
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			
			String query = "select businessNumber, userName, userMail, userPhone, userDate, userTime, userSit, userId from reservation where businessNumber = ?";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, businessNumber);
			resultSet = pstmt.executeQuery();
			
			while (resultSet.next()) {
				String businessNumbers = resultSet.getString("businessNumber");
				String userName=resultSet.getString("userName");
				String userMail = resultSet.getString("userMail");
				String userPhone = resultSet.getString("userPhone");
				String userDate = resultSet.getString("userDate");
				String userTime = resultSet.getString("userTime");
				String userSit = resultSet.getString("userSit");
				String userId = resultSet.getString("userId");
				ReservationDto dto = new ReservationDto(businessNumbers,userName,userMail,userPhone,userDate,userTime,userSit,userId);
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
	
	
public ArrayList<ReservationDto> lists() {
		
		ArrayList<ReservationDto> dtos = new ArrayList<ReservationDto>();
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			
			String query = "select businessNumber, userName, userMail, userPhone, userDate, userTime, userSit, userId from reservation";
			pstmt = connection.prepareStatement(query);
			resultSet = pstmt.executeQuery();
			
			while (resultSet.next()) {
				String businessNumbers = resultSet.getString("businessNumber");
				String userName=resultSet.getString("userName");
				String userMail = resultSet.getString("userMail");
				String userPhone = resultSet.getString("userPhone");
				String userDate = resultSet.getString("userDate");
				String userTime = resultSet.getString("userTime");
				String userSit = resultSet.getString("userSit");
				String userId = resultSet.getString("userId");
				ReservationDto dto = new ReservationDto(businessNumbers,userName,userMail,userPhone,userDate,userTime,userSit,userId);
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
	
	public int deleteReservation(String businessNumber, String userId) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "delete from reservation where businessNumber = ? and userId = ?";
		int rn=0;
		try {
			
			connection = getConnection();
			
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, businessNumber);
			pstmt.setString(2, userId);
			
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
	
	
}
