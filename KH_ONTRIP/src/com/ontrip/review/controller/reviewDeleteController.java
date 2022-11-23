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
 * Servlet implementation class reviewDeleteController
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
		String placeName = request.getParameter("placeName");
		
		request.setAttribute("memberNo", memberNo);
		request.setAttribute("revCode", revCode);
		
		int result = new ReviewService().deleteReview(memberNo , revCode);
		
		
		
		request.getRequestDispatcher("views/common/mainForm.jsp").forward(request, response);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
