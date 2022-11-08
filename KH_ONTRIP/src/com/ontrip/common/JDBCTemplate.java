package com.ontrip.common;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	
	private JDBCTemplate() {
		
	}
	// 싱글톤패턴으로 생성하기위해 미리 static객체 선언.
	// 싱글톤패턴(하나만 만들어두고 하나의 커넥션 객체를 사용자가 요청할때마다 꺼내줌)
	private static Connection conn = null;
	
	private static Properties prop = new Properties();
	
	// 1. Connection객체 생성 (DB 접속)한후 해당 Connection을 반환하는메소드
	public static Connection getConnection() {
		// 1) JDBC 드라이버 등록
		try {
			
			// driver.properteis가 존재하는 물리적인 경로
			String fileName = JDBCTemplate.class.getResource("/sql/driver/driver.properties").getPath();
			// getResource메소드의 맨처음 /는 classes 폴더를 의미한다.
			
			prop.load(new FileInputStream(fileName));
			
			// prop.getProperty("키값")
			Class.forName(prop.getProperty("driver"));
			if(conn == null) {
				conn = DriverManager.getConnection(prop.getProperty("url"),
						prop.getProperty("username") ,
						prop.getProperty("password"));
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	// 2. 전달받은 Connection객체를 가지고 commit해주는 메소드
	public static void commit(Connection conn) {
		try {
			if (conn != null && !conn.isClosed()) {
				conn.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 3. 전달받은 Connection객체를 가지고 rollback해주는 메소드
	public static void rollback(Connection conn) {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 4. 전달받은 Connection객체를 반납시켜주는 메소드
	public static void close() {
		try {
			if(conn != null && !conn.isClosed()) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 5. 전달받은 statement객체를 반납시켜주는 메소드 => 다형성때문에 자식클래스인 preparedStatement객체도 반납가능
	public static void close(Statement stmt) {
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// 6. 전달받은 ResultSet객체를 반납시켜주는 메소드
	public static void close(ResultSet rset) {
		try {
			if(rset != null & !rset.isClosed()) {
				rset.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
