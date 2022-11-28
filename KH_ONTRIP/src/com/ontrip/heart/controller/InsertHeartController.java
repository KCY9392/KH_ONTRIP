package com.ontrip.heart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ontrip.heart.service.HeartService;

/**
 * 찜할경우(빈 하트를 누를경우), 호출되는 컨트롤러
 */
@WebServlet("/insertHeart.ht")
public class InsertHeartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertHeartController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int plcCode = Integer.parseInt(request.getParameter("plcCode"));
//		System.out.println(memNo);
//		System.out.println(plcCode);
//		System.out.println("찜");
		
		int result = new HeartService().insertHeart(memNo, plcCode);
		
		if(result > 0) {
			HttpSession session = request.getSession();
			
			
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("errorMsg", "찜하기 실패");
			
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
