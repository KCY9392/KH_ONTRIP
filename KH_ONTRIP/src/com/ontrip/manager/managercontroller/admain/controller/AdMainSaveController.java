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

import com.ontrip.common.MyFileRenamePolicy;
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
		
		if(ServletFileUpload.isMultipartContent(request)) {
		
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
		
		
		
		//첨부사진
		
			
		
		// 1_1. 전송용량 제한
        int maxSize = 10 * 1024 * 1024; // 10mByte
        
        // 1_2. 저장할 폴더의 물리적인 경로
        
        String savePath = "";
        if(categoryCode.equals("PP")) {
        	savePath = request.getServletContext().getRealPath("/resources/play_Img/");
        }else if(categoryCode.equals("HH")){
        	savePath = request.getServletContext().getRealPath("/resources/food_Img/");
        }else {
        	savePath = request.getServletContext().getRealPath("/resources/hotel_Img/");
        }
        
        // 2. 전달된 파일명 수정 작업 후 서버에 업로드
        MultipartRequest multiRequest = new MultipartRequest(request,savePath, maxSize, "UTF-8");
        
        
        // Image에 여러번 insert할 데이터 뽑기
        // 단, 여러개의 첨부파일이 있을것이기때문에, Image객체들을 ArrayList에 담을 것임
        // => 적어도 1개 이상은 담길예정
        ArrayList<Image> list = new ArrayList<>();
        
        for(int i=1; i<=3; i++) { // file의 개수는 최대4개이고, 파일name을 file1,file2,file3,file4로 넘겼기때문에 i=1부터
            
            String key = "file"+i;
            
            if(multiRequest.getOriginalFileName(key) != null) {
                //첨부파일이 있는 경우
                // Attachment객체 생성 + 원본명, 수정명, 파일경로 넣기 + 파일level 담기
                // list에 추가하기
                Image img = new Image();
                img.setOriginName(multiRequest.getOriginalFileName(key));
                img.setFilePath(savePath);
                img.setFileLevel(i); // 시설대표이미지 1, 시설상세이미지 2 3
                
                list.add(img);
            }
        }
        
        int result1 = new PlaceService().insertPlaceImages(list);
        
		
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
		
		System.out.println(place);
		
		int result2 = new PlaceService().insertPlace(place);
		
		HttpSession session = request.getSession();
		
		if(result1>0 && result2>0) {//시설등록 성공
			session.setAttribute("alertMsg", "1");
			request.getRequestDispatcher("views/manager/ManagerPlace.jsp").forward(request, response);
			
		}else {//시설등록 실패
			session.setAttribute("alertMsg", "0");
		}
	  }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}