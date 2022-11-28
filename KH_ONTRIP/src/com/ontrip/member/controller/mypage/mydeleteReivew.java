package com.ontrip.member.controller.mypage;

import java.io.IOException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.review.service.ReviewService;

/**
 * Servlet implementation class mydeleteReivew
 */
// 마이페이지 리뷰 삭제 후 다시 마이페이지 등록 리뷰로 이동.
@WebServlet("/mydeleteReivew.re")
public class mydeleteReivew extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mydeleteReivew() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int revCode = Integer.parseInt(request.getParameter("revCode"));
//		int placeCode = Integer.parseInt(request.getParameter("placeCode"));
//		System.out.println(placeCode);
		String placeName = request.getParameter("placeName");
		request.setAttribute("placeName", placeName);
		System.out.println(placeName+"11111111111");
		request.setAttribute("memberNo", memberNo);
		request.setAttribute("revCode", revCode);
		
		int result = new ReviewService().deleteReview(memberNo , revCode);
		
		response.sendRedirect(request.getContextPath()+"/mypageReviewList.me?memberNo="+memberNo);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
