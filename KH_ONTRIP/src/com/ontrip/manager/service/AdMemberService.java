package com.ontrip.manager.service;

import com.ontrip.common.JDBCTemplate;
import com.ontrip.manager.dao.ManagerDao;
import com.ontrip.member.model.vo.Member;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdMemberService {

    ManagerDao managerDao = ManagerDao.getInstance();

    private static final AdMemberService instance = new AdMemberService();

    public static AdMemberService getInstance() {
        return instance;
    }


    public ArrayList<Member> adminMemberList() throws SQLException {

        Connection con = JDBCTemplate.getConnection();

        ArrayList<Member> members = managerDao.adMinMembers(con);

        JDBCTemplate.close();

        return members;

    }


    public Member adminMemberDetails(int memberNo) throws SQLException {

        Connection con = JDBCTemplate.getConnection();

        Member member = managerDao.adMinMember(memberNo, con);

        JDBCTemplate.close();

        return member;

    }


}
