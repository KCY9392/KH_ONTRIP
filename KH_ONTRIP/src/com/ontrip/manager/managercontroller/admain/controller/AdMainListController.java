package com.ontrip.manager.managercontroller.admain.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//관리자 아이디,비번으로 로그인시 호출되는 서블릿 -> 메인관리인 시설리스트게시판으로 이동함
@WebServlet("/placeList.mn")
public class AdMainListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdMainListController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		request.getRequestDispatcher("views/manager/ManagerPlace.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

