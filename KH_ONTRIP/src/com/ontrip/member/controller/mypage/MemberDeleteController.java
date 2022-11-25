package com.ontrip.member.controller.mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 사용자 마이페이지 카테고리에서 회원탈퇴를 누를 경우, 회원탈퇴창으로 이동시키는 컨트롤러
 */
@WebServlet("/MemberDelete.me")
public class MemberDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MemberDeleteController() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/member/memberDelete.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
