package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.GoogleMapDto;

public class GoogleMapDao {

	
	
	private static GoogleMapDao instance = new GoogleMapDao();
	
	private GoogleMapDao() {
	}
	
	public static GoogleMapDao getInstance(){
		return instance;
	}
	

	//businessNumber(���Թ�ȣ) �� �ش��ϴ� ���� �ʿ� ���� ����(api key ��)�� ������
	public GoogleMapDto getBusinessNumGoogle(String businessNumber) {
		Connection connection = null;
		PreparedStatement pstmt = null;
		ResultSet set = null;
		String query = "select * from googlemap where businessNumber = ?";
		GoogleMapDto dto = null;
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, businessNumber);
			set = pstmt.executeQuery();
			
			if(set.next()) {
				dto = new GoogleMapDto();
				dto.setBusinessNumber(set.getString("businessNumber"));
				dto.setGoogledata(set.getString("googledata"));
				
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
	
	
	//�Ĵ��� ������ ���� ������ �����ͺ��̽��� �����
	public int insertMap(GoogleMapDto dto) {
		int ri = 0;
		
		Connection connection = null;
		PreparedStatement pstmt = null;
		String query = "insert into googlemap values (?,?)";
		
		try {
			connection = getConnection();
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, dto.getBusinessNumber());
			pstmt.setString(2, dto.getGoogledata());
			
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
