package com.ontrip.place.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ontrip.image.vo.Image;
import com.ontrip.place.model.dao.PlaceDao;
import com.ontrip.place.model.vo.Place;

import static com.ontrip.common.JDBCTemplate.*;

public class PlaceService {
   
	
//상세지역창 에서 놀거리, 숙소, 맛집 정보 찾기	
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
  
   
//시설상세창에서
   public Place selectHotel(String placeName) {
	   
	   Connection conn = getConnection();
	   
	   Place place = new PlaceDao().selectHotel(placeName, conn);
	   
	   close();
	   
	   return place;
	}
   
   public String findDareaCode(String dareaName) {
	   
	   Connection conn = getConnection();
	   
	   String dareaCode = new PlaceDao().findDareaCode(dareaName, conn);
	   
	   close();
	   
	   return dareaCode;
   }
   		
   //시설사진가져오기

	public ArrayList<Image> selectPlaceImages(String placeName) {
		
		Connection conn = getConnection();
		
		ArrayList<Image> placeImages = new PlaceDao().selectPlaceImages(placeName, conn);
		
		close();
		
		return placeImages;
	}

	//시설코드가져오기
	public String findPlaceCode(String placeName) {
		
		Connection conn = getConnection();
		
		String placeCode = new PlaceDao().findPlaceCode(placeName, conn);
		
		close();
		
		return placeCode;
	}
   
   
//메인창에서 검색키워드로 시설사진, 정보 찾기 
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

   
   //관리자페이지에서 메인관리 - 시설등록시, 상세지역이름으로 상세지역코드 가져오기
   public String selectDAreaCode(String dAreaName) {
	   
	   Connection conn = getConnection();
	   String DAreaCode = new PlaceDao().selectDAreaCode(dAreaName, conn);
	   close();
	   return DAreaCode;
   }

   //관리자페이지에서 시설등록하기
	public int insertPlace(Place place) {
		
		Connection conn = getConnection();
		int result = new PlaceDao().insertPlace(place, conn);
		
		if(result > 0) {			
			commit(conn);
		}else {
			rollback(conn);
		}
		close();
		return result;
	}

	//관리자페이지에서 시설등록시, 데베에 이미지 파일 업로드하기
	public int insertPlaceImages(ArrayList<Image> list) {
		
		Connection conn = getConnection();
		int result = new PlaceDao().insertPlaceImages(list, conn);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return 0;
	}



} 