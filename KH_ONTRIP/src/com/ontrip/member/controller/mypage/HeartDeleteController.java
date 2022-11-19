package com.ontrip.member.controller.mypage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.heart.service.HeartService;

/**
 * Servlet implementation class HeartDeleteController
 */
@WebServlet("/deleteHeart.me")
public class HeartDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HeartDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		int placeCode = Integer.parseInt(request.getParameter("placeCode"));
//		System.out.println(placeCode);
		
		String[] placeName = request.getParameterValues("placeName");
		
		for(int i=0;i<placeName.length;i++) {
			System.out.println(placeName[i]);
		}
		
		String memberNo = request.getParameter("memberNo");
		
		int result = new HeartService().deleteHeartList(placeName);
		
		if(result > 0) {
	        request.getSession().setAttribute("alertMsg", "성공적으로 게시글을 삭제했습니다.");
	        response.sendRedirect(request.getContextPath()+"/mypageHeartList.me?memberNo="+memberNo);
	    }else {
	        request.setAttribute("errorMsg", "게시글 삭제 실패");
	        request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
