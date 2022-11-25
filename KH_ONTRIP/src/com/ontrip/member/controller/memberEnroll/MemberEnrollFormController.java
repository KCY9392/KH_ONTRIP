package com.ontrip.member.controller.memberEnroll;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 회원가입버튼을 누를경우, 회원가입창으로 이동시키는 컨트롤러
 */
@WebServlet("/enrollForm.me")
public class MemberEnrollFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MemberEnrollFormController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("views/member/memberEnrollForm.jsp");
	    view.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
