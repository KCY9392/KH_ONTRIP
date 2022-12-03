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
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			//전송용량 제한
	        int maxSize = 10 * 1024 * 1024; // 10mByte
	        
	        //저장할 폴더의 물리적인 경로
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
	        
	        //전달된 파일명 수정 작업 후 서버에 업로드
	        MultipartRequest multiRequest = new MultipartRequest(request,savePath, maxSize, "UTF-8", new MyFileRenamePolicy() );
	        
	        
	        // Image에 여러번 insert할 데이터 뽑기
	        ArrayList<Image> list = new ArrayList<>();
	        
	        for(int i=1; i<=3; i++) { 
	        	// 이미지 3개, 파일 name을 file1,file2,file3로 넘겼기때문에 i=1부터 i=3까지
	            
	            String key = "file"+i;
	            
	            if(multiRequest.getOriginalFileName(key) != null) {
	            	
	                Image img = new Image();
	                img.setPlcCode(plcCode);
	                img.setOriginName(multiRequest.getOriginalFileName(key));
	                img.setFilePath(filePath);
	                img.setDareaCode(dareaCode);
	                img.setLocalCode(localCode);
	                img.setCategoryCode(categoryCode);
	                img.setChangeName(multiRequest.getFilesystemName(key));
	                
	                list.add(img);
	            }
	        }
	        
	        int result = new PlaceService().insertPlaceImages(list);
	
	        if(result > 0) { //성공 => list.bo?currentPage=1
	        	response.setContentType("text/html;charset=UTF-8");
	            response.getWriter().print("<script>alert('시설 등록 완료'); location.href = '/KH_ONTRIP/placeList.mn?currentPage=1&categoryCode=PP'</script>");
	            
	        
	        }else {//실패 
	        	
	        	response.setContentType("text/html;charset=UTF-8");
	            response.getWriter().print("<script>alert('이미지 등록 실패'); location.href = '/KH_ONTRIP/PlaceEnroll.mn'</script>");
	            
	        }
	        
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
