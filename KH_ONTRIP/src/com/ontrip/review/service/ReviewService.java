package com.ontrip.review.service;

import com.ontrip.common.model.vo.PageInfo;
import com.ontrip.image.vo.Image;
import com.ontrip.member.model.dao.MemberDao;
import com.ontrip.member.model.vo.Member;
import com.ontrip.review.dao.ReviewDao;
import com.ontrip.review.vo.Review;
import com.ontrip.score.dao.ScoreDao;
import com.ontrip.score.vo.Score;

import static com.ontrip.common.JDBCTemplate.*;

import java.sql.Connection;
//import java.util.ArrayList;
import java.util.ArrayList;

public class ReviewService {
	
	ReviewDao rd = new ReviewDao();
	
	public int insertReview(Review r , Score s) {
		
		Connection conn = getConnection();
		
		int result1 = rd.insertReview(r , conn);
		
		close();
		
		return result1;
		
	}
	
	public int insertScore(Score s) {
			
			Connection conn = getConnection();
			
			int result = rd.insertScore(s , conn);
			
			if(result > 0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			close();
			
			return result;
		}

	public ArrayList<Review> selectReviewList(String placeName) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> relist = rd.selectReviewList(placeName ,  conn);
		
		close();
		
		return relist;
	}
	
	public Review selectReviewDetail(int revCode){
		
		Connection conn = getConnection();
		
		Review re = rd.selectReviewDetail(revCode , conn);
		
		close();
		
		return re;
	}

	//rev_code 생성하는 메소드
	public int selectReviewNo() {
		
		Connection conn = getConnection();
		
		int revCode = rd.selectReviewNo(conn);
		
		close();
		
		return revCode;
	}

	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int listCount = rd.selectListCount(conn);
		
		close();
		
		return listCount;
		
	}

	public ArrayList<Review> selectPagingList(PageInfo pi , int placeCode) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> plist = rd.selectPagingList(pi , placeCode , conn);
		
		close();
		
		return plist;
	}

	public Member selectMemberName(int memberNo) {
		
		Connection conn = getConnection();
		
		Member memberName = rd.selectMemberName(memberNo , conn);
		
		return memberName;
	}

	public ArrayList<Review> selectmyPagePagingList(PageInfo pi, int memberNo) {
		
		Connection conn = getConnection();
		
		ArrayList<Review> mylist = rd.selectmyPagePagingList(pi , memberNo , conn);
		
		close();
		
		return mylist;

	}

	public int deleteReview(int memberNo , int revCode) {
		
		Connection conn = getConnection();
		
		int result = rd.deleteReview(memberNo , revCode , conn);
		
		
		return result;
	}

	public ArrayList<Image> selectMainImagelist(int placeCode) {
		
		Connection conn = getConnection();
		
		ArrayList<Image> selectMainImagelist = rd.selectMainImagelist(placeCode , conn);
		
		return selectMainImagelist;
	}

	public int selectHeartCount(int placeCode) {
	
		Connection conn = getConnection();
		
		int result = rd.selectHeartCount(placeCode , conn);
		
		return result;
	}

	public int updateReview(Review rUpdate, Score sUpdate) {
		
		Connection conn = getConnection();
		
		int result1 = rd.updateReview(rUpdate , conn);
		int result2 = rd.updateScore(sUpdate , conn);
		
		if(result1 >0 && result2>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close();
		
		return result1*result2;
		
	}
	
	public int updateScore(Score sUpdate) {
		
		Connection conn = getConnection();
		
		int result3 = rd.updateScore(sUpdate , conn);
		
		if(result3 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close();
		
		return result3;
	}



	public int selectPlaceCode(int memberNo , String placeName) {
		
		Connection conn = getConnection();
		
		int placeCode = rd.selectPlaceCode(memberNo , placeName, conn);
		
		return placeCode;
	}

	public ArrayList<Image> selectMyImageList(String placeName) {
		
		Connection conn = getConnection();
		
		ArrayList<Image> selectMyImageList = rd.selectMyImageList(placeName , conn);
		
		return selectMyImageList;
	}

	
	//mypage 후기 삭제
	public void deleteMyReview(int revCode) {
		
		Connection conn = getConnection();
		
		rd.deleteMyReview(revCode, conn);
		
	}

	
	//이 시설을 예약한 회원인지 알아보기
	public int isReservationMem(int memberNo, int placeCode) {
		
		Connection conn = getConnection();
		
		int isYes = rd.isReservationMem(memberNo, placeCode, conn);
		
		return isYes;
	}

	


}