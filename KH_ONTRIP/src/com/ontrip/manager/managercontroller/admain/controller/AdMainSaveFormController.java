package com.ontrip.manager.managercontroller.admain.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//시설게시판에서 작성하기버튼을 눌렀을 경우 호출되는 서블릿 -> 시설작성폼으로 이동
@WebServlet("/PlaceEnroll.mn")
public class AdMainSaveFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdMainSaveFormController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		request.getRequestDispatcher("views/manager/managerPlaceInsert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}