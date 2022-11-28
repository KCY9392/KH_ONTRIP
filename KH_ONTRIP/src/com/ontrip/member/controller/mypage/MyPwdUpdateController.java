package com.ontrip.member.controller.mypage;

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
 * 마이페이지 회원정보 - 비밀번호 변경창에서 원래 비번, 새로운 비번을 입력후, 변경하기를 누를 경우,
 * DB에 새로운 비밀번호로 update하는 컨트롤러
 * update 성공시, mypage.jsp로 이동
 * update 실패시, 다시 비밀번호 변경창으로 이동
 */
@WebServlet("/myPwdUpdate.me")
public class MyPwdUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyPwdUpdateController() {
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
//		System.out.println(updatePwd);
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
