package com.ontrip.manager.service;

import com.ontrip.common.JDBCTemplate;
import com.ontrip.question.dao.admin.QuestionDao;
import com.ontrip.question.vo.MemberQuestionBoard;
import com.ontrip.question.vo.MemberQuestionDetailed;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class AdQuestionService {

    QuestionDao dao = QuestionDao.getInstance();

    private static final AdQuestionService instance = new AdQuestionService();

    public static AdQuestionService getInstance(){
        return  instance  ;
    }



    public List<MemberQuestionBoard> getList(int pageNum, int amount) throws SQLException {
        Connection con = JDBCTemplate.getConnection();
        List<MemberQuestionBoard> list = dao.getList(pageNum, amount, con);
        return list;
    }

    public int getTotal() throws SQLException {
        Connection con = JDBCTemplate.getConnection();
        int total = dao.getTotal(con);
        return total;
    }


    public MemberQuestionDetailed getByCode(int qCode) throws SQLException {
        Connection con = JDBCTemplate.getConnection();
        MemberQuestionDetailed question = dao.questionByCode(qCode , con);
        return question;
    }


    public void insertAnswer(String answer , int qCode) {
        Connection con = JDBCTemplate.getConnection();
        dao.insertAnswer(con , answer , qCode);
    }




}
