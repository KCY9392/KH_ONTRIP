package com.ontrip.score.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.ontrip.common.JDBCTemplate.*;

import com.ontrip.score.vo.Score;

public class ScoreDao {
	
	private Properties prop = new Properties();
	
	public ScoreDao() {
		String fileName = ScoreDao.class.getResource("/sql/score/score-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
//	public int insertScore(Score s , Connection conn) {
//		
//		int result2 = 0;
//		
//		PreparedStatement psmt = null;
//		
//		String sql = prop.getProperty("insertScore");
//		
//		try {
//			psmt = conn.prepareStatement(sql);
//			
//			psmt.setInt(1, s.getReviewStar());
//			psmt.setInt(2, s.getReview_c());
//			psmt.setInt(3, s.getReview_s());
//			psmt.setInt(4, s.getReview_p());
//		
//			
//			result2 = psmt.executeUpdate();
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(psmt);
//		}
//		return result2;
//	}
	
	public ArrayList<Score> selectSocreList(int placeCode , Connection conn){
		
		ArrayList<Score> slist = new ArrayList<>();
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectScore");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, placeCode);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
					slist.add(new Score(
								rset.getDouble(1) ,
								rset.getDouble(2) ,
								rset.getDouble(3) ,
								rset.getDouble(4)		
							));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		
		return slist;
		
		
	}
	
	
}
