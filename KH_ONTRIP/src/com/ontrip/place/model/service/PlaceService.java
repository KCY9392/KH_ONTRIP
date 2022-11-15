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

	public ArrayList<Place> selectPlace(String placeName) {
		
		Connection conn = getConnection();
		ArrayList<Place> placeInfo = new PlaceDao().selectPlace(placeName, conn);
		return null;
	}
	
}
