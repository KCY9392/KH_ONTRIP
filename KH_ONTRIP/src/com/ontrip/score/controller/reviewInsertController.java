package com.ontrip.score.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.common.model.vo.PageInfo;
import com.ontrip.review.service.ReviewService;
import com.ontrip.review.vo.Review;
import com.ontrip.score.service.ScoreService;
import com.ontrip.score.vo.Score;

//후기 등록후, 등록하기 버튼 누를경우, insert처리하는 서블릿 -> insert된 후기게시판으로 감
@WebServlet("/updateScore.se")
public class reviewInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public reviewInsertController() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String placeName = request.getParameter("placeName");
		String reviewText = request.getParameter("reviewText");
		int placeCode = Integer.parseInt(request.getParameter("placeCode"));
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
//		System.out.println(memberNo);
		
		int sScore = Integer.parseInt(request.getParameter("rating"));
		int cScore = Integer.parseInt(request.getParameter("cScore"));
		int gScore = Integer.parseInt(request.getParameter("gScore"));
		int pScore = Integer.parseInt(request.getParameter("pScore"));
		
		request.setAttribute("sScore" , sScore);
		request.setAttribute("cScore" , cScore); 
		request.setAttribute("gScore" , gScore);
		request.setAttribute("pScore" , pScore);
		
		String memberId2 = request.getParameter("memberId");
		
//		System.out.println(placeName);
//		System.out.println(reviewText);
		
//		System.out.println(sScore+"통과");
//		System.out.println(cScore+"통과");
//		System.out.println(gScore+"통과");
//		System.out.println(pScore+"통과");		
				
	    int revCode = Integer.parseInt(request.getParameter("revCode"));
//	    System.out.println(revCode);
		
	// 리뷰작성
		Review r = new Review();
		r.setRevCode(revCode);
		r.setPlcCode(placeCode);
		r.setMemberNo(memberNo);
		r.setRevText(reviewText);
		
		
	// score 작성
		Score s = new Score(sScore , cScore , gScore , pScore , memberId2);
		s.setReviewCode(revCode);
			
		int result1 = new ReviewService().insertReview(r , s);
		
//		int result2 = new ReviewService().insertScore(s);
		
		// 마이페이지 등록 후기로 가져가야할 정보들.
		request.setAttribute("placeName", placeName);
		request.setAttribute("placeCode", placeCode);
		request.setAttribute("memberNo", memberNo);
		request.setAttribute("revCode", revCode);
		
				
		if (result1 > 0){
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().print("<script> location.href = '/KH_ONTRIP/review.re?placeName="+placeName+"&memberNo="+memberNo+"&placeCode="+placeCode+"'</script>");

		}else {
			request.setAttribute("errorMsg", "등록에 실패하였습니다.");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
