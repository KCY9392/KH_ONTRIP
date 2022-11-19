package com.ontrip.manager.managercontroller.admain.controller;


import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.ontrip.image.vo.Image;
import com.ontrip.place.model.service.PlaceService;
import com.ontrip.place.model.vo.Place;
import com.oreilly.servlet.MultipartRequest;


//시설 등록폼 작성후, 등록하기 버튼을 눌렀을 경우 호출되는 서블릿 -> 시설리스트게시판
@WebServlet("/PlaceInsert.mn")
public class AdMainSaveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AdMainSaveController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		request.setCharacterEncoding("UTF-8");
		
		//카테고리코드(놀거리, 숙소, 맛집)
		String categoryCode = request.getParameter("category");
		
		//시설이름
		String placeName = request.getParameter("placeName");
		
		//대표지역코드
		String localCode = request.getParameter("addressKind");
		
		//상세지역이름
		String dAreaName = request.getParameter("addressDetailKind");
		
		//상세지역코드
		String dareaCode = new PlaceService().selectDAreaCode(dAreaName);
		
		//시설대표자이름
		String plcBname = request.getParameter("placeBName");
		
		//시설주소
		String plcAddress = request.getParameter("areaAddress");
		
		//시설전화번호
		String plcPnumber = request.getParameter("telephone");
		
		//시설위도
		float plcLa = Float.parseFloat(request.getParameter("latitude"));
		
		//시설경도
		float plcLo = Float.parseFloat(request.getParameter("longitude"));
		
		//시설설명텍스트
		String plcText = request.getParameter("content");
		
		//시설코드
		int plcCode = Integer.parseInt(request.getParameter("placeCode"));
		
		Place place = new Place();
		
		place.setPlcCode(plcCode);
		place.setCategoryCode(categoryCode);
		place.setLocalCode(localCode);
		place.setDareaCode(dareaCode);
		place.setPlcName(placeName);
		place.setPlcAddress(plcAddress);
		place.setPlcText(plcText);
		place.setPlcBname(plcBname);
		place.setPlcPnumber(plcPnumber);
		place.setPlcLa(plcLa);
		place.setPlcLo(plcLo);
		
		System.out.println(place);
		
		int result = new PlaceService().insertPlace(place);
		
		if(result>0) {
			//시설등록은 성공 -> 다음 이미지 등록하기
			request.setAttribute("categoryCode", categoryCode);
			request.setAttribute("placeCode", plcCode);
			request.setAttribute("dareaCode", dareaCode);
			request.getRequestDispatcher("views/manager/managerplaceInsertImg.jsp").forward(request, response);

		}else {
		//시설등록 실패 -> 다시 페이지 초기화시키면서 재로딩
		response.sendRedirect("views/manager/managerplaceInsert.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}