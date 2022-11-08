package com.ontrip.member.model.service;

<<<<<<< Updated upstream
import java.sql.Connection;

import com.ontrip.common.JDBCTemplate;
=======
import static com.ontrip.common.JDBCTemplate.*;

import java.sql.Connection;

>>>>>>> Stashed changes
import com.ontrip.member.model.dao.MemberDao;
import com.ontrip.member.model.vo.Member;

public class MemberService {

<<<<<<< Updated upstream
	
	public Member loginMember(String userId, String userPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		Member m = new MemberDao().loginMember(userId, userPwd, conn);
		   
		JDBCTemplate.close();
		   
		return m;
		
=======
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
>>>>>>> Stashed changes
	}
}
