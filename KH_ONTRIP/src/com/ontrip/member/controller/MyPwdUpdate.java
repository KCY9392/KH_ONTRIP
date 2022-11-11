package com.ontrip.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ontrip.member.model.service.MemberService;
import com.ontrip.member.model.vo.Member;

/**
 * Servlet implementation class MyPwdUpdate
 */
@WebServlet("/myPwdUpdate.me")
public class MyPwdUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPwdUpdate() {
        super();
  
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String updatePwd = request.getParameter("newPwd");
		String memberId = request.getParameter("userId");
		String memberPwd = request.getParameter("userPwd");
		System.out.println(updatePwd);
		Member myUpdatePwd = new MemberService().updateMyPwd(updatePwd , memberId , memberPwd);
		
		HttpSession session = request.getSession();
		
		if(myUpdatePwd == null) {
			session.setAttribute("alertMsg", "비밀번호 변경에 실패했습니다.");
			response.sendRedirect(request.getContextPath()+"/newpwd.me");
		}else {
			session.setAttribute("alertMsg", "비밀번호 변경에 성공하였습니다.");
			session.setAttribute("loginUser", myUpdatePwd);
			response.sendRedirect(request.getContextPath()+"/mypage.me");
		}
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
