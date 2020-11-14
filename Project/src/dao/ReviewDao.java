package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.MemberDto;
import dto.ReviewDto;


public class ReviewDao {

	
	
	private static ReviewDao instance = new ReviewDao();
	
	private ReviewDao() {
	}
	
	public static ReviewDao getInstance(){
		return instance;
	}
	
	//�Ĵ������ȣ(businessNumber)�� ����� ���̵� ����(userId)�� �̿��Ͽ� �������� ������
	public ReviewDto getBusinessNumReview(String businessNumber,String userId) {
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		ReviewDto dto=null;
		
		try {
			connection = getConnection();
			
			String query = "select * from review where businessNumber = ? and userId = ?";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, businessNumber);
			pstmt.setString(2, userId);
			resultSet = pstmt.executeQuery();
			
			if(resultSet.next()) {
				String businessNumbers = resultSet.getString("businessNumber");
				String userIds=resultSet.getString("userId");
				String userNames = resultSet.getString("userName");
				String starCount = resultSet.getString("starCount");
				String reviewText = resultSet.getString("reviewText");
				
				dto=new ReviewDto(businessNumbers,userIds,userNames,starCount,reviewText);
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
		return dto;
	}	

	//��������(dto)�� �̿��Ͽ� ���並 �����
	public int insertReview(ReviewDto dto) {
		int ri = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "insert into review values (?,?,?,?,?)";
		
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getBusinessNumber());
			pstmt.setString(2, dto.getUserId());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getStarCount());
			pstmt.setString(5, dto.getReviewText());
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
	
	//�Ĵ������ȣ(businessNumber)�� �ش��ϴ� ������ü�� ������
	public ArrayList<ReviewDto> list(String businessNumber) {
		
		ArrayList<ReviewDto> dtos = new ArrayList<ReviewDto>();
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			
			String query = "select businessNumber, userId, userName, starCount, reviewText from review where businessNumber = ?";
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, businessNumber);
			resultSet = pstmt.executeQuery();
			
			while (resultSet.next()) {
				String businessNumbers = resultSet.getString("businessNumber");
				String userId=resultSet.getString("userId");
				String userName = resultSet.getString("userName");
				String starCount = resultSet.getString("starCount");
				String reviewText = resultSet.getString("reviewText");
				
				ReviewDto dto = new ReviewDto(businessNumbers,userId,userName,starCount,reviewText);
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
	
	//�Ĵ������ȣ(businessNumber)�� �ش��ϴ� ���� ������ ������
	public int getReviewCount(String businessNumber) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select * from review where businessNumber = ?";
		ReviewDto dto = null;
		int reviewCount=0;
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, businessNumber);
			set = pstmt.executeQuery();
			
			while(set.next()) {
				reviewCount++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(set!=null) set.close();
				if(pstmt != null) pstmt.close();
				if(connection != null) connection.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return reviewCount;
		
	}
	
	//��������(dto)�� �̿��Ͽ� ���並 ������
	public int updateReview(ReviewDto dto) {
		int ri = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "update review set businessNumber=?, userId=?, userName=?, starCount=?, reviewText=? where userId=? and businessNumber=?";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getBusinessNumber());
			pstmt.setString(2, dto.getUserId());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getStarCount());
			pstmt.setString(5, dto.getReviewText());
			pstmt.setString(6, dto.getUserId());
			pstmt.setString(7, dto.getBusinessNumber());
			ri = pstmt.executeUpdate();
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
	
	//�Ĵ������ȣ(businessNumber)�� userId�� �̿��Ͽ� �Ĵ翡 ��ϵ� ���並 ����
	public int deleteReview(String businessNumber, String userId) {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "delete from review where businessNumber = ? and userId = ?";
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
	
	//�����ͺ��̽� ����(Ŀ�ؼ�)
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
