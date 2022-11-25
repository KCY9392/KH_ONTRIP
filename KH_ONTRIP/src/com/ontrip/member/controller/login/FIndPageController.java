package com.ontrip.member.controller.login;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 로그인 창에서 아이디/비밀번호찾기 버튼을 누를경우, 호출되는 컨트롤러 -> 아이디/비번찾기창(find.jsp)으로 넘어감
 */
@WebServlet("/find.me")
public class FIndPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public FIndPageController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("views/common/find.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
