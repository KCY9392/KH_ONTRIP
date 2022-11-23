package com.ontrip.score.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.ontrip.review.dao.ReviewDao;
import com.ontrip.review.vo.Review;
import com.ontrip.score.dao.ScoreDao;
import com.ontrip.score.vo.Score;
import static com.ontrip.common.JDBCTemplate.*;

public class ScoreService {
	
//	public int insertScore(Score s) {
//		
//		Connection conn = getConnection();
//		
//		int result = new ScoreDao().insertScore(s , conn);
//		
//		if(result > 0) {
//			commit(conn);
//		}else {
//			rollback(conn);
//		}
//		close();
//		
//		return result;
//	}
	
	public ArrayList<Score> selectSocreList(int placeCode){
		
		Connection conn = getConnection();
		
		ArrayList<Score> slist = new ScoreDao().selectSocreList(placeCode , conn);
		
		close();
		
		return slist;
		
		
		
	}
	

}
