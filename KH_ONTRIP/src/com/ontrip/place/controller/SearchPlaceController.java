package com.ontrip.place.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.image.vo.Image;
import com.ontrip.place.model.service.PlaceService;
import com.ontrip.place.model.vo.Place;


//메인창에서 검색창에 시설검색시 searchPlace.jsp(시설들이 쫙 나오는 창)으로 넘어가는 controller
@WebServlet("/searchPlace.se")
public class SearchPlaceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public SearchPlaceController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String word = request.getParameter("word");
		// 검색한 시설 사진 불러오기
		ArrayList<Image> placePath = new PlaceService().searchPlacePath(word);
		request.setAttribute("placePath", placePath);
		
		// 검색한 시설 정보 불러오기
		ArrayList<Place> placeInfo = new PlaceService().searchPlaceInfo(word);
		request.setAttribute("placeInfo", placeInfo);
		
		request.getRequestDispatcher("views/location/searchPlace.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
