package com.ontrip.heart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.heart.service.HeartService;

/**
 * 찜 취소시, 호출되는 컨트롤러
 */
@WebServlet("/deleteHeart.ht")
public class DeleteHeartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteHeartController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memNo = Integer.parseInt(request.getParameter("memNo"));
		int plcCode = Integer.parseInt(request.getParameter("plcCode"));
//		System.out.println(memNo);
//		System.out.println(plcCode);
//		System.out.println("찜해제");
		
		int result = new HeartService().deleteHeart(memNo, plcCode);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
