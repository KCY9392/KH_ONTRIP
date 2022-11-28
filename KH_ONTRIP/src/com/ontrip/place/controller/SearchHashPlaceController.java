package com.ontrip.place.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.image.vo.Image;
import com.ontrip.place.model.service.PlaceService;
import com.ontrip.place.model.vo.Place;

/**
 * Servlet implementation class SearchHashPlaceController
 */
@WebServlet("/searchHashPlace.se")
public class SearchHashPlaceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchHashPlaceController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 해시태그 생성
		String hash = (String) request.getParameter("hidden_hash");
		String[] split_hash;
		if(hash != null) {
			split_hash = hash.split(",");
//			System.out.println(Arrays.toString(split_hash));
			
			// 검색한 시설 사진 해시태그로 불러오기
			ArrayList<Image> placeHashPath = new PlaceService().searchHashPlacePath(split_hash);
			request.setAttribute("placeHashPath", placeHashPath);
			
			// 검색한 시설 정보 해시태그로 불러오기
			ArrayList<Place> placeHashInfo = new PlaceService().searchHashPlaceInfo(split_hash);
			request.setAttribute("placeHashInfo", placeHashInfo);
		}
		request.getRequestDispatcher("views/location/searchHashPlace.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
