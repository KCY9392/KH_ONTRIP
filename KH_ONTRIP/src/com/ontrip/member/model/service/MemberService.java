package com.ontrip.member.model.service;

import java.sql.Connection;

import com.ontrip.common.JDBCTemplate;
import static com.ontrip.common.JDBCTemplate.*;


import com.ontrip.member.model.dao.MemberDao;
import com.ontrip.member.model.vo.Member;

public class MemberService {
	
	public Member loginMember(String userId, String userPwd) {
		
		System.out.println("memberService 통과");
		Connection conn = JDBCTemplate.getConnection();
		Member m = new MemberDao().loginMember(userId, userPwd, conn);
		   
		JDBCTemplate.close();
		   
		return m;
		
	}
	
	public int insertMember(Member m) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(m, conn);
		
		if(result > 0) { //성공
			commit(conn);
		}else { // 실패
			rollback(conn);
		}
		close();
		
		return result;
	}
}
