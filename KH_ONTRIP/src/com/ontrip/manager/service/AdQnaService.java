package com.ontrip.manager.service;

import com.ontrip.common.JDBCTemplate;
import com.ontrip.manager.dao.AdQnaDao;
import com.ontrip.qna.vo.Qna;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdQnaService {


    AdQnaDao adQnaDao = AdQnaDao.getInstance();

    private static final AdQnaService instance = new AdQnaService();

    public static AdQnaService getInstance(){
        return  instance  ;
    }




    public void saveQna(String question , String answer , String category) throws SQLException {
        Connection con = JDBCTemplate.getConnection();

        Qna qna = new Qna();
        qna.setQaQuestion(question);
        qna.setQaAnswer(answer);
        qna.setQaCategory(category);

        adQnaDao.saveQna(con,qna);

//        close();

    }

    public ArrayList<Qna> selectByCategory(String category) throws SQLException {
        Connection con = JDBCTemplate.getConnection();

        ArrayList<Qna> qnaList = adQnaDao.selectByCategory(con, category);

        return qnaList;
    }


}
