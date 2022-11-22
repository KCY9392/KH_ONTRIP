package com.ontrip.manager.service;

import com.ontrip.common.JDBCTemplate;
import com.ontrip.manager.dao.AdReviewDao;
import com.ontrip.review.vo.ReviewBoard;
import com.ontrip.review.vo.ReviewDetailedBoard;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdReviewService {

    AdReviewDao adReviewDao = AdReviewDao.getInstance();

    public static final AdReviewService instance = new AdReviewService();

    public static AdReviewService getInstance(){
        return instance;
    }


    public ArrayList<ReviewBoard> getList(String category , int pageNum , int amount  ) throws SQLException {
        Connection con = JDBCTemplate.getConnection();
        return adReviewDao.getReviews(con, category, pageNum, amount);
    }


    public int getTotal(String category) throws SQLException {
        Connection con = JDBCTemplate.getConnection();
        return adReviewDao.getTotal(con , category);
    }


    public ReviewDetailedBoard getReview(int revCode) throws SQLException {

        Connection con = JDBCTemplate.getConnection();

        ReviewDetailedBoard review = adReviewDao.getReview(con, revCode);

        return review;

    }


    public void deleteReview(int revCode) throws SQLException {
        Connection con = JDBCTemplate.getConnection();
        adReviewDao.deleteReview(revCode, con);
    }



}
