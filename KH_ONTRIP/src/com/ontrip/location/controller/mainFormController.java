package com.ontrip.location.controller;

import com.ontrip.detailArea.vo.DetailArea;
import com.ontrip.image.vo.Image;
import com.ontrip.location.service.LocationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class mainFormController
 */
@WebServlet("/mainForm.no")
public class mainFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public mainFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		// LOCAL_NAME으로 LOCATION테이블에서 LOCAL_TEXT가져오기
		String localName = request.getParameter("localName");
		System.out.println(localName);
		String localText = new LocationService().selectLocal(localName);


		request.setAttribute("localText", localText);


		// LOCAL_CODE로  DETAILED AREA테이블에서 DAREA_NAME (상세지역이름들) 가져오기
		String localCode = request.getParameter("localCode");
		System.out.println(localCode);
		ArrayList<DetailArea> darea = new LocationService().selectDAreaName(localCode);
		ArrayList<Image> filePath = new LocationService().selectFilePath(localCode);
		System.out.println(filePath);
		System.out.println(darea);
		request.setAttribute("darea", darea);
		request.setAttribute("filePath", filePath);


		request.getRequestDispatcher("views/location/selectDArea.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
