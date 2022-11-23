package com.ontrip.review.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.ontrip.common.model.vo.PageInfo;
import com.ontrip.image.vo.Image;
import com.ontrip.member.model.vo.Member;
import com.ontrip.review.vo.Review;
import com.ontrip.score.dao.ScoreDao;
import com.ontrip.score.vo.Score;

import static com.ontrip.common.JDBCTemplate.*;

public class ReviewDao {
	
	private Properties prop = new Properties();
	
	public ReviewDao() {
		String fileName = ReviewDao.class.getResource("/sql/review/review-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertReview(Review r , Connection conn) {
		
		int result1 = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("insertReview");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, r.getRevCode());
			psmt.setInt(2, r.getPlcCode());
			psmt.setInt(3, r.getMemberNo());
			psmt.setString(4, r.getRevText());
			
			result1 = psmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		return result1;
	}
	
	public int insertScore(Score s , Connection conn) {
		
		int result2 = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("insertScore");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setDouble(1, s.getReviewStar());
			psmt.setDouble(2, s.getReview_c());
			psmt.setDouble(3, s.getReview_s());
			psmt.setDouble(4, s.getReview_p());
			psmt.setInt(5, s.getReviewCode());
			
			result2 = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		return result2;
	}
	
	public ArrayList<Review> selectReviewList(String placeName , Connection conn){
		
		ArrayList<Review> relist = new ArrayList<>();
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
				
		String sql = prop.getProperty("selectListReview");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, placeName);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				relist.add(new Review(
						rset.getInt("REV_CODE") ,
						rset.getString("PLC_NAME") ,
						rset.getDate("REV_DATE") ,
						rset.getString("MEM_NAME")
						));
			}
			System.out.println(relist);
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		return relist;
		
	}
	
	public Review selectReviewDetail(int revCode , Connection conn){
		
		Review re = new Review();
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReviewDetail");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, revCode);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				re = new Review(
						   rset.getString("PLC_NAME") ,
						   rset.getDate("REV_DATE") ,
						   rset.getString("MEM_NAME") ,
						   rset.getInt("REV_STAR") ,
						   rset.getInt("REV_C") ,
						   rset.getInt("REV_S") ,
						   rset.getInt("REV_P") ,
						   rset.getString("REV_TEXT")
						);
			}	
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		
		return re;
	}

	public int selectReviewNo(Connection conn) {
			
		int reviewNo = 0;
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectRevSeq");
		try {
			psmt = conn.prepareStatement(sql);
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				
				reviewNo = rset.getInt("rno");
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(psmt);
		}
		
		
		return reviewNo;
	}

	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("COUNT");
			}
				
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		
		return listCount;
	}

	public ArrayList<Review> selectPagingList(PageInfo pi , int placeCode , Connection conn) {
		
		ArrayList<Review> plist = new ArrayList<>();
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPagingList");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			/*
             * boardLimit 이 10이라고 가정.
             * 
             * currentPage = 1 => 시작값 1,  끝값 10
             * currentPage = 2 => 시작값 11, 끝값 20
             * currentPage = 3 => 시작값 21, 끝값 30
             *  
             * 시작값 = (currentPage -1) * boardLimit + 1;
             * 끝값 = 시작값 + boardLimit - 1;
             */
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
            int endRow = startRow + pi.getBoardLimit() -1;
            
            psmt.setInt(1, placeCode);
            psmt.setInt(2, startRow);
            psmt.setInt(3, endRow);
            
            rset = psmt.executeQuery();
            
            while(rset.next()) {
            	plist.add(new Review(
            				rset.getInt("REV_CODE") ,
            				rset.getString("PLC_NAME") ,
            				rset.getDate("REV_DATE") ,
            				rset.getString("MEM_NAME")
            			));
            }
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
	
		return plist;
	}

	public Member selectMemberName(int memberNo, Connection conn) {
		
		Member memberName = new Member();
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMemberName");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, memberNo);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				memberName = new Member(
						   rset.getString("memberName") 
						);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		
		return memberName;
	}

	public ArrayList<Review> selectmyPagePagingList(PageInfo pi, int memberNo, Connection conn) {
		
		ArrayList<Review> mylist = new ArrayList<>();
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("myPagePagingReviewList");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			/*
             * boardLimit 이 10이라고 가정.
             * 
             * currentPage = 1 => 시작값 1,  끝값 10
             * currentPage = 2 => 시작값 11, 끝값 20
             * currentPage = 3 => 시작값 21, 끝값 30
             *  
             * 시작값 = (currentPage -1) * boardLimit + 1;
             * 끝값 = 시작값 + boardLimit - 1;
             */
			
			int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() + 1;
            int endRow = startRow + pi.getBoardLimit() -1;
            
            psmt.setInt(1, memberNo);
            psmt.setInt(2, startRow);
            psmt.setInt(3, endRow);
            
            rset = psmt.executeQuery();
            
            while(rset.next()) {
            	mylist.add(new Review(
            				rset.getInt("REV_CODE") ,
            				rset.getString("PLC_NAME") ,
            				rset.getDate("REV_DATE") ,
            				rset.getString("MEM_NAME")
            			));
            }
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
	
		return mylist;
	}

	public int deleteReview(int memberNo, int revCode, Connection conn) {
		
		int result = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("deleteReview");
		
		try {
			psmt  = conn.prepareStatement(sql);
			
			psmt.setInt(1, memberNo);
			psmt.setInt(2, revCode);
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		
		return result;
	}

	public ArrayList<Image> selectMainImagelist(int placeCode, Connection conn) {
		
		ArrayList<Image> selectMainImagelist = new ArrayList<>();
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMainImage");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, placeCode);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				selectMainImagelist.add(new Image(
            				rset.getInt("FILE_NO") ,
            				rset.getString("FILE_PATH") ,
            				rset.getString("CHANGE_NAME")
            			));
            }
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		
		return selectMainImagelist;
	}

	public int selectHeartCount(int placeCode, Connection conn) {
	
		int selectHeartCount = 0;
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectHeartCount");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setInt(1, placeCode);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				selectHeartCount = rset.getInt("HEARTCOUNT");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		
		return selectHeartCount;
	}

	public int updateReview(Review rUpdate, Connection conn) {
		
		int result1 = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("updateReview");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, rUpdate.getRevText());
			psmt.setInt(2, rUpdate.getRevCode());
			
			System.out.println(rUpdate.getRevText() + "통과");
			System.out.println(rUpdate.getRevCode() + "통과");
			
			result1 = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		
		return result1;
	}
	
	public int updateScore(Score sUpdate, Connection conn) {
		
		int result3 = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("updateScore");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setDouble(1, sUpdate.getReviewStar());
			psmt.setDouble(2, sUpdate.getReview_c());
			psmt.setDouble(3, sUpdate.getReview_s());
			psmt.setDouble(4, sUpdate.getReview_p());
			psmt.setInt(5, sUpdate.getReviewCode());
			
			System.out.println(sUpdate.getReviewStar() + "통과");
			System.out.println(sUpdate.getReview_c() + "통과");
			System.out.println(sUpdate.getReview_s() + "통과");
			System.out.println(sUpdate.getReview_p() + "통과");
			System.out.println(sUpdate.getReviewCode() + "통과");
			
			result3 = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		
		return result3;
	}


}
