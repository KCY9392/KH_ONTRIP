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
 * 마이페이지-회원정보 변경창에서 변경할 회원정보들을 작성 후, 변경하기를 누를 경우, DB에 회원정보 update하는 컨트롤러
 * update 성공시, 마이페이지(회원정보)창으로 이동
 * update 실패시, 다시 회원정보 변경창으로 이동
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MemberUpdateController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 1) 인코딩 설정
	    request.setCharacterEncoding("UTF-8");
	    
	    // 2) 요청시 전달받은 값들 뽑아서 변수 및 객체에 담기
    	String memberName = request.getParameter("userName");
    	String memberPhoneNumber = request.getParameter("userPhoneNumber");
    	String memberId = request.getParameter("userId");
    	
//    	System.out.println(memberName );
    	if(memberName == null) {
    		request.setAttribute("errorMsg" , "여행자 정보 수정에 실패했습니다.");
    		request.getRequestDispatcher("views/myPage/memberinfo.jsp").forward(request, response);
    		return;
    	}
    	
    	// Member객체 생성
    	Member m = new Member(memberName ,  memberPhoneNumber , memberId);
	    
    	// 3) 요청 처리
		Member updateMember = new MemberService().updateMember(m);
		
		if(updateMember == null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", updateMember);
			session.setAttribute("alertMsg", "회원정보 수정에 실패했습니다."); // 회원정보가 없을때 , 수정에 실패했을때 
			request.getRequestDispatcher("views/member/mypage.jsp").forward(request, response);
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", updateMember);
			session.setAttribute("alertMsg", "성공적으로 회원정보를 수정했습니다.");
			request.getRequestDispatcher("views/member/mypage.jsp").forward(request, response);
			//1. id값 쿼리문 업데이트 조건에 추가
			//2. 변경된 멤버객체로 새롭게 샐랙트
			//3. 세션에 변경된 맴버객체로 데이터 추가
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
