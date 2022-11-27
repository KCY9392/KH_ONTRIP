package com.ontrip.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.review.service.ReviewService;
import com.ontrip.review.vo.Review;

/**
 * 후기게시판에서 사용자가 후기 삭제할 시, 호출되는 컨트롤러
 */
@WebServlet("/deleteReivew.re")
public class reviewDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public reviewDeleteController() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int revCode = Integer.parseInt(request.getParameter("revCode"));
		int placeCode = Integer.parseInt(request.getParameter("placeCode"));
		System.out.println(placeCode);
		String placeName = request.getParameter("placeName");
		request.setAttribute("placeName", placeName);
		System.out.println(placeName+"11111111111");
		request.setAttribute("memberNo", memberNo);
		request.setAttribute("revCode", revCode);
		
		int result = new ReviewService().deleteReview(memberNo , revCode);
		
//		request.getRequestDispatcher(request.getContextPath()+"/review.re?memberNo="+memberNo+"&placeName="+placeName+"&placeCode="+placeCode).forward(request, response);
		response.sendRedirect(request.getContextPath()+"/review.re?memberNo="+memberNo+"&placeName="+placeName+"&placeCode="+placeCode);
//		request.getRequestDispatcher("views/review/reviewList.jsp?memberNo="+memberNo+"&placeName="+placeName+"&placeCode="+placeCode);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
