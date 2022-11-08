package com.ontrip.member.model.service;

import java.sql.Connection;

import com.ontrip.common.JDBCTemplate;
import com.ontrip.member.model.dao.MemberDao;
import com.ontrip.member.model.vo.Member;

public class MemberService {

	
	public Member loginMember(String userId, String userPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		Member m = new MemberDao().loginMember(userId, userPwd, conn);
		   
		JDBCTemplate.close();
		   
		return m;
		
	}
}
