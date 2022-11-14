package com.ontrip.question.dao.admin;

import com.ontrip.question.vo.Question;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import static com.ontrip.common.JDBCTemplate.close;

public class QuestionDao {


    private static final QuestionDao instance = new QuestionDao();

    public static QuestionDao getInstance(){
        return  instance  ;
    }



    private Properties prop = new Properties();

    public QuestionDao() {

        String fileName = QuestionDao.class.getResource("/sql/manager/manager-mapper.xml").getPath();


        try {
            prop.loadFromXML(new FileInputStream(fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    public int save(Question question, Connection con) throws SQLException {

        PreparedStatement psmt = null;

        String sql = prop.getProperty("insertQuestion");

        int result = 0;

        try {
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, question.getMemNo());
            psmt.setString(2, question.getqTitle());
            psmt.setString(3, question.getqContent());
            psmt.setDate(4, question.getqDate());
            psmt.setString(5, question.getaContent());
            psmt.setInt(6, question.getqCount());
            psmt.setString(7, question.getStatus());

            result = psmt.executeUpdate();
        } catch (SQLException e ) {
            e.printStackTrace();
        } finally {
            close(psmt);
        }
        return result;
    }

    public Question questionByCode(int qCode , Connection con) throws SQLException {
        String sql = prop.getProperty("questionByCode");

        PreparedStatement psmt = null;

        ResultSet rs = null;

        Question question = new Question();

        try {
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, qCode);
            rs = psmt.executeQuery();

            if (rs.next()) {
                question.setqCode(rs.getInt("Q_CODE"));
                question.setMemNo(rs.getInt("MEM_NO"));
                question.setqTitle(rs.getString("Q_TITLE"));
                question.setqContent(rs.getString("Q_CONTENT"));
                question.setqDate(rs.getDate("Q_DATE"));
                question.setaContent(rs.getString("A_CONTENT"));
                question.setqCount(rs.getInt("Q_COUNT"));
                question.setStatus(rs.getString("STATUS"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(psmt);}
        return question;
    }


    public List<Question> getList(int pageNum , int amount , Connection con) throws SQLException {

        List<Question> questions = new ArrayList<>();

        String sql = prop.getProperty("questionPaging");

        PreparedStatement psmt = null;

        ResultSet rs = null;

        System.out.println("sql = " + sql);

        try {

            psmt = con.prepareStatement(sql);
            psmt.setInt(1, ((pageNum - 1) * amount)+1);
            psmt.setInt(2, pageNum * amount);

            rs = psmt.executeQuery();

            while (rs.next()) {

                Question question = new Question();

                question.setqCode(rs.getInt("Q_CODE"));
                question.setMemNo(rs.getInt("MEM_NO"));
                question.setqTitle(rs.getString("Q_TITLE"));
                question.setqContent(rs.getString("Q_CONTENT"));
                question.setqDate(rs.getDate("Q_DATE"));
                question.setaContent(rs.getString("A_CONTENT"));
                question.setqCount(rs.getInt("Q_COUNT"));
                question.setStatus(rs.getString("STATUS"));

                questions.add(question);
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }finally {
            close(rs);
            close(psmt);
        }
        return questions;
    }


    public int getTotal(Connection con) throws SQLException {
        int result = 0 ;

        PreparedStatement pstmt = null ;

        ResultSet rs = null;

        String sql  = prop.getProperty("getTotal");

        System.out.println("sql = " + sql);


        try {
            pstmt = con.prepareStatement(sql);
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


    public void insertAnswer(Connection con, String answer, int qCode) {
        String sql = prop.getProperty("insertAnswer");

        PreparedStatement psmt = null;

        try {
            psmt = con.prepareStatement(sql);
            psmt.setString(1, answer);
            psmt.setInt(2, qCode);
            psmt.executeUpdate();
    } catch (SQLException e) { e.printStackTrace();} finally {
            close();
        }
        }

}
