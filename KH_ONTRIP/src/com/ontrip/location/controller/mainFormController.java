package com.ontrip.location.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.ontrip.location.service.LocationService;
import com.ontrip.location.vo.Location;

@WebServlet("/mainForm.no")
public class mainFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public mainFormController() {
        super();
    }

   
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String localName = request.getParameter("localName");
		System.out.println(localName);
		String localText = new LocationService().selectLocal(localName);

		
		request.setAttribute("localText", localText);
		request.getRequestDispatcher("views/location/selectDArea.jsp").forward(request, response);
		System.out.println(localText);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
