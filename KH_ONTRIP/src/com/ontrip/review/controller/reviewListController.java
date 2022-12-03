package com.ontrip.review.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.common.model.vo.PageInfo;
import com.ontrip.image.vo.Image;
import com.ontrip.review.service.ReviewService;
import com.ontrip.review.vo.Review;
import com.ontrip.score.service.ScoreService;
import com.ontrip.score.vo.Score;

//clickHotel에서 이용후기보러가기 클릭 시, 호출되는 서블릿 -> 후기게시판
@WebServlet("/review.re")
public class reviewListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public reviewListController() {
        super();
   
    }

    ReviewService rs = new ReviewService();
    ScoreService ss = new ScoreService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// PLACE_CODE에 해당하는 PLACE_NAME을 뽑아낸후 해당하는 MEM_NO가 작성한 리뷰들을 LIST에 담아서 FOR문 돌리기 위한 코드
		String placeName = request.getParameter("placeName");
		String placeName2 = (String)request.getAttribute("placeName");
		request.setAttribute("placeName", placeName);
		request.setAttribute("placeName2", placeName2);
		
		
		int placeCode = Integer.parseInt(request.getParameter("placeCode"));
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));

		// 뽑아낸 정보들을 LIST에 담기
		ArrayList<Review> reList = rs.selectReviewList(placeName);
		
		// JSP에서 사용하기 위해 Attribute에 담기
		request.setAttribute("reList", reList); 
		
		// PLACE_CODE로 해당하는 LIST 가져오기 
		request.setAttribute("placeCode", placeCode);
		
		// 별점 , 쳥결도 , 	직원 & 서비스 , 편의시설 서비스 평점 가져오기 위한 LIST
		ArrayList<Score> slist = ss.selectSocreList(placeCode);
		
		// LIST에 담긴 평점들을 Attribute에 담기
		request.setAttribute("slist", slist);
		
		// 해당하는 시설의 점수들을 합산한 전체 평균점수를 계산하기 위한 코드
		double avgScore = (((slist.get(0).getReviewStar()*2) + slist.get(0).getReview_c() + slist.get(0).getReview_s() +slist.get(0).getReview_p()) / 4);
		
		// 계산된 점수를 Attribute에 담기
		request.setAttribute("avgScore", avgScore);
		
		// PLACE_CODE에 해당하는 대표이미지를 가져오기 위한 LIST
		ArrayList<Image> selectMainImagelist = rs.selectMainImagelist(placeCode);
		
		// 가져온 대표 이미지가 담긴 LIST를 Attribute에 담기
		request.setAttribute("selectMainImagelist", selectMainImagelist);
		
		int selectHeartCount = rs.selectHeartCount(placeCode);
		request.setAttribute("selectHeartCount", selectHeartCount);
		
		
		
		// 시설을 예약한 회원인지 확인
		int rsYes = rs.isReservationMem(memberNo, placeCode);
		request.setAttribute("rsYes", rsYes);
		
	
		
		// ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 페이징 처리 시작 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		
		
		
	    int listCount; // 현재 총 게시글 갯수
	    int currentPage; // 현재 페이지(즉 , 사용자가 요청한 페이지)
	    int pageLimit; // 페이지 하단에 보여질 페이징바의 페이지 최대갯수
	    int boardLimit; // 페이지에 보여질 게시글의 최대갯수
	    
	    int maxPage; // 가장 마지막 페이지가 몇번째 페이지인지(총 페이지 수)
	    int startPage; // 페이지 하단에 보여질 페이징바의 시작수
	    int endPage; // 페이지 하단에 보여질 페이징바의 끝수
	    
	    // * listCount : 총 게시글 갯수
	    listCount = rs.selectListCount(); 
	    
	    // * currentPage : 현재페이지
	    currentPage = Integer.parseInt(request.getParameter("currentPage") == null ? "1" : request.getParameter("currentPage"));
	    
	    // * pageLimit : 페이지 하단에 보여질 페이징바의 페이지 최대갯수(페이지목록들 몇개 단위씩)
	    pageLimit = 5;
	    
	    // * boardLimit : 한 페이지에 보여질 게시글의 최대갯수(게시글 몇개 단위씩)
	    boardLimit = 5;
	    
	    // * maxPage : 가장 마지막 페이지가 몇번 페이지인지(총 페이지수)
	    /*
	     * listCount, boardLimit에 영향을 받음.
	     * 
	     * - 공식 구하기
	     *   단, boardLimt값이 10이라는 가정하에 규칙을 구하기.
	     *   
	     *   총 갯수                boardLimit                 maxPage
	     *   100.0개         /         10개 => 10                  10번 페이지
	     *   101.0개         /         10개 => 10.1                11번 페이지
	     *   109.0개         /         10개 => 10.9                11번 페이지
	     *   110.0개         /         10개 => 11                  11번 페이지
	     *   111.0개         /         10개 => 11.1                12번 페이지
	     *   => 나눗셈 결과를 올림처리하면 maxPage의 값이 나온다.
	     *   1) listCount를 double로 형변환
	     *   2) listCount / boardLimit
	     *   3) 결과에 올림처리 Math.ceil() 메소드 호출
	     *   4) 결과값을 int로 형변환
	     */
	    
	    maxPage = (int) Math.ceil((double)listCount / boardLimit);
	    
	    // * startPage : 페이지 하단에 보여질 페이징바의 시작수
	    /*
	     * pageLimit , currentPage 에 영향을 받음.
	     * 
	     * - 공식 구하기
	     * 단 , pageLimit 10이라는 가정하에 규칙을 세워보기.
	     * 
	     * startPage : 1 , 11 , 21 , 31 ... => n*10 + 1 => 10의 배수 + 1
	     * 
	     * 만약에 pageLimit 5라면? 1 , 6 , 11 , 16 , 21 ... => 5의배수 + 1
	     * 
	     * 즉 , n * pageLimit + 1
	     * 
	     * currentPage                    startPage
	     *     1                              1            => (n*10 + 1 = 1) => n=0
	     *     5                              1            => n = 0 
	     *    10                              1            => n = 0  
	     *    
	     *    11                              11           => n * 10 + 1 = 11 => n = 1  
	     *    15                              11           => n = 1
	     *    20                              11           => n = 1
	     *    
	     * => 1~10  : n = 0
	     * => 11~20 : n = 1
	     * => 21~30 : n = 2
	     *            n = (currentPage -1) / pageLimit  
	     *                0 ~ 9 / 10 = 0
	     *                10~19 / 10 = 1
	     *                20~29 / 10 = 2
	     *                
	     * startPage = n * pageLimit + 1 
	     *           => (currentPage - 1) / pageLimit * pageLimit + 1                                  
	     */
	    startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
	    
	    // * endPage : 페이지 하단에 보여질 페이징바의 끝수 
	    /*
	     * startPage , pageLimit에 영향을 받음 + (maxPage에도 영향을 받음)
	     * 
	     * - 공식 구하기
	     *   단 , pageLimit값이 10이라는 가정하에 규칙을 구해볼것.
	     *   
	     *   startPage : 1 => endPage : 10
	     *   startPage : 11 => endPage : 20
	     *   startPage : 21 => endPage : 30
	     *   
	     *   endPage = startPage + pageLimit -1;
	     *  
	     */
	    endPage = startPage + pageLimit -1;
	    
	    // startPage가 11이여서 endPage는 20으로 설정됨(근데 maxPage는 11까지만 존재함.)
	    // 12부터 20페이지까지는 비어있는 목록만 보여주게 될것이므로 endPage를 maxPage로 덮어씌우기함.
	    if(endPage > maxPage) {
	        endPage = maxPage;
	    }
	    
	    // 페이지 정보들을 하나의 공간에 담아서 보내기.
	    // 페이지 정보를 담은 vo클래스를 활용.
	    // => 사진게시판 , 공지사항게시판에서도 사용할수 있기때문에 common
	    
	    // 1. 페이징바만들때 필요한 객체.
	    PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
	    
	    // 2. 현재 사용자가 요청한 페이지에 보여줄 페이징바객체 전달
	    // request.setAttribute("pi", pi);
	    
	 // ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 페이징 처리 종료 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	    
	    // 현재 일반게시판의 게시글들 가져오기	    
	    ArrayList<Review> plist = rs.selectPagingList(pi , placeCode);

	    
	    request.setAttribute("plist", plist);
	    request.setAttribute("pi", pi);
		
		request.getRequestDispatcher("views/review/reviewList.jsp").forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
