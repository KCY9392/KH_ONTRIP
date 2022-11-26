package com.ontrip.member.controller.mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.image.vo.Image;
import com.ontrip.review.service.ReviewService;
import com.ontrip.review.vo.Review;

/**
 * Servlet implementation class MyreviewDetailController
 */
@WebServlet("/mydetail.bo")
public class MyreviewDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyreviewDetailController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String placeName = request.getParameter("placeName");
		System.out.println(placeName+"통과됨");
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int placeCode = new ReviewService().selectPlaceCode(memberNo , placeName);
		request.setAttribute("placeCode", placeCode);
		
		ArrayList<Image> myImageList = new ReviewService().selectMyImageList(placeName);
		request.setAttribute("myImageList", myImageList);
		
		int revCode = Integer.parseInt(request.getParameter("revCode"));
		
		Review re = new ReviewService().selectReviewDetail(revCode);
		request.setAttribute("re", re);
		
		request.getRequestDispatcher("views/myPage/myPageReviewDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
