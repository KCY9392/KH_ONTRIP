package com.ontrip.place.model.dao;

import static com.ontrip.common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import com.ontrip.common.JDBCTemplate.*;

import com.ontrip.place.model.vo.Place;
import static com.ontrip.common.JDBCTemplate.*;

public class PlaceDao {
	
	private Properties prop = new Properties();
	
	public PlaceDao() {
		
		String fileName = PlaceDao.class.getResource("/sql/place/place-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	public ArrayList<Place> selectPlayInfo(String dareaCode, Connection conn){
		
		ArrayList<Place> playInfo = new ArrayList<Place>();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPlayInfo");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dareaCode);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				playInfo.add(new Place(
							 rset.getString("PLC_NAME"),
							 rset.getString("PLC_ADDRESS"),
							 rset.getString("PLC_PNUMBER")));
			}
			System.out.println(playInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		
		return playInfo;
	}


	   public ArrayList<Place> selectPlace(String placeName, Connection conn) {
	      
	      ArrayList<Place> place = new ArrayList<>();
	      
	      PreparedStatement psmt = null;
	      
	      ResultSet rset = null;
	      
	      String sql = prop.getProperty("selectPlace");
	      
	      
	      
	      return place;
	   }

	public ArrayList<Place> selectHotelInfo(String dareaCode, Connection conn){
		ArrayList<Place> hotelInfo = new ArrayList<Place>();
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectHotelInfo");
		
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dareaCode);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				hotelInfo.add(new Place(
							 rset.getString("PLC_NAME"),
							 rset.getString("PLC_ADDRESS"),
							 rset.getString("PLC_PNUMBER")));
			}
			System.out.println(hotelInfo);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		
		return hotelInfo;
	}


	
}
