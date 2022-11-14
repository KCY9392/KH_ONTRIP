package com.ontrip.manager.dao;

import com.ontrip.member.model.dao.MemberDao;
import com.ontrip.member.model.vo.Member;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.ontrip.common.JDBCTemplate.close;

public class ManagerDao {

    private static final ManagerDao instance = new ManagerDao();

    public static ManagerDao getInstance(){
        return  instance  ;
    }


    private Properties prop = new Properties();

    public ManagerDao() {

        String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();

        try {
            prop.loadFromXML(new FileInputStream(fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    public ArrayList<Member> adMinMembers(Connection con) throws SQLException {

        ArrayList<Member> members = new ArrayList<Member>();

        ResultSet rs = null;

        PreparedStatement psmt = null;

        String sql = prop.getProperty("memberList");

        try {

            psmt = con.prepareStatement(sql);
            rs = psmt.executeQuery();

            while (rs.next()) {
                Member member = new Member();
                member.setMemberNo(rs.getInt("MEM_NO"));
                member.setMemberId(rs.getString("MEM_ID"));
                member.setMemberPwd(rs.getString("MEM_PWD"));
                member.setMemberName(rs.getString("MEM_NAME"));
                member.setGender(rs.getString("MEM_GENDER"));
                member.setPhone(rs.getString("MEM_PHONE"));
                member.setBirthDate(rs.getString("MEM_BIRTH"));
                member.setStatus(rs.getString("STATUS"));
                member.setEnrollDate(rs.getDate("MEM_ENROLLDATE"));
                member.setModifyDate(rs.getDate("MEM_MODIFYDATE"));
                members.add(member);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(psmt);
        }

        return members;
    }

    public Member adMinMember(int memberNo , Connection con) throws SQLException {

        ResultSet rs = null;

        PreparedStatement psmt = null;

        String sql = prop.getProperty("memberByNo");
        Member member = new Member();

        try {
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, memberNo);
            rs = psmt.executeQuery();
            if (rs.next()) {
                member.setMemberNo(rs.getInt("MEM_NO"));
                member.setMemberId(rs.getString("MEM_ID"));
                member.setMemberPwd(rs.getString("MEM_PWD"));
                member.setMemberName(rs.getString("MEM_NAME"));
                member.setGender(rs.getString("MEM_GENDER"));
                member.setPhone(rs.getString("MEM_PHONE"));
                member.setBirthDate(rs.getString("MEM_BIRTH"));
                member.setStatus(rs.getString("STATUS"));
                member.setEnrollDate(rs.getDate("MEM_ENROLLDATE"));
                member.setModifyDate(rs.getDate("MEM_MODIFYDATE"));
                return member;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            close(rs);
            close(psmt);
        }
        return member;
    }


}
