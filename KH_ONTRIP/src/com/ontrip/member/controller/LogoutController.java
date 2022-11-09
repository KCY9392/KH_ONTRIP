package com.ontrip.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/logout.me")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LogoutController() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// logout 요청 처리 => session에 저장되어있는 loginUser정보를 만료시키기(session 무효화)
	    HttpSession session = request.getSession();
	    
	    session.invalidate();  //session 무효화
	    
	    
	    // 응답페이지 -> /jsp를 호출해주기
	    // url 재요청방식 => index.jsp 페이지
	    // response.sendRedirect("/jsp");
	    
	    request.getRequestDispatcher("views/common/loginForm.jsp").forward(request, response); // 매개변수가 "/jsp"로 들어감.
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
