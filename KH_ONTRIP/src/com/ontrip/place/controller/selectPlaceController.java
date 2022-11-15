package com.ontrip.place.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.place.model.service.PlaceService;
import com.ontrip.place.model.vo.Place;


@WebServlet("/selectPlace.pe")
public class selectPlaceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public selectPlaceController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String placeName = request.getParameter("placeName");
		
		ArrayList<Place> place = new PlaceService().selectPlace(placeName);
		
		
		request.getRequestDispatcher("views/location/clickHotel.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
