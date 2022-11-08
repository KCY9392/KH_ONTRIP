package com.ontrip.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.ontrip.common.JDBCTemplate.*;
import com.ontrip.member.model.vo.Member;

public class MemberDao {


   private Properties prop = new Properties();
   
   public MemberDao() {
      
      String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();
      
      try {
         prop.loadFromXML(new FileInputStream(fileName));
      } catch (IOException e) {
         e.printStackTrace();
      }
      
   }
   
   public Member loginMember(String userId, String userPwd, Connection conn) {
      // select문 => ResultSet객체 => Member객체
      Member m = null;
      
      PreparedStatement psmt = null;
      
      ResultSet rset = null;
      
      String sql = prop.getProperty("loginMember");
      
      
      try {
         psmt = conn.prepareStatement(sql);
         
         psmt.setString(1, userId);
         psmt.setString(2, userPwd);
         
         rset = psmt.executeQuery(); //실행하고 결과얻기
         
         //값이 무조건 하나일 수 밖에 없으니까 while문이 아닌 if문 활용
         if(rset.next()) {
            m = new Member(
                     rset.getString("memberId"),
                     rset.getString("memberPwd"),
                     rset.getString("memberName"),
                     rset.getString("gender"),
                     rset.getString("phone"),
                     rset.getString("birthDate"));
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(psmt);
      }
      
      return m;
   }
   
   public int insertMember(Member m, Connection conn) {
	   
	   // insert 문 처리된 행의 갯수 반환해서 result에 저장
	   int result = 0;
	   
	   PreparedStatement psmt = null;
	   
	   String sql = prop.getProperty("insertMember");
	   
	   try {
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, m.getMemberId());
		psmt.setString(2, m.getMemberPwd());
		psmt.setString(3, m.getMemberName());
		psmt.setString(4, m.getGender());
		psmt.setString(5, m.getPhone());
		psmt.setString(6,  m.getBirthDate());
		
		result = psmt.executeUpdate();
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(psmt);
	}
	   return result;
   }
}
	

