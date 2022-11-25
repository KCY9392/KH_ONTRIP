package com.ontrip.member.controller.login;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ontrip.member.model.service.MemberService;

/**
 * 아이디 찾기창에서 해당 정보 작성하고 아이디 찾기버튼을 누를경우, 호출되는 컨트롤러
 */
@WebServlet("/findId.me")
public class FindIdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       MemberService ms = new MemberService();
    
    public FindIdController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String memberName = request.getParameter("memberName");
		String phone = request.getParameter("phone");
		
		String memberId = ms.findId(memberName, phone);
		
		request.setAttribute("memberId", memberId);
		
		if(memberId == null) {
			request.setAttribute("errorMsg", "존재하지않는 회원입니다.");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			
		}else {
			HttpSession session = request.getSession();
			
			session.setAttribute("alertMsg", memberId+"입니다.");
			
			request.getRequestDispatcher("views/common/find.jsp").forward(request, response);
			
		}
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
