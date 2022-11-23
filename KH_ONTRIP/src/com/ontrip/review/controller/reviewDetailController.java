package com.ontrip.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.review.dao.ReviewDao;
import com.ontrip.review.service.ReviewService;
import com.ontrip.review.vo.Review;

//후기게시판에서 후기하나를 클릭 시, 후기상세창으로 가는 서블릿
@WebServlet("/detail.bo")
public class reviewDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public reviewDetailController() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int revCode = Integer.parseInt(request.getParameter("revCode"));
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
//		int placeCode = Integer.parseInt(request.getParameter("placeCode"));
		
		String placeName = request.getParameter("placeName");
		
		
		
	    //revCode 가 후기게시판에서 하나클릭할때 넘어와야됨
		
		Review re = new ReviewService().selectReviewDetail(revCode);
		request.setAttribute("re", re);
		request.setAttribute("revCode", revCode);
		request.getRequestDispatcher("views/review/reviewDetail.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
