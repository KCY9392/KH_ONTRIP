package com.ontrip.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ontrip.member.model.service.MemberService;
import com.ontrip.member.model.vo.Member;

@WebServlet("/login.me")

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginController() {
        super();
    }

    MemberService ms = new MemberService();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		System.out.println("들어오니");
		
		request.setCharacterEncoding("UTF-8");
		
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		
		Member loginUser = ms.loginMember(userId, userPwd);
		
		if(loginUser == null) { // login 실패 => 에러페이지 응답
			
			request.setAttribute("errorMsg", "로그인에 실패하였습니다");
			
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			
			view.forward(request, response);
			
		}else { // login 성공 
			
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			session.setAttribute("alertMsg", "로그인에 성공하였습니다");
			
			response.sendRedirect("/views/common/mainForm.jsp");
			 // 프로젝트의 기본경로 
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
