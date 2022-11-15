package com.ontrip.detailArea.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.ontrip.image.vo.Image;

import static com.ontrip.common.JDBCTemplate.*;

public class DetailAreaDao {
	
private Properties prop = new Properties();
	
	public DetailAreaDao() {
		String fileName = DetailAreaDao.class.getResource("/sql/detailArea/detailArea-mapper.xml").getPath();	
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public String dAreaName(String dareaCode, Connection conn) {
		String dareaName = null;
		
		ResultSet rset = null;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("selectDAreaName");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dareaCode);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				do {
					dareaName = rset.getString("DAREA_NAME");					
				}while(rset.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		
		return dareaName;
	}
	
	public ArrayList<Image> selectFilePath(String dareaCode, Connection conn){
		ArrayList<Image> filePath = new ArrayList<>();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFilePath");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dareaCode);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				filePath.add(new Image(
							 rset.getString("FILE_PATH"),
							 rset.getString("ORIGIN_NAME")));
			}
			System.out.println(filePath);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(psmt);
		}
		return filePath;
	}
	
	public ArrayList<Image> selectFoodPath(String dareaCode, Connection conn){
		ArrayList<Image> foodPath = new ArrayList<>();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectFoodPath");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dareaCode);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				foodPath.add(new Image(
							 rset.getString("FILE_PATH"),
							 rset.getString("ORIGIN_NAME")));
			}
			System.out.println(foodPath);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(psmt);
		}
		return foodPath;
	}
	
	public ArrayList<Image> selectPlayPath(String dareaCode, Connection conn){
		ArrayList<Image> playPath = new ArrayList<>();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPlayPath");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dareaCode);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				playPath.add(new Image(
							 rset.getString("FILE_PATH"),
							 rset.getString("ORIGIN_NAME")));
			}
			System.out.println(playPath);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(psmt);
		}
		return playPath;
	}
	
	public ArrayList<Image> selectHotelPath(String dareaCode, Connection conn){
		ArrayList<Image> hotelPath = new ArrayList<>();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectHotelPath");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dareaCode);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				hotelPath.add(new Image(
							 rset.getString("FILE_PATH"),
							 rset.getString("ORIGIN_NAME")));
			}
			System.out.println(hotelPath);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(psmt);
		}
		return hotelPath;
	}
	
}
