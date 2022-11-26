package com.ontrip.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.image.vo.Image;
import com.ontrip.member.model.vo.Member;
import com.ontrip.review.service.ReviewService;

//후기게시판에서 작성하기 버튼을 누를경우, 호출되는 서블릿 -> 작성하는 폼으로
@WebServlet("/insertReview.re")
public class reviewEnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public reviewEnrollController() {
        super();
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String placeName = request.getParameter("placeName");
		request.setAttribute("placeName", placeName);
		
		int placeCode = Integer.parseInt(request.getParameter("placeCode"));
		request.setAttribute("placeCode", placeCode);
		
		int revCode = new ReviewService().selectReviewNo();
		request.setAttribute("revCode", revCode);
		System.out.println(revCode);
		
		System.out.println(placeName);
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		request.setAttribute("memberNo", memberNo);
		System.out.println(memberNo);
		
		Member memberName = new ReviewService().selectMemberName(memberNo);
		
		request.setAttribute("memberName", memberName);
		
		// PLACE_CODE에 해당하는 대표이미지를 가져오기 위한 LIST
		ArrayList<Image> selectMainImagelist = new ReviewService().selectMainImagelist(placeCode);
		request.setAttribute("selectMainImagelist", selectMainImagelist);
		
		request.getRequestDispatcher("views/review/reviewEnroll.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
