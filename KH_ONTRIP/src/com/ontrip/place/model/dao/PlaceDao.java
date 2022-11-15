package com.ontrip.place.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.ontrip.image.vo.Image;
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
   
//상세지역창
   
   
 //상세지역창에 놀거리 info 띄우기
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
   
   //상세지역창에 맛집 info 띄우기
   public ArrayList<Place> selectFoodInfo(String dareaCode, Connection conn){
      ArrayList<Place> foodInfo = new ArrayList<Place>();
      PreparedStatement psmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectFoodInfo");
      
      try {
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, dareaCode);
         
         rset = psmt.executeQuery();
         
         while(rset.next()) {
            foodInfo.add(new Place(
                  rset.getString("PLC_NAME"),
                  rset.getString("PLC_ADDRESS"),
                  rset.getString("PLC_PNUMBER")));
         }
         System.out.println(foodInfo);
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(psmt);
      }
      
      return foodInfo;
   }
   
   //상세지역창에 숙소 info 띄우기
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

   
   
//시설상세창
   
 //시설상세창에 숙소 정보 띄우기
 	public Place selectHotel(String placeName, Connection conn) {
 		
 		Place place = new Place();
 		
 		PreparedStatement psmt = null;
 		
 		ResultSet rset = null;
 		
 		String sql = prop.getProperty("Hotel");
 		
 		try {
 			psmt = conn.prepareStatement(sql);
 			psmt.setString(1, placeName);
 			
 			rset = psmt.executeQuery();
 			
 			if(rset.next()) {
 				place = new Place(
 									rset.getInt("PLC_CODE"),
 									rset.getString("CATEGORY_CODE"),
 									rset.getString("DAREA_CODE"),
 									rset.getString("PLC_ADDRESS"),
 									rset.getString("PLC_TEXT"),
 									rset.getString("PLC_BNAME"),
 									rset.getString("PLC_PNUMBER"),
 									rset.getFloat("PLC_LA"),
 									rset.getFloat("PLC_LO"));
 			}
 			System.out.println(place);
 			System.out.println(place.getPlcLa());
 			
 			
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}finally {
 			close(rset);
 			close(psmt);
 		}
 		return place;
 	}

 	//시설상세창 밑에 놀거리,숙소,맛집 밑 정보띄우기위한 dareaCode찾기
 	public String findDareaCode(String dareaName, Connection conn) {
 		
 		String dareaCode = "";
 		
 		PreparedStatement psmt = null;
 		
 		ResultSet rset = null;
 		
 		String sql = prop.getProperty("findDareaCode");
 		
 		try {
 			psmt = conn.prepareStatement(sql);
 			
 			psmt.setString(1, dareaName);
 			
 			rset = psmt.executeQuery();
 			
 			if(rset.next()) {
 				dareaCode = rset.getString(1);
 			}
 		} catch (SQLException e) {
 			e.printStackTrace();
 		} finally {
 			close(rset);
 			close(psmt);
 		}
 		return dareaCode;
 	}
 
   
// 검색창
   
   
   //메인창에서 검색키워드로 시설사진 찾기
   public ArrayList<Image> searchPlacePath(String word, Connection conn){
      ArrayList<Image> placePath = new ArrayList<>();
      
      PreparedStatement psmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("searchPlacePath");
      
      try {
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, '%'+word+'%');
         
         rset = psmt.executeQuery();
         
         while(rset.next()) {
            placePath.add(new Image(
                   rset.getString("FILE_PATH"),
                   rset.getString("ORIGIN_NAME")));
         }
         System.out.println(placePath);
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(psmt);
      }
      
      return placePath;
   }
   
   //메인창에서 검색키워드로 시설 정보 찾기
   public ArrayList<Place> searchPlaceInfo(String word, Connection conn){
      ArrayList<Place> placeInfo = new ArrayList<>();
      
      PreparedStatement psmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("searchPlaceInfo");
      
      try {
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, '%'+word+'%');
         
         rset = psmt.executeQuery();
         
         while(rset.next()) {
            placeInfo.add(new Place(
                        rset.getString("CATEGORY_CODE"),
                              rset.getString("PLC_NAME"),
                              rset.getString("PLC_ADDRESS"),
                              rset.getString("PLC_PNUMBER")));
         }
         System.out.println(placeInfo);
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(psmt);
      }
      
      return placeInfo;
   }
} 