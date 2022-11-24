package com.ontrip.manager.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ontrip.common.model.vo.PageInfo;
import com.ontrip.hash.vo.Hash;
import com.ontrip.image.vo.Image;
import com.ontrip.manager.dao.ManagerDao;
import com.ontrip.place.model.vo.Place;
import static com.ontrip.common.JDBCTemplate.*;

public class ManagerService {
	// 시설 목록을 나타내기 위한 메소드
	public ArrayList<Place> getList(String categoryCode, int pageNum, int amount){
		Connection conn = getConnection();
		ArrayList<Place> placeList = new ManagerDao().getList(categoryCode, pageNum, amount, conn);
		
		close();
		
		return placeList;
	}
	
	// 총 시설목록 수를 구하는 메소드
	public int getTotal() {
		Connection conn = getConnection();
		int total = new ManagerDao().getTotal(conn);
		
		close();
		
		return total;
	}
	// 시설 상세조회를 위한 메소드
	public Place detailPlace(String placeName){
		Connection conn = getConnection();
		
		Place place = new ManagerDao().detailPlace(placeName, conn);
		
		close();
		
		return place;
	}
	// 시설 삭제를 위한 메소드
	public int deletePlace(String placeName) {
		Connection conn = getConnection();
		
		int result1 = new ManagerDao().deletePlace(placeName, conn);
		
		if (result1 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close();
		
		return result1;
	}
	// 시설 이미지 삭제를 위한 메소드
	public int deletePlaceImg(String placeName) {
		Connection conn = getConnection();
		
		int result2 = new ManagerDao().deletePlaceImg(placeName, conn);
		
		if (result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close();
		
		return result2;
	}
	
	public ArrayList<Image> detailPlaceImage(String placeName) {
		Connection conn = getConnection();
		
		ArrayList<Image> placeImg = new ManagerDao().detailPlaceImage(placeName, conn);
		
		close();
		
		return placeImg;
	}
	
	public ArrayList<Hash> detailHash(String placeName) {
		Connection conn = getConnection();
		ArrayList<Hash> hash = new ManagerDao().detailHash(placeName, conn);
		
		close();
		
		return hash;
	}
	
	//해시태그 삭제
	public int deleteHash(String placeName, int[] hashArr) {
		Connection conn = getConnection();
		int result3 = new ManagerDao().deleteHashStorage(placeName, conn);
		int result4 = new ManagerDao().deleteHash(hashArr, conn);
		
		if (result4 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close();
		
		return result4;
	}

}
