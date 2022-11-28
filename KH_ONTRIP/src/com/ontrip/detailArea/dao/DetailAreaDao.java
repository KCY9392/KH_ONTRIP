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
	
	
	/**
	 * 상세지역이름 가져오는 메소드
	 * @param dareaCode
	 * @param conn
	 * @return
	 */
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
	
	
	/**
	 * 상세지역 이미지 경로, 파일명 가져오는 메소드
	 * @param dareaCode
	 * @param conn
	 * @return
	 */
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
//			System.out.println(filePath);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(psmt);
		}
		return filePath;
	}
	
	
	/**
	 * 맛집 버튼 클릭 시, 맛집 시설 대표이미지 경로명, 파일명 가져오는 메소드
	 * @param dareaCode
	 * @param conn
	 * @return
	 */
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
							 rset.getString("CHANGE_NAME"),
							 rset.getInt("FILE_NO")));
			}
//			System.out.println(foodPath);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(psmt);
		}
		return foodPath;
	}
	
	
	/**
	 * 놀거리 버튼 클릭시, 놀거리 시설 대표 이미지 경로명, 파일명 가져오는 메소드
	 * @param dareaCode
	 * @param conn
	 * @return
	 */
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
							 rset.getString("CHANGE_NAME"),
							 rset.getInt("FILE_NO")));
			}
//			System.out.println(playPath);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(psmt);
		}
		return playPath;
	}
	
	
	/**
	 * 숙소 버튼 클릭 시, 숙소 시설 대표이미지 경로명, 파일명 가져오는 메소드
	 * @param dareaCode
	 * @param conn
	 * @return
	 */
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
							 rset.getString("CHANGE_NAME"),
							 rset.getInt("FILE_NO")));
			}
//			System.out.println(hotelPath);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(psmt);
		}
		return hotelPath;
	}
	
}
