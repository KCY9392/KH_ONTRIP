package com.ontrip.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.ontrip.common.JDBCTemplate;
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
						   rset.getInt("memberNo"),
						   rset.getString("memberId"),
						   rset.getString("memberPwd"),
						   rset.getString("memberName"),
						   rset.getString("Gender"),
						   rset.getString("Phone"),
						   rset.getString("BirthDate"),
						   rset.getString("Unregisiter"),
						   rset.getDate(""),
						   rset.getDate("MODIFY_DATE"),
						   rset.getString("STATUS"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(psmt);
		}
		
		return m;
	}
}
