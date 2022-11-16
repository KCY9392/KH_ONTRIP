package com.ontrip.place.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.detailArea.service.DetailAreaService;
import com.ontrip.image.vo.Image;
import com.ontrip.place.model.service.PlaceService;
import com.ontrip.place.model.vo.Place;


@WebServlet("/selectPlay.pe")
public class SelectPlayController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SelectPlayController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String placeName = request.getParameter("placeName");
		String dareaName = request.getParameter("dareaName");
		
		Place place = new PlaceService().selectHotel(placeName);
		
		request.setAttribute("place", place);
		request.setAttribute("placeName", placeName);
		request.setAttribute("dareaName", dareaName);
		
		String dareaCode = new PlaceService().findDareaCode(dareaName);
		
		// 놀거리 사진 불러오기
	      ArrayList<Image> playPath = new DetailAreaService().selectPlayPath(dareaCode);
	      request.setAttribute("playPath", playPath);
	      
	      
	      //놀거리 정보(이름, 주소, 전화번호) 가져오기
	      ArrayList<Place> playInfo = new PlaceService().selectPlayInfo(dareaCode);
	      request.setAttribute("playInfo", playInfo);
	      
	      // 숙소 사진 불러오기
	      ArrayList<Image> hotelPath = new DetailAreaService().selectHotelPath(dareaCode);
	      request.setAttribute("hotelPath", hotelPath);

	      // 놀거리 정보(이름, 주소, 전화번호) 가져오기
	      ArrayList<Place> hotelInfo = new PlaceService().selectHotelInfo(dareaCode);
	      request.setAttribute("hotelInfo", hotelInfo);
		
		
		request.getRequestDispatcher("views/location/clickPlay.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
