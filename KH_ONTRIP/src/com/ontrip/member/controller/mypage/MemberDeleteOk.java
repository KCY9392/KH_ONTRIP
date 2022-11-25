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
 * 마이페이지 회원탈퇴에서 회원탈퇴 사유를 적고, 회원탈퇴버튼을 누를 경우, 회원탈퇴시키는 컨트롤러
 */
@WebServlet("/memberDeleteOk.me")
public class MemberDeleteOk extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberDeleteOk() {
        super();
 
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String memberId = ((Member) session.getAttribute("loginUser")).getMemberId();
		String memberPwd = ((Member) session.getAttribute("loginUser")).getMemberPwd();
		
		int result = new MemberService().deleteMember(memberId , memberPwd);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "그동안 온트립을 이용해주셔서 감사합니다.");
			session.removeAttribute("loginUser");
			request.getRequestDispatcher("views/common/loginForm.jsp").forward(request, response);
		}else {
			request.setAttribute("errorMsg", "회원탈퇴에 실패하였습니다.");
			request.getRequestDispatcher("views/common/mainForm.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
