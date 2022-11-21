package com.ontrip.manager.managercontroller.admain.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.common.model.vo.PageInfo;
import com.ontrip.manager.service.ManagerService;
import com.ontrip.manager.vo.Page;
import com.ontrip.place.model.vo.Place;
import com.ontrip.review.vo.ReviewBoard;

//관리자 아이디,비번으로 로그인시 호출되는 서블릿 -> 메인관리인 시설리스트게시판으로 이동함
@WebServlet("/placeList.mn")
public class AdMainListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdMainListController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int amount = 5; // 한페이지에 보이는 목록 수
        int pageNum = 1; // 페이지 넘버

        String categoryCode = request.getParameter("categoryCode");

        System.out.println("plc.categoryCode = " + categoryCode);
        System.out.println("amount = " + amount);
        System.out.println("pageNum = " + pageNum);

        if (request.getParameter("pageNum") != null && request.getParameter("amount") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
            amount = Integer.parseInt(request.getParameter("amount"));
        }
        
        // 총 시설목록 수를 구하는 메소드
        int total = new ManagerService().getTotal();
        // 페이지바를 위한 객체
        Page page = new Page(pageNum, amount, total);
        // 시설 목록을 나타내기 위한 메소드
        ArrayList<Place> placeList = new ManagerService().getList(categoryCode, pageNum, amount);

        System.out.println("placeList = " + placeList);

        request.setAttribute("page", page);
        request.setAttribute("placeList", placeList);
        request.setAttribute("categoryCode", categoryCode);


        request.getRequestDispatcher("views/manager/ManagerPlace.jsp").forward(request, response);
	    

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}

