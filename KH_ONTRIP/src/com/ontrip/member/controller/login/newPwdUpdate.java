package com.ontrip.member.controller.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.member.model.vo.Member;

/**
 * 비밀번호찾기에서 비밀번호 변경하기 버튼을 누를경우, 호출되는 컨트롤러(비밀번호 변경작성창)
 */
@WebServlet("/newPwd.le")
public class newPwdUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public newPwdUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//회원의 원래비밀번호 가져오기
		String memberPwd = request.getParameter("memberPwd");
		
		//회원의 아이디 가져오기
		String memberId = request.getParameter("memberId");
		
		Member m = new Member(memberId, memberPwd);
		request.setAttribute("m", m);
		
		request.getRequestDispatcher("views/common/newPwdUpdate.jsp").forward(request, response); // 변경할 비밀번호 확인 위한 jsp
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
