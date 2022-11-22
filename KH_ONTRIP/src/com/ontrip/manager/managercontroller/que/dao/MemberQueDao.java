package com.ontrip.manager.managercontroller.que.dao;

import com.ontrip.question.vo.MemberQuestionBoard;
import com.ontrip.question.vo.MemberQuestionDetailed;
import com.ontrip.question.vo.Question;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.ontrip.common.JDBCTemplate.close;

public class MemberQueDao {

    private static final MemberQueDao instance = new MemberQueDao();


    public static MemberQueDao getInstance(){
        return  instance  ;
    }



    private Properties prop = new Properties();

    public MemberQueDao() {

        String fileName = MemberQueDao.class.getResource("/sql/manager/manager-mapper.xml").getPath();


        try {
            prop.loadFromXML(new FileInputStream(fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    public ArrayList<MemberQuestionBoard> memberQuestionBoards(int pageNum , int amount , Connection con ) throws SQLException {
        ArrayList<MemberQuestionBoard>  boardList = new ArrayList<MemberQuestionBoard>();
        String sql = prop.getProperty("memberQueList");
        PreparedStatement pstmt =  null;
        ResultSet rs = null;

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1,((pageNum - 1) * amount)+1);
            pstmt.setInt(2,pageNum * amount);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                MemberQuestionBoard board = new MemberQuestionBoard();
                board.setqCode(rs.getInt("Q_CODE"));
                board.setqTitle(rs.getString("Q_TITLE"));
                board.setqDate(rs.getDate("Q_DATE"));
                board.setMemName(rs.getString("MEM_NAME"));
                board.setMemNum(rs.getInt("MEM_NO"));
                board.setaContent(rs.getString("A_CONTENT"));

                boardList.add(board);
            }

        }catch (SQLException e) {e.printStackTrace();}
        finally {
            close(pstmt);
            close(rs);
        }
        return boardList;
    }




    public int getTotal(Connection con) throws SQLException {

        int total = 0;

        String sql = prop.getProperty("getTotal");

        PreparedStatement pstmt = null;

        ResultSet rs = null;

        try {
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                total = rs.getInt("total");
            }
            System.out.println("result = " + total);
        } catch (SQLException e) { e.printStackTrace(); } finally {
            close(pstmt);
        }

        return total;

    }

    public void save(Question question, Connection con) throws SQLException {

        PreparedStatement psmt = null;

        String sql = prop.getProperty("insertQuestion");

        System.out.println("question = " + question);

        try {
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, question.getMemNo());
            psmt.setString(2, question.getqTitle());
            psmt.setString(3, question.getqContent());
            psmt.setString(4, question.getaContent());
            psmt.executeUpdate();
        } catch (SQLException e ) {
            e.printStackTrace();
        } finally {
            close(psmt);
        }
    }

    public MemberQuestionDetailed getMemberQuestionBoard(int qCode, Connection con) throws SQLException {


        MemberQuestionDetailed memberQuestionBoard = new MemberQuestionDetailed();

        PreparedStatement psmt = null;
        ResultSet rs = null;
        String sql = prop.getProperty("questionByCode");

        try {
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, qCode);
            rs = psmt.executeQuery();
            if (rs.next()) {
                memberQuestionBoard.setqCode(rs.getInt("Q_CODE"));
                memberQuestionBoard.setqTitle(rs.getString("Q_TITLE"));
                memberQuestionBoard.setqContent(rs.getString("Q_CONTENT"));
                memberQuestionBoard.setaContent(rs.getString("A_CONTENT"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(psmt);
            close(rs);
        }

        return memberQuestionBoard;
    }


    public void updateQuestion(int qCode, String qTitle, String qContent, Connection con) throws SQLException {
        PreparedStatement psmt = null;
        try {
            psmt = con.prepareStatement(prop.getProperty("updateQuestion"));
            psmt.setString(1, qTitle);
            psmt.setString(2, qContent);
            psmt.setInt(3, qCode);
            psmt.executeUpdate();

    } catch (SQLException e) {e.printStackTrace();} finally {
            close(psmt);
        }
        }


    public void deleteMember(int qCode, Connection con) throws SQLException {

        String sql = prop.getProperty("deleteQuestion");
        PreparedStatement psmt = null;
        try {
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, qCode);
            psmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(psmt);
        }

    }
}
