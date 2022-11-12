package com.ontrip.detailArea.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.detailArea.service.DetailAreaService;
import com.ontrip.image.vo.Image;
import com.ontrip.location.service.LocationService;

@WebServlet("/selectPlace.no")
public class selectPlaceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public selectPlaceController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String dareaCode = request.getParameter("dareaCode");
		System.out.println(dareaCode);
		
		// 상세지역 이름 가져오기
		String dareaName = new DetailAreaService().dAreaName(dareaCode);
		
		request.setAttribute("dareaName", dareaName);
		
		// 상세지역 사진 가져오기
		ArrayList<Image> filePath = new DetailAreaService().selectFilePath(dareaCode);
		request.setAttribute("filePath", filePath);
		
		request.getRequestDispatcher("views/location/selectPlace.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
