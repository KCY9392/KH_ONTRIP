package com.ontrip.member.controller.mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.review.service.ReviewService;

/***
 * 마이페이지 - 후기 삭제
 */
@WebServlet("/MyreviewDelete")
public class MyreviewDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MyreviewDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//memberNo=<%=memberNo %>&revCode=<%=revCode %>
		
		String memberName = request.getParameter("memberName");
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int revCode = Integer.parseInt(request.getParameter("revCode"));
		
		new ReviewService().deleteMyReview(revCode);
		
		response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print("<script>alert('삭제완료'); location.href = '/KH_ONTRIP/mypageReviewList.me?memberNo="+memberNo+"'</script>");
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
