package com.ontrip.manager.managercontroller.admain.controller;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ontrip.hash.service.HashService;
import com.ontrip.place.model.service.PlaceService;
import com.ontrip.place.model.vo.Place;


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
		
		
		Place place = new Place();
		
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
		
		int result = new PlaceService().insertPlace(place);
		
		//위에서 insert된(등록)된 시설의 시설코드 가져오기
		int placeCode = new PlaceService().selectplaceCode(place.getPlcName());
		place.setPlcCode(placeCode);
		
		 // 해시태그 생성
	      String hash = (String) request.getParameter("hidden_hash");
	      String[] split_hash;
	      if(hash != null) {
	         split_hash = hash.split(",");
//	         System.out.println(Arrays.toString(split_hash));
	         for(int i = 0; i<split_hash.length; i++) {
//	            System.out.println(split_hash[i]);
	            String value = split_hash[i];
	            int result1 = new HashService().insertHash(value, placeCode);
	         }
	      }
		
		if(result>0) {
			//시설정보등록 성공 alert창 띄울까용 말까용
			
			//시설등록은 성공 -> 다음 이미지 등록하기
			request.setAttribute("place", place);
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