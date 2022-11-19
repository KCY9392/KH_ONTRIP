package com.ontrip.heart.service;

import static com.ontrip.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.ontrip.heart.dao.HeartDao;
import com.ontrip.heart.vo.Heart;

public class HeartService {
	
	public int insertHeart(int memNo, int plcCode) {
		 Connection conn = getConnection();
		 
		 int result = new HeartDao().insertHeart(memNo, plcCode, conn);
		 
		 if(result > 0) { //성공
	         commit(conn);
	      }else { // 실패
	         rollback(conn);
	      }
	      close();
	      
	      return result;
	}
	
	public int deleteHeart(int memNo, int plcCode) {
		Connection conn = getConnection();
		
		int result = new HeartDao().deleteHeart(memNo, plcCode, conn);
		 
		 if(result > 0) { //성공
	         commit(conn);
	      }else { // 실패
	         rollback(conn);
	      }
	      close();
	      
	      return result;
	}
	
	public ArrayList<Heart> selectHeart(int memberNo){
		Connection conn = getConnection();
		
		ArrayList<Heart> htList = new HeartDao().selectHeart(memberNo, conn);
		 
	      close();
	      
	      return htList;
	}
	
	public int deleteHeartList(String[] placeName) {
		Connection conn = getConnection();
		
		int result = new HeartDao().deleteHeartList(placeName, conn);
		
		if(result > 0) { //성공
	         commit(conn);
	      }else { // 실패
	         rollback(conn);
	      }
	      close();
	      
	      return result;
	}
}
