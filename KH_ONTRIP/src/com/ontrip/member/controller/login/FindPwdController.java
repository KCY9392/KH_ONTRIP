package com.ontrip.member.controller.login;
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
 * 비밀번호찾기창에서 정보를 입력하고 비밀번호찾기버튼을 누를경우, 호출되는 컨트롤러
 */
@WebServlet("/findPwd.me")
public class FindPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public FindPwdController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String memberName = request.getParameter("memberName");
		String memberId = request.getParameter("memberId");
		System.out.println(memberId);
		String phone = request.getParameter("phone");
		
		int isMem = new MemberService().findMem(memberId);
		
		String memberPwd = new MemberService().findPwd(memberName, memberId, phone);
		System.out.println(memberPwd);
		
		Member m = new Member(memberId, memberPwd);
		request.setAttribute("m", m);
		
		
		if(isMem > 0) {
			request.getRequestDispatcher("views/common/pwdReveal.jsp").forward(request, response); // 현재 비밀번호 알려는 사이트 => "비밀번호 변경" / "메인으로" 
			
		}else {
			
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().print("<script>alert('존재하지 않는 회원입니다'); location.href = '/KH_ONTRIP/find.me'</script>");
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
