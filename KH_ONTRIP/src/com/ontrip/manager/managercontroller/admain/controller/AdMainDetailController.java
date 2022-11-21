package com.ontrip.manager.managercontroller.admain.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.manager.service.ManagerService;
import com.ontrip.place.model.vo.Place;

/**
 * Servlet implementation class AdMainDetailController
 */
@WebServlet("/placeDetail.mn")
public class AdMainDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdMainDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String placeName = request.getParameter("plcName");
		// 시설 상세조회를 하기위한 메소드
		Place place = new ManagerService().detailPlace(placeName);
		
		request.setAttribute("place", place);
		
		request.getRequestDispatcher("views/manager/managerPlaceDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
