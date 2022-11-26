package com.ontrip.hash.dao;

import static com.ontrip.common.JDBCTemplate.*;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.ontrip.hash.vo.Hash;


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
	
	public ArrayList<Hash> selectHash(Connection conn){
		ArrayList<Hash> hash = new ArrayList<Hash>();
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		String sql = prop.getProperty("selectHashTag");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				hash.add(new Hash(
							rset.getString("HAS_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		
		return hash;
		
	}
	
	public ArrayList<Hash> selectHashPlace(String placeName, Connection conn){
		ArrayList<Hash> hashTag = new ArrayList<Hash>();
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		String sql = prop.getProperty("selectHashTagPlace");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, placeName);
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				hashTag.add(new Hash(
							rset.getString("HAS_NAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		
		return hashTag;
	}
	
}
