package com.ontrip.manager.managercontroller.que.service;

import com.ontrip.common.JDBCTemplate;
import com.ontrip.manager.managercontroller.que.dao.MemberQueDao;
import com.ontrip.question.vo.MemberQuestionBoard;
import com.ontrip.question.vo.MemberQuestionDetailed;
import com.ontrip.question.vo.Question;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberQueService {

    public static final MemberQueService instance = new MemberQueService();

    public static MemberQueService getInstance() {
        return instance;

    }

    MemberQueDao memberQueDao = MemberQueDao.getInstance();

    public ArrayList<MemberQuestionBoard> getList(int pageNum , int amount) throws SQLException {

        Connection con = JDBCTemplate.getConnection();


        ArrayList<MemberQuestionBoard> memberQuestionBoards = memberQueDao.memberQuestionBoards(pageNum, amount, con);


        return memberQuestionBoards;

    }


    public int getTotal() throws SQLException {

        Connection con = JDBCTemplate.getConnection();

        int total = memberQueDao.getTotal(con);

        return total;

    }


    public void getWrite(Question question) throws SQLException {

        Connection con = JDBCTemplate.getConnection();

        memberQueDao.save(question , con);

    }


    public MemberQuestionDetailed getMemberQuestionBoard(int qCode) throws SQLException {
        Connection con = JDBCTemplate.getConnection();

        return memberQueDao.getMemberQuestionBoard(qCode, con);
    }


    public void updateQuestion(String qTitle, String qContent, int qCode) throws SQLException {

        Connection con = JDBCTemplate.getConnection();
        memberQueDao.updateQuestion(qCode, qTitle, qContent , con);

    }


    public void deleteMember(int qCode) throws SQLException {
        Connection con = JDBCTemplate.getConnection();
        memberQueDao.deleteMember(qCode, con);

    }
}
