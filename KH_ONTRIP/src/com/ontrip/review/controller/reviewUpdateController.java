package com.ontrip.review.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.review.service.ReviewService;
import com.ontrip.review.vo.Review;
import com.ontrip.score.vo.Score;

// 리뷰 업데이트 서블릿
@WebServlet("/reviewUpdate.re")
public class reviewUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public reviewUpdateController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 리뷰 수정을 하기 위한 별점 , 청결상태 , 직원 & 서비스 , 편의 시설 서비스 점수들
		double updateStar = Double.parseDouble(request.getParameter("updateStar"));
//		System.out.println(updateStar);
		double cScore = Double.parseDouble(request.getParameter("cScore"));
//		System.out.println(cScore);
		double sScore = Double.parseDouble(request.getParameter("sScore"));
//		System.out.println(sScore);
		double pScore = Double.parseDouble(request.getParameter("pScore"));
//		System.out.println(pScore);
		int revCode = Integer.parseInt(request.getParameter("revCode"));
//		System.out.println(revCode);
		String rtext = request.getParameter("rText");
//		System.out.println(rtext);
		
		// REV_CODE에 해당하는 개선사항을 변경하기 위해 생성한 객체
		Review rUpdate = new Review(rtext , revCode);
//		System.out.println(revCode);
		
		// REV_CODE에 해당하는 별점 , 청결상태 , 직원 & 서비스 , 편의 시설 서비스 변경하기 위해 생성한 객체
		Score sUpdate = new Score(updateStar , cScore , sScore , pScore , revCode);
//		System.out.println(revCode);
		
		int result = new ReviewService().updateReview(rUpdate , sUpdate);
//		System.out.println(result+"오냐");
		
		if(result > 0) {
//			System.out.println(result+"오냐1");
			request.getSession().setAttribute("alertMsg", "수정이 완료되었습니다.");	
//			System.out.println(result+"오냐2");
			response.getWriter().print("success");
		}else {
			response.getWriter().print("fail");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
