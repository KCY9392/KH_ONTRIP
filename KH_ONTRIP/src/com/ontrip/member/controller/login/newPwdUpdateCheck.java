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
 * 회원정보 변경에서 비밀번호 변경하기 누를 경우, 호출되는 컨트롤러
 * update 성공시, 로그인Form으로
 * update 실패시, 다시 비밀번호 변경 페이지 재로딩
 */
@WebServlet("/newPwdUpdateCheck.le")
public class newPwdUpdateCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public newPwdUpdateCheck() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String newPwd = request.getParameter("newPwd");//새로운 비밀번호
		String checkPwd = request.getParameter("checkPwd"); //비밀번호 확인
		String memberId = request.getParameter("memberId");  //회원의 아이디
		System.out.println(memberId);
		
		if(newPwd.equals(checkPwd)) { // 새로운 비밀번호와 비밀번호 확인이 일치하면, 
			int result = new MemberService().findPwdupdate(newPwd, memberId);
			
			if(result > 0) { // 업데이트 성공
			
				response.setContentType("text/html;charset=UTF-8");
		        response.getWriter().print("<script>alert('비밀번호 재설정에 성공하였습니다.'); location.href = '/KH_ONTRIP/'</script>");
			
			}else { // 업데이트 실패
				
				response.setContentType("text/html;charset=UTF-8");
		        response.getWriter().print("<script>alert('비밀번호 재설정에 실패하였습니다.'); location.href = 'newPwd.le?memberPwd="+newPwd+"&memberId="+memberId+"'</script>");
			}
		}else { // 새로운 비밀번호와 비밀번호 확인이 일치하지않다면,
			
			response.setContentType("text/html;charset=UTF-8");
	        response.getWriter().print("<script>alert('비밀번호와 비밀번호확인이 일치하지않습니다.'); location.href = 'newPwd.le?memberPwd="+newPwd+"&memberId="+memberId+"'</script>");
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
