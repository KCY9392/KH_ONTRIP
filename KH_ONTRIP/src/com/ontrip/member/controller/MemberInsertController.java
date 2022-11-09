package com.ontrip.member.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ontrip.member.model.service.MemberService;
import com.ontrip.member.model.vo.Member;

@WebServlet("/MemberInsertController")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public MemberInsertController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		String memberName = request.getParameter("memberName");
		String gender = request.getParameter("gender");
		String phone = request.getParameter("phone");
		String birthDate = request.getParameter("birthDate");
		
		Member m = new Member(memberId, memberPwd, memberName, gender, phone, birthDate);
		
		int result = new MemberService().insertMember(m);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			session.setAttribute("alertMsg", "회원가입 성공!");
			
			response.sendRedirect();
		} else {
			request.setAttribute("errorMsg", "회원가입 실패");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
