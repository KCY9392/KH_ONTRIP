package com.ontrip.member.controller.login;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.member.model.service.MemberService;

/**
 * 회원가입시, 아이디 중복확인버튼 누를경우, 존재하는 아이디 여부 찾기 컨트롤러
 */
@WebServlet("/idCheck.me")
public class IdCheckController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public IdCheckController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String checkId = request.getParameter("checkId");
		
		int count = new MemberService().idCheck(checkId);
		
		if(count > 0) { // 중복된 아이디 존재 (사용불가)
			response.getWriter().print("NNNNN");
		}else { // 존재하는 아이디가 없음(사용가능)
			response.getWriter().print("NNNNY");
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
