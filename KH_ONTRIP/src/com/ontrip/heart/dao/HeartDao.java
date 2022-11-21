package com.ontrip.heart.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.ontrip.heart.vo.Heart;
import com.ontrip.image.vo.Image;

import static com.ontrip.common.JDBCTemplate.*;
public class HeartDao {
private Properties prop = new Properties();
	
	public HeartDao() {
		String fileName = HeartDao.class.getResource("/sql/heart/heart-mapper.xml").getPath();	
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertHeart(int memNo, int plcCode, Connection conn) {
		int result = 0;
		PreparedStatement psmt = null;
		String sql = prop.getProperty("insertHeart");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, memNo);
			psmt.setInt(2, plcCode);
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		
		return result;
	}
	
	public int deleteHeart(int memNo, int plcCode, Connection conn) {
		int result = 0;
		PreparedStatement psmt = null;
		String sql = prop.getProperty("deleteHeart");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, memNo);
			psmt.setInt(2, plcCode);
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		
		return result;
	}
	
	public ArrayList<Heart> selectHeart(int memberNo, Connection conn){
			ArrayList<Heart> htList = new ArrayList<>();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectHeart");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, memberNo);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				htList.add(new Heart(
								rset.getString("CATEGORY_NAME"),
							 rset.getString("PLC_NAME"),
							 rset.getDate("HEART_DATE"),
							 rset.getInt("PLC_CODE"),
							 rset.getString("FILE_PATH"),
							 rset.getString("CHANGE_NAME")));
			}
			System.out.println(htList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(psmt);
		}
		return htList;
	}
	
	public int deleteHeartList(String[] placeName, Connection conn) {
		int result = 0;
		String place = "";
		for(int i=0; i<placeName.length; i++) {
			place += "?";
			if(i<placeName.length-1) {
				place += ",";
			}
			System.out.println(place);	
				
		}
		//? , ? , ? 
		PreparedStatement psmt = null;
		String sql = prop.getProperty("deleteHeartList");
		sql = sql.replace("@",  place);
		try {
			psmt = conn.prepareStatement(sql);
			
			for(int i=0; i<placeName.length; i++) {
				psmt.setString(i+1, placeName[i]);
			}
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		
		return result;
	}
}
