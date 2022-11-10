package com.ontrip.member.model.service;

import java.sql.Connection;

import com.ontrip.common.JDBCTemplate;
import static com.ontrip.common.JDBCTemplate.*;


import com.ontrip.member.model.dao.MemberDao;
import com.ontrip.member.model.vo.Member;

public class MemberService {
	
	public Member loginMember(String memberId, String memberPwd) {
		
		System.out.println("memberService 통과");
		Connection conn = JDBCTemplate.getConnection();
		Member m = new MemberDao().loginMember(memberId, memberPwd, conn);
		   
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
	
	public int idCheck(String checkId) {
		Connection conn = getConnection();
		
		int count = new MemberDao().idCheck(conn, checkId);
		
		close();
		
		return count;
	}
	
	public String findId(String memberName, String phone) {
		Connection conn = getConnection();
		
		String  memberId = new MemberDao().findId(memberName, phone, conn);
		
		close();
		
		return memberId;
	}
	
	public String findPwd(String memberName, String memberId, String phone) {
		Connection conn = getConnection();
		
		String  memberPwd = new MemberDao().findPwd(memberName, memberId,  phone, conn);
		
		close();
		
		return memberPwd;
	}
}
