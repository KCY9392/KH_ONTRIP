package com.ontrip.manager.managercontroller.admain.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.hash.service.HashService;
import com.ontrip.hash.vo.Hash;
import com.ontrip.image.vo.Image;
import com.ontrip.manager.service.ManagerService;
import com.ontrip.place.model.vo.Place;

/**
 * Servlet implementation class AdMainDetailController
 */
@WebServlet("/placeDetail.mn")
public class AdMainDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdMainDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String placeName = request.getParameter("plcName");
		// 시설 상세조회를 하기위한 메소드
		Place place = new ManagerService().detailPlace(placeName);
		
		request.setAttribute("place", place);
		
		ArrayList<Image> placeImg = new ManagerService().detailPlaceImage(placeName);
		
		request.setAttribute("placeImg", placeImg);
		
		ArrayList<Hash> hash = new ManagerService().detailHash(placeName);
		request.setAttribute("hash", hash);
		System.out.println(hash);
		String value = "";
		if(hash != null) {
			for(int i = 0; i<hash.size(); i++) {
				System.out.println(hash.get(i).getHashName());
				value += hash.get(i).getHashName()+  ( i != hash.size()-1 ?  "," : "");
				
			}
		}
		System.out.println(value);
		request.setAttribute("value", value);
		
		String num = "";
		if(hash != null) {
			for(int i = 0; i<hash.size(); i++) {
				System.out.println(hash.get(i).getHashName());
				num += hash.get(i).getHashNo()+  ( i != hash.size()-1 ?  "," : "");
				
			}
		}
		
		System.out.println(num);
		request.setAttribute("num", num);
		
//		int[] a = new int[hash.size()];
//		if(hash != null) {
//			for(int i = 0; i<hash.size(); i++) {
//				a = hash.get(i).getHashNo();
//				
//			}
//		}
		
		
		
		request.getRequestDispatcher("views/manager/managerPlaceDetail.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
