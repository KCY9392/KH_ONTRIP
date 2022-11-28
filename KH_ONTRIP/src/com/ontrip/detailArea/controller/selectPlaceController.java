package com.ontrip.detailArea.controller;

import com.ontrip.detailArea.service.DetailAreaService;
import com.ontrip.hash.service.HashService;
import com.ontrip.hash.vo.Hash;
import com.ontrip.image.vo.Image;
import com.ontrip.place.model.service.PlaceService;
import com.ontrip.place.model.vo.Place;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


/**
 * 상세지역선택창(강남,종로,용산 클릭하는 창)에서 한 상세지역(DetailArea)를 클릭시, 
 * 놀거리,숙소,맛집 클릭하는 창으로 넘어가기위한 컨트롤러
 */
@WebServlet("/selectPlace.no")
public class selectPlaceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public selectPlaceController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String dareaCode = request.getParameter("dareaCode");
//		System.out.println(dareaCode);
		
		// 상세지역 이름 가져오기
		String dareaName = new DetailAreaService().dAreaName(dareaCode);
		
		request.setAttribute("dareaName", dareaName);
		
		// 상세지역 사진 가져오기
		ArrayList<Image> filePath = new DetailAreaService().selectFilePath(dareaCode);
		request.setAttribute("filePath", filePath);
		
		// 놀거리 사진 불러오기
		ArrayList<Image> playPath = new DetailAreaService().selectPlayPath(dareaCode);
		request.setAttribute("playPath", playPath);
		
		
		//놀거리 정보(이름, 주소, 전화번호) 가져오기
		ArrayList<Place> playInfo = new PlaceService().selectPlayInfo(dareaCode);
		request.setAttribute("playInfo", playInfo);
		
		
		// 맛집 사진 불러오기
		ArrayList<Image> foodPath = new DetailAreaService().selectFoodPath(dareaCode);
		request.setAttribute("foodPath", foodPath);

		// 숙소 정보(이름, 주소, 전화번호) 가져오기
		ArrayList<Place> foodInfo = new PlaceService().selectFoodInfo(dareaCode);
		request.setAttribute("foodInfo", foodInfo);
		
//		for(int i=0; i<playInfo.size(); i++) {
//			System.out.println(foodInfo.get(i).getPlcName());
//		}
		
		// 숙소 사진 불러오기
		ArrayList<Image> hotelPath = new DetailAreaService().selectHotelPath(dareaCode);
		request.setAttribute("hotelPath", hotelPath);

		// 숙소 정보(이름, 주소, 전화번호) 가져오기
		ArrayList<Place> hotelInfo = new PlaceService().selectHotelInfo(dareaCode);
		request.setAttribute("hotelInfo", hotelInfo);
		
//		for(int i=0; i<playInfo.size(); i++) {
//			System.out.println(foodInfo.get(i).getPlcName());
//		}
		
		request.getRequestDispatcher("views/location/selectPlace.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
