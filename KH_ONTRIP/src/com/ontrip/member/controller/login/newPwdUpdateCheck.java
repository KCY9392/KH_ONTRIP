package com.ontrip.member.controller.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 비밀번호가 변경된 후 로그인폼으로 이동.
@WebServlet("/newPwdUpdateCheck.le")
public class newPwdUpdateCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public newPwdUpdateCheck() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath()); // 로그인 폼으로 포워드
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
