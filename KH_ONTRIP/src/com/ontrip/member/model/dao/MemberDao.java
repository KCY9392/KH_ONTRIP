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
   
   public Member loginMember(String memberId, String memberPwd, Connection conn) {
      // select문 => ResultSet객체 => Member객체
      Member m = null;
      
      PreparedStatement psmt = null;
      
      ResultSet rset = null;
      
      String sql = prop.getProperty("loginMember");
      
      
      try {
         psmt = conn.prepareStatement(sql);
         
         psmt.setString(1, memberId);
         psmt.setString(2, memberPwd);
         
         rset = psmt.executeQuery(); //실행하고 결과얻기
         
         //값이 무조건 하나일 수 밖에 없으니까 while문이 아닌 if문 활용
         if(rset.next()) {
            m = new Member(
                     rset.getInt("MEM_NO"),
                     rset.getString("MEM_ID"),
                     rset.getString("MEM_PWD"),
                     rset.getString("MEM_NAME"),
                     rset.getString("MEM_GENDER"),
                     rset.getString("MEM_PHONE"),
                     rset.getString("MEM_BIRTH"),
                     rset.getString("STATUS"),
                     rset.getDate("MEM_ENROLLDATE"),
                     rset.getDate("MEM_MODIFYDATE"));
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
         psmt.setString(6, m.getBirthDate());

         result = psmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(psmt);
      }
      return result;
   }
   
   public int idCheck(Connection conn, String checkId) {
      
      int count = 0;
      
      PreparedStatement psmt = null;
      
      ResultSet rset = null;
      
      String sql = prop.getProperty("idCheck");
      
      try {
         psmt = conn.prepareStatement(sql);
         
         psmt.setString(1, checkId);
         
         rset = psmt.executeQuery();
         
         if(rset.next()) {
            count = rset.getInt(1);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(psmt);
      }
      return count;
      
   }
   public String findId(String memberName, String phone, Connection conn) {
	      String memberId = null;
	      
	      ResultSet rset = null;
	      PreparedStatement psmt = null;
	      
	      String sql = prop.getProperty("findId");
	      
	      try {
	         psmt = conn.prepareStatement(sql);
	         
	         psmt.setString(1, memberName);
	         psmt.setString(2, phone);
	         
	         rset = psmt.executeQuery();
	         
	         if(rset.next()) {
	            memberId = rset.getString("MEM_ID");
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(psmt);
	      }
	      
	      return memberId;
	   }
	   
	   public String findPwd(String memberName, String memberId, String phone, Connection conn) {
	      
	      String memberPwd = null;
	      
	      ResultSet rset = null;
	      
	      PreparedStatement psmt = null;
	      
	      String sql = prop.getProperty("findPwd");
	      
	      try {
	         psmt = conn.prepareStatement(sql);
	         
	         psmt.setString(1, memberName);
	         psmt.setString(2, memberId);
	         psmt.setString(3, phone);
	         
	         rset = psmt.executeQuery();
	         
	         if(rset.next()) {
	            memberPwd = rset.getString("MEM_PWD");
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(psmt);
	      }
	      
	      return memberPwd;
	   }

   public int updateMember(Member m , Connection conn) {
      
      int result = 0;
      
      PreparedStatement psmt = null;
      
      String sql = prop.getProperty("updateMember");
      
      try {
         psmt = conn.prepareStatement(sql);
         
         psmt.setString(1, m.getMemberName());
         psmt.setString(2, m.getPhone());
         psmt.setString(3, m.getMemberId());
         
         result = psmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(psmt);
      }
      
      return result;
      
   }
   
   public Member selectMember(String memberId , Connection conn) {
	   
	   Member m = null;
	   
	   PreparedStatement psmt = null;
	    
	   ResultSet rset = null;
	   
	   String sql = prop.getProperty("selectMember");
	   
	   try {
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, memberId);
		
		rset = psmt.executeQuery();
		
		if(rset.next()) {
			 m = new Member(
	                   	 rset.getInt("MEM_NO"),
	                     rset.getString("MEM_ID"),
	                     rset.getString("MEM_PWD"),
	                     rset.getString("MEM_NAME"),
	                     rset.getString("MEM_GENDER"),
	                     rset.getString("MEM_PHONE"),
	                     rset.getString("MEM_BIRTH"),
	                     rset.getString("STATUS"),
	                     rset.getDate("MEM_ENROLLDATE"),
	                     rset.getDate("MEM_MODIFYDATE"));
	         
		}
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(psmt);
	}
	   return m;
	   
   }
   
   public int updateMyPwd(String updatePwd , String memberId , String memberPwd , Connection conn) {
	   
	   int result = 0;
	   
	   PreparedStatement psmt = null;
	   
	   String sql = prop.getProperty("updateMyPwd");
	   
	   try {
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, updatePwd);
		psmt.setString(2, memberId);
		psmt.setString(3, memberPwd);
		
		result = psmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(psmt);
	}
	   return result;
	   
   }
   
   public int deleteMember(String memberId , String memberPwd , Connection conn) {
	   
	   int result = 0;
	   
	   PreparedStatement psmt = null;
	   
	   String sql = prop.getProperty("deleteMember");
	   
	   try {
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, memberId);
		psmt.setString(2, memberPwd);
		
		result = psmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(psmt);
	}
	  return result;
   }
}
   
