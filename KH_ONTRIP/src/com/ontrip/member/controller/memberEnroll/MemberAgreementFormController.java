package com.ontrip.member.controller.memberEnroll;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 회원가입 시, 이용약관 동의하기 버튼 누를경우, 호출되는 컨트롤러
 */
@WebServlet("/agreeForm.me")
public class MemberAgreementFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberAgreementFormController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("views/member/memberAgreementForm.jsp");
	    view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
