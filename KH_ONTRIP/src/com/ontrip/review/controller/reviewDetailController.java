package com.ontrip.review.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.taglibs.standard.tag.compat.fmt.RequestEncodingTag;

import com.ontrip.image.vo.Image;
import com.ontrip.review.dao.ReviewDao;
import com.ontrip.review.service.ReviewService;
import com.ontrip.review.vo.Review;

/**
 * 후기게시판에서 후기하나를 클릭 시, 후기상세창으로 가는 서블릿
 */
@WebServlet("/detail.bo")
public class reviewDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public reviewDetailController() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int revCode = Integer.parseInt(request.getParameter("revCode"));
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		int placeCode = Integer.parseInt(request.getParameter("placeCode"));
		
		String placeName = request.getParameter("placeName");
//		System.out.println(placeName+"ㅇㅇㅇ");
		request.setAttribute("placeName", placeName);
		// PLACE_CODE에 해당하는 대표이미지를 가져오기 위한 LIST
		ArrayList<Image> selectMainImagelist = new ReviewService().selectMainImagelist(placeCode);
		request.setAttribute("selectMainImagelist", selectMainImagelist);
				
	    //revCode 가 후기게시판에서 하나클릭할때 넘어와야됨
		
		Review re = new ReviewService().selectReviewDetail(revCode);
		request.setAttribute("placeCode", placeCode);
//		System.out.println(placeCode);
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
