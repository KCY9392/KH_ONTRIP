package com.ontrip.manager.managercontroller.admain.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.manager.service.ManagerService;

/**
 * Servlet implementation class AdMainDeleteController
 */
@WebServlet("/placeDelete.mn")
public class AdMainDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdMainDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String placeName = request.getParameter("placeName");
	    System.out.println(placeName);
		// 시설 삭제 메소드
	    int result1 = new ManagerService().deletePlace(placeName);
	    // 시설 이미지 삭제 메소드
	    int result2 = new ManagerService().deletePlaceImg(placeName);
	    
	    if(result1 > 0 && result2>0) {
	    	
	    	request.getRequestDispatcher("/placeList.mn?categoryCode=PP").forward(request, response);
	    } else {
	    	request.setAttribute("errorMsg", "시설 삭제 실패");
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
