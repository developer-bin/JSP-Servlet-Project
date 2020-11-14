package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.RestaurantDto;;

public class RestaurantDao {

	DataSource dataSource;
	
	//식당정보(restaurantName, category, businessNumber)를 이용하여 식당 등록
	public void insertRestaurant(String restaurantName, String category, String businessNumber) {
		// TODO Auto-generated method stub
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		try {
			connection = dataSource.getConnection();
			String query = "insert into restaurant (restaurantName, category, businessNumber) values (?, ?, ?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, restaurantName);
			preparedStatement.setString(2, category);
			preparedStatement.setString(3, businessNumber);
			int rn = preparedStatement.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		
	}
	
	//식당 전체 리스트를 가져옴
	public ArrayList<RestaurantDto> lists() {
		
		ArrayList<RestaurantDto> dtos = new ArrayList<RestaurantDto>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		
		try {
			connection = dataSource.getConnection();
			
			String query = "select restaurantName, category, businessNumber from restaurant order by category asc";
			preparedStatement = connection.prepareStatement(query);
			resultSet = preparedStatement.executeQuery();
			
			while (resultSet.next()) {
				String restaurantName = resultSet.getString("restaurantName");
				String category = resultSet.getString("category");
				String businessNumber = resultSet.getString("businessNumber");

				
				RestaurantDto dto = new RestaurantDto(restaurantName, category, businessNumber);
				dtos.add(dto);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				if(resultSet != null) resultSet.close();
				if(preparedStatement != null) preparedStatement.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		return dtos;
	}
	
	//식당고유번호(businessNumber)에 해당하는 식당 정보를 가져옴
	public RestaurantDto getBusinessNumMember(String businessNumber) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		RestaurantDto dto = null;
		
		try {
			String query = "select * from restaurant where businessNumber = ?";
			connection = dataSource.getConnection();
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, businessNumber);
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				dto = new RestaurantDto();
				dto.setRestaurantName(resultSet.getString("restaurantName"));
				dto.setCategory(resultSet.getString("category"));
				dto.setBusinessNumber(resultSet.getString("businessNumber"));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				resultSet.close();
				preparedStatement.close();
				connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return dto;
		
	}
	
	//데이터베이스 연결(커넥션)
	public RestaurantDao() {
		// TODO Auto-generated constructor stub
		
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}	
	
}
