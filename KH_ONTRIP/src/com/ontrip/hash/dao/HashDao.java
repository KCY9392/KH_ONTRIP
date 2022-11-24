package com.ontrip.hash.dao;

import static com.ontrip.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;


public class HashDao {
private Properties prop = new Properties();
	
	public HashDao() {
		String fileName = HashDao.class.getResource("/sql/hash/hash-mapper.xml").getPath();	
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertHash(String value, Connection conn) {
		int result1 = 0;
		   
		   PreparedStatement psmt = null;
		   
		   String sql = prop.getProperty("insertHash");
		   
		   try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, value);
			
			result1 = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		   return result1;
	}
	
	public int insertHashStorage(int placeCode, Connection conn) {
		int result2 = 0;
		   
		   PreparedStatement psmt = null;
		   
		   String sql = prop.getProperty("insertHashStorage");
		   
		   try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, placeCode);
			result2 = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		   return result2;
	}
	
}
