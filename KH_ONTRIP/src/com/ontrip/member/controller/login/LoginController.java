package com.ontrip.member.controller.login;

import com.ontrip.member.model.service.MemberService;
import com.ontrip.member.model.vo.Member;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * 로그인Form에서 로그인버튼을 누를 경우, 호출되는 컨트롤러
 */
@WebServlet("/login.me")

public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public LoginController() {
        super();
    }

    MemberService ms = new MemberService();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
//		System.out.println("로그인하는중");
		
		request.setCharacterEncoding("UTF-8");
		
		String memberId = request.getParameter("memberId");

//		System.out.println("memberId = " + memberId);

		String memberPwd = request.getParameter("memberPwd");

//		System.out.println("memberPwd = " + memberPwd);

		
		Member loginUser = ms.loginMember(memberId, memberPwd);
		
		if(loginUser == null) { // login 실패 => 에러페이지 응답
			
			HttpSession session = request.getSession();
			
			if(memberId.equals("admin")&&memberPwd.equals("1234")) { //관리자계정으로 로그인하였을경우
				
				request.getRequestDispatcher("/placeList.mn?categoryCode=PP").forward(request, response);

			}else {
				
			
			session.setAttribute("alertMsg", "0");
			response.sendRedirect(request.getContextPath());
			
			
			}
		}else { // login 성공 
			
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			
			session.setAttribute("alertMsg", "1");

			response.sendRedirect(request.getContextPath());
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
