package com.ontrip.member.controller.mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 마이페이지 회원정보창에서 비밀번호 변경을 누를 경우, 원래 비밀번호 확인창으로 이동시키는 컨트롤러
 */
@WebServlet("/myPwdcheck.me")
public class MypagePwdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MypagePwdCheckController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("views/myPage/myPagePwdCheck.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
