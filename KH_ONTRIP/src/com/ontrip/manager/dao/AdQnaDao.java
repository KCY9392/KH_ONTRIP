package com.ontrip.manager.dao;

import com.ontrip.qna.vo.Qna;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.ontrip.common.JDBCTemplate.close;

public class AdQnaDao {

    private static final AdQnaDao instance = new AdQnaDao();

    public static AdQnaDao getInstance(){
        return  instance  ;
    }


    private Properties prop = new Properties();

    public AdQnaDao() {

        String fileName = AdQnaDao.class.getResource("/sql/manager/manager-mapper.xml").getPath();

        try {
            prop.loadFromXML(new FileInputStream(fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public void saveQna(Connection con, Qna qna) throws SQLException {

        String sql = prop.getProperty("saveQna");
        PreparedStatement pstmt = null;

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, qna.getQaQuestion());
            pstmt.setString(2, qna.getQaAnswer());
            pstmt.setString(3, qna.getQaCategory());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close(pstmt);
        }
    }


    public ArrayList<Qna> selectByCategory(Connection con , String category) throws SQLException {

        ArrayList<Qna> qnas = new ArrayList<Qna>();

        String sql = prop.getProperty("selectByCategory");

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, category);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Qna qna = new Qna();
                qna.setQaCode(rs.getInt("QA_CODE"));
                qna.setQaQuestion(rs.getString("QA_QUESTION"));
                qna.setQaAnswer(rs.getString("QA_ANSWER"));
                qna.setQaCategory(rs.getString("QA_CATEGORY"));
                qna.setQaUploadDate(rs.getDate("QA_UPLOADDATE"));
                qna.setQaChangeDate(rs.getDate("QA_CHANGEDATE"));
                qna.setStatue(rs.getString("STATUS"));
                qnas.add(qna);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        return qnas;
    }


    public void deleteQna(Connection con, int qaCode) throws SQLException {

        String sql = prop.getProperty("deleteQna");
        PreparedStatement pstmt = null;

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, qaCode);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }
        }
}
