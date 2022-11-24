package com.ontrip.hash.service;
import static com.ontrip.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.ontrip.hash.dao.HashDao;
import com.ontrip.hash.vo.Hash;

public class HashService {
	
	public int insertHash(String value,int placeCode) {
		Connection conn = getConnection();
		
		int result1 = new HashDao().insertHash(value, conn);
		int result2 = new HashDao().insertHashStorage(placeCode, conn);
		
		if(result1 > 0) { //성공
	         commit(conn);
	      }else { // 실패
	         rollback(conn);
	      }
	      close();
	      
	    return result1;
	}
	
	
}
