package com.ontrip.manager.managercontroller.admain.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.ontrip.image.vo.Image;
import com.oreilly.servlet.MultipartRequest;


//시설이미지 등록하기
@WebServlet("/PlaceInsert2.mn")
public class AdMainSaveImgController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public AdMainSaveImgController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String categoryCode = request.getParameter("categoryCode");
		int plcCode = Integer.parseInt(request.getParameter("placeCode"));
		String dareaCode = request.getParameter("dareaCode");
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			
			
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
	                img.setCategoryCode(categoryCode);
	                img.setPlcCode(plcCode);
	                img.setDareaCode(dareaCode);
	                
	                list.add(img);
	                System.out.println(list);
	            }
	        }
	        
//	        int result1 = new PlaceService().insertPlaceImages(list);
	
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
