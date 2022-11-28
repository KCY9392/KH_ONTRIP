package com.ontrip.manager.managercontroller.admain.controller;


import com.ontrip.common.MyFileRenamePolicy;
import com.ontrip.image.vo.Image;
import com.ontrip.place.model.service.PlaceService;
import com.oreilly.servlet.MultipartRequest;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


//시설이미지 등록하기
@WebServlet("/PlaceInsert2.mn")
public class AdMainSaveImgController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public AdMainSaveImgController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String categoryCode = request.getParameter("categoryCode");
		int plcCode = Integer.parseInt(request.getParameter("placeCode"));
		String dareaCode = request.getParameter("dareaCode");
		String localCode = request.getParameter("localCode");
		
//		System.out.println(categoryCode);
//		System.out.println(plcCode);
//		System.out.println(dareaCode);
//		System.out.println(localCode);
		
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			// 1_1. 전송용량 제한
	        int maxSize = 10 * 1024 * 1024; // 10mByte
	        
	        // 1_2. 저장할 폴더의 물리적인 경로
	        
	        String savePath = "";
	        String filePath = "";
	        if(categoryCode.equals("PP")) {
	        	savePath = request.getServletContext().getRealPath("/resources/play_Img/");
	        	filePath = "/resources/play_Img/";
	        }else if(categoryCode.equals("HH")){
	        	savePath = request.getServletContext().getRealPath("/resources/hotel_Img/");
	        	filePath = "/resources/hotel_Img/";
	        }else {
	        	savePath = request.getServletContext().getRealPath("/resources/food_Img/");
	        	filePath = "/resources/food_Img/";
	        }
	        
	        // 2. 전달된 파일명 수정 작업 후 서버에 업로드
	        MultipartRequest multiRequest = new MultipartRequest(request,savePath, maxSize, "UTF-8", new MyFileRenamePolicy() );
	        
	        
	        // Image에 여러번 insert할 데이터 뽑기
	        // 단, 여러개의 첨부파일이 있을것이기때문에, Image객체들을 ArrayList에 담을 것임
	        // => 적어도 1개 이상은 담길예정
	        ArrayList<Image> list = new ArrayList<>();
	        
	        for(int i=1; i<=3; i++) { // file의 개수는 최대4개이고, 파일name을 file1,file2,file3,file4로 넘겼기때문에 i=1부터
	            
	            String key = "file"+i;
	            
	            if(multiRequest.getOriginalFileName(key) != null) {
//	                첨부파일이 있는 경우
//	                 Attachment객체 생성 + 원본명, 수정명, 파일경로 넣기 + 파일level 담기
	                // list에 추가하기
	            	
//	            	INSERT INTO "Image"
//	            	   (FILE_NO, 
//	            	   PLC_CODE, 
//	            	   ORIGIN_NAME, 
//	            	   FILE_PATH, 
//	            	   DAREA_CODE, 
//	            	   STATUS, 
//	            	   LOCAL_CODE, 
//	            	   CATEGORY_CODE,
//	            	   CHANGE_NAME)
//	            	   VALUES(SEQ_FILE.NEXTVAL, ?, ?, ?, ?, 'Y', ?, ?, ?)
	            	
	            	
	                Image img = new Image();
	                img.setPlcCode(plcCode);
	                img.setOriginName(multiRequest.getOriginalFileName(key));
	                img.setFilePath(filePath);
	                img.setDareaCode(dareaCode);
	                img.setLocalCode(localCode);
	                img.setCategoryCode(categoryCode);
	                img.setChangeName(multiRequest.getFilesystemName(key));
	                
	                list.add(img);
//	                System.out.println(list);
	            }
	        }
	        
	        int result1 = new PlaceService().insertPlaceImages(list);
	
	        if(result1 > 0) {//성공 => list.bo?currentPage=1
		        
	            request.getSession().setAttribute("alertMsg", "시설 등록 성공!");
	            response.sendRedirect(request.getContextPath()+"/placeList.mn?currentPage=1&categoryCode=PP");
	        
	        }else {//실패 
	            
	            request.setAttribute("errorMsg", "이미지 등록 실패");
	            // 이미지 등록 실패시, 이미지 등록 페이지로 다시 이동
	            request.getRequestDispatcher("views/manager/managerplaceInsertImg.jsp").forward(request, response);
	            
	            
	        }
	        
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
