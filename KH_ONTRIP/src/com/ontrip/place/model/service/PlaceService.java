package com.ontrip.place.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ontrip.image.vo.Image;
import com.ontrip.place.model.dao.PlaceDao;
import com.ontrip.place.model.vo.Place;

import static com.ontrip.common.JDBCTemplate.*;

public class PlaceService {
   
   public ArrayList<Place> selectPlayInfo(String dareaCode){
      Connection conn = getConnection();
      ArrayList<Place> playInfo = new PlaceDao().selectPlayInfo(dareaCode, conn);
      
      close();
      
      return playInfo;
   }
   
   public ArrayList<Place> selectHotelInfo(String dareaCode){
      Connection conn = getConnection();
      ArrayList<Place> hotelInfo = new PlaceDao().selectHotelInfo(dareaCode, conn);
      
      close();
      
      return hotelInfo;
   }
   
   public ArrayList<Place> selectFoodInfo(String dareaCode){
      Connection conn = getConnection();
      ArrayList<Place> foodInfo = new PlaceDao().selectFoodInfo(dareaCode, conn);
      
      close();
      
      return foodInfo;
   }
   
   public ArrayList<Image> searchPlacePath(String word){
      Connection conn = getConnection();
      ArrayList<Image> placePath = new PlaceDao().searchPlacePath(word, conn);
      
      close();
      
      return placePath;
   }
   
   public ArrayList<Place> searchPlaceInfo(String word){
      Connection conn = getConnection();
      ArrayList<Place> placeInfo = new PlaceDao().searchPlaceInfo(word, conn);
      
      close();
      
      return placeInfo;
   }
   

} 