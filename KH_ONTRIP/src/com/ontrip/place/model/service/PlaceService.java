package com.ontrip.place.model.service;

import java.sql.Connection;
import java.util.ArrayList;

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
<<<<<<< HEAD

	public ArrayList<Place> selectPlace(String placeName) {
		
		Connection conn = getConnection();
		ArrayList<Place> placeInfo = new PlaceDao().selectPlace(placeName, conn);
		return null;
	}
	
=======
	
	public ArrayList<Place> selectHotelInfo(String dareaCode){
		Connection conn = getConnection();
		ArrayList<Place> hotelInfo = new PlaceDao().selectHotelInfo(dareaCode, conn);
		
		close();
		
		return hotelInfo;
	}
>>>>>>> 1eeb2292e0b17de0f90e40559682af1d0e06dfe5
}
