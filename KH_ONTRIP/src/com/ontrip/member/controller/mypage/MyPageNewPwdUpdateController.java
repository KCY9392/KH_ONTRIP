package com.ontrip.member.controller.mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 마이페이지 회원정보 - 원래 비밀번호 확인창에서 
 * 원래 비밀번호를 입력 후, 
 * 비밀번호변경을 누를 경우, 비밀번호 변경창으로 이동시키는 컨트롤러
 */
@WebServlet("/newpwd.me")
public class MyPageNewPwdUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyPageNewPwdUpdateController() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("views/myPage/myPageNewPwdUpdate.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
