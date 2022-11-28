package com.ontrip.place.controller;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.detailArea.service.DetailAreaService;
import com.ontrip.hash.service.HashService;
import com.ontrip.hash.vo.Hash;
import com.ontrip.heart.vo.Heart;
import com.ontrip.image.vo.Image;
import com.ontrip.place.model.service.PlaceService;
import com.ontrip.place.model.vo.Place;


// 상세지역창에서 숙소를 클릭 시, clickhotel.jsp로 넘어가는 controller
@WebServlet("/selectHotel.pe")
public class SelectHotelController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
   
    public SelectHotelController() {
        super();
    }

   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             request.setCharacterEncoding("UTF-8");
             
             String placeName = request.getParameter("placeName");
             String dareaName = request.getParameter("dareaName");
             
             Place place = new PlaceService().selectHotel(placeName);
             
             request.setAttribute("place", place);
             request.setAttribute("placeName", placeName);
             request.setAttribute("dareaName", dareaName);
             
             ArrayList<Hash> hashTag = new HashService().selectHashPlace(placeName);
     		
     		String value = "";
     		if(hashTag != null) {
     			for(int i = 0; i<hashTag.size(); i++) {
//     				System.out.println(hashTag.get(i).getHashName());
     				value += "#"+hashTag.get(i).getHashName()+  ( i != hashTag.size()-1 ?  "," : "");
     				
     			}
     		}
//     		System.out.println(value);
     		request.setAttribute("value", value);
             
             String dareaCode = new PlaceService().findDareaCode(dareaName);
             
             String placeCode = new PlaceService().findPlaceCode(placeName);
             request.setAttribute("placeCode", placeCode);
             
             // 시설사진
             ArrayList<Image> placeImages = new PlaceService().selectPlaceImages(placeName);
             request.setAttribute("placeImages", placeImages);
             
          //밑에 놀거리,숙소,맛집 버튼눌렀을 시, 나오는 사진과 정보
             // 놀거리 사진 불러오기
                ArrayList<Image> playPath = new DetailAreaService().selectPlayPath(dareaCode);
                request.setAttribute("playPath", playPath);
                
                
                //놀거리 정보(이름, 주소, 전화번호) 가져오기
                ArrayList<Place> playInfo = new PlaceService().selectPlayInfo(dareaCode);
                request.setAttribute("playInfo", playInfo);
                
                // 숙소 사진 불러오기
                ArrayList<Image> hotelPath = new DetailAreaService().selectHotelPath(dareaCode);
                request.setAttribute("hotelPath", hotelPath);

                // 숙소 정보(이름, 주소, 전화번호) 가져오기
                ArrayList<Place> hotelInfo = new PlaceService().selectHotelInfo(dareaCode);
                request.setAttribute("hotelInfo", hotelInfo);
                
                // 맛집 사진 불러오기
                ArrayList<Image> foodPath = new DetailAreaService().selectFoodPath(dareaCode);
                request.setAttribute("foodPath", foodPath);

                // 맛집 정보(이름, 주소, 전화번호) 가져오기
                ArrayList<Place> foodInfo = new PlaceService().selectFoodInfo(dareaCode);
                request.setAttribute("foodInfo", foodInfo);
             
                // 찜 정보 가져오기
                int memberCode = Integer.parseInt(request.getParameter("memberNo"));
                int placeCode2 = Integer.parseInt((String) request.getAttribute("placeCode"));
                Heart ht = new PlaceService().selectHeart(memberCode, placeCode2);
                
                request.setAttribute("ht", ht);
                
                
             request.getRequestDispatcher("views/location/clickHotel.jsp").forward(request, response);
          }

          protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             doGet(request, response);
          }

       }