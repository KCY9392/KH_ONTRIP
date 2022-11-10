package com.ontrip.location.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.detailArea.service.DetailAreaService;
import com.ontrip.detailArea.vo.DetailArea;
import com.ontrip.location.service.LocationService;
import com.ontrip.location.vo.Location;

@WebServlet("/mainForm.no")
public class mainFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public mainFormController() {
        super();
    }

    LocationService ls = new LocationService();
    Location l = new Location();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String localName = request.getParameter("localName");
		
		l.setLocalName(localName);
		
		String localText = ls.selectlocalText(localName);
		
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
