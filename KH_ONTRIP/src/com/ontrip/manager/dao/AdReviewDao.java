package com.ontrip.manager.dao;

import com.ontrip.review.vo.ReviewBoard;
import com.ontrip.review.vo.ReviewDetailedBoard;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.ontrip.common.JDBCTemplate.close;

public class AdReviewDao {

    private static final AdReviewDao instance = new AdReviewDao();

    public static AdReviewDao getInstance(){
        return  instance  ;
    }



    private Properties prop = new Properties();

    public AdReviewDao() {

        String fileName = AdReviewDao.class.getResource("/sql/manager/manager-mapper.xml").getPath();

        try {
            prop.loadFromXML(new FileInputStream(fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    public ArrayList<ReviewBoard> getReviews(Connection con , String category , int pageNum , int amount) throws SQLException {

        ArrayList<ReviewBoard> reviews = new ArrayList<ReviewBoard>();

        PreparedStatement pstmt = null;

        ResultSet rs = null;

        String sql = prop.getProperty("ReviewPaging");


        try {

             pstmt = con.prepareStatement(sql);
             pstmt.setString(1,category);
             pstmt.setInt(2, ((pageNum - 1) * amount)+1);
             pstmt.setInt(3, pageNum * amount);

             rs = pstmt.executeQuery();

             while (rs.next()) {
                 ReviewBoard reviewBoard = new ReviewBoard();
                 reviewBoard.setRevCode((rs.getInt("REV_CODE")));
                 reviewBoard.setPlcName(rs.getString("PLC_NAME"));
                 reviewBoard.setMemName(rs.getString("MEM_NAME"));
                 reviewBoard.setRnDate(rs.getDate("REV_DATE"));
                 reviewBoard.setCategory(rs.getString("CATEGORY_CODE"));

                 reviews.add(reviewBoard);
             }
        } catch (SQLException e) {e.printStackTrace();}
        finally {
            close(pstmt);
            close(rs);
        }
        return reviews;
    }





    public int getTotal(Connection con , String category) throws SQLException {

        int result = 0 ;

        PreparedStatement pstmt = null ;

        ResultSet rs = null;

        String sql  = prop.getProperty("getReviewTotal");

        System.out.println("sql = " + sql);


        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,category);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                result = rs.getInt("total");
            }
            System.out.println("result = " + result);
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close(rs);
            close(pstmt);
        }
        return result;
    }


    public ReviewDetailedBoard getReview(Connection con , int revCode) throws SQLException {
        String sql = prop.getProperty("reviewDetailed");
        PreparedStatement psmt =  null;
        ResultSet rs = null;
        ReviewDetailedBoard reviewBoard = new ReviewDetailedBoard();

        try {
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, revCode);

            rs = psmt.executeQuery();

            while (rs.next()) {
                reviewBoard = new ReviewDetailedBoard(rs.getString("PLC_NAME"),
                		rs.getString("MEM_NAME"),
                		rs.getDate("REV_DATE"),
                		rs.getString("REV_TEXT"),
                		rs.getInt("REV_STAR"),
                		rs.getInt("REV_C"),
                		rs.getInt("REV_S"),
                		rs.getInt("REV_P"),
                		rs.getString("CATEGORY_CODE"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(psmt);
        }
        return reviewBoard;
        }


    public void deleteReview(int revCode, Connection con) throws SQLException {
        String sql = prop.getProperty("deleteReview");
        PreparedStatement psmt =  null;
        System.out.println("daorevcode = " + revCode);
        try {
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, revCode);
            psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(psmt);
        }
        }

}
