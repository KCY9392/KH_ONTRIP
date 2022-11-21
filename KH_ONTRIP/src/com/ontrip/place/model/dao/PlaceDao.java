package com.ontrip.place.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.ontrip.heart.vo.Heart;
import com.ontrip.image.vo.Image;
import com.ontrip.place.model.vo.Place;
import static com.ontrip.common.JDBCTemplate.*;

public class PlaceDao {
   
   private Properties prop = new Properties();
   
   public PlaceDao() {
      
      String fileName = PlaceDao.class.getResource("/sql/place/place-mapper.xml").getPath();
      
      try {
         prop.loadFromXML(new FileInputStream(fileName));
      } catch (IOException e) {
         e.printStackTrace();
      }
   }
   
//상세지역창
   
   
 //상세지역창에 놀거리 info 띄우기
   public ArrayList<Place> selectPlayInfo(String dareaCode, Connection conn){
      
      ArrayList<Place> playInfo = new ArrayList<Place>();
      
      PreparedStatement psmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectPlayInfo");
      
      try {
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, dareaCode);
         
         rset = psmt.executeQuery();
         
         while(rset.next()) {
            playInfo.add(new Place(
                      rset.getString("PLC_NAME"),
                      rset.getString("PLC_ADDRESS"),
                      rset.getString("PLC_PNUMBER")));
         }
         System.out.println(playInfo);
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(psmt);
      }
      
      return playInfo;
   }
   
   //상세지역창에 맛집 info 띄우기
   public ArrayList<Place> selectFoodInfo(String dareaCode, Connection conn){
      ArrayList<Place> foodInfo = new ArrayList<Place>();
      PreparedStatement psmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectFoodInfo");
      
      try {
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, dareaCode);
         
         rset = psmt.executeQuery();
         
         while(rset.next()) {
            foodInfo.add(new Place(
                  rset.getString("PLC_NAME"),
                  rset.getString("PLC_ADDRESS"),
                  rset.getString("PLC_PNUMBER")));
         }
         System.out.println(foodInfo);
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(psmt);
      }
      
      return foodInfo;
   }
   
   //상세지역창에 숙소 info 띄우기
   public ArrayList<Place> selectHotelInfo(String dareaCode, Connection conn){
      ArrayList<Place> hotelInfo = new ArrayList<Place>();
      
      PreparedStatement psmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectHotelInfo");
      
      try {
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, dareaCode);
         
         rset = psmt.executeQuery();
         
         while(rset.next()) {
            hotelInfo.add(new Place(
                      rset.getString("PLC_NAME"),
                      rset.getString("PLC_ADDRESS"),
                      rset.getString("PLC_PNUMBER")));
         }
         System.out.println(hotelInfo);
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(psmt);
      }
      
      return hotelInfo;
   }

   
   
//시설상세창
   
 //시설상세창에 숙소 정보 띄우기
 	public Place selectHotel(String placeName, Connection conn) {
 		
 		Place place = new Place();
 		
 		PreparedStatement psmt = null;
 		
 		ResultSet rset = null;
 		
 		String sql = prop.getProperty("Hotel");
 		
 		try {
 			psmt = conn.prepareStatement(sql);
 			psmt.setString(1, placeName);
 			
 			rset = psmt.executeQuery();
 			
 			if(rset.next()) {
 				place = new Place(
 									rset.getInt("PLC_CODE"),
 									rset.getString("CATEGORY_CODE"),
 									rset.getString("DAREA_CODE"),
 									rset.getString("PLC_ADDRESS"),
 									rset.getString("PLC_TEXT"),
 									rset.getString("PLC_BNAME"),
 									rset.getString("PLC_PNUMBER"),
 									rset.getFloat("PLC_LA"),
 									rset.getFloat("PLC_LO"));
 			}
 			System.out.println(place);
 			System.out.println(place.getPlcLa());
 			
 			
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}finally {
 			close(rset);
 			close(psmt);
 		}
 		return place;
 	}

 	//시설상세창 밑에 놀거리,숙소,맛집 밑 정보띄우기위한 dareaCode찾기
 	public String findDareaCode(String dareaName, Connection conn) {
 		
 		String dareaCode = "";
 		
 		PreparedStatement psmt = null;
 		
 		ResultSet rset = null;
 		
 		String sql = prop.getProperty("findDareaCode");
 		
 		try {
 			psmt = conn.prepareStatement(sql);
 			
 			psmt.setString(1, dareaName);
 			
 			rset = psmt.executeQuery();
 			
 			if(rset.next()) {
 				dareaCode = rset.getString(1);
 			}
 		} catch (SQLException e) {
 			e.printStackTrace();
 		} finally {
 			close(rset);
 			close(psmt);
 		}
 		return dareaCode;
 	}
 	
 	//시설코드가져오기
 	public String findPlaceCode(String placeName, Connection conn) {
 		
 		String placeCode = "";
 		
 		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("findPlaceCode");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, placeName);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				placeCode = rset.getString("PLC_CODE");
			}
			System.out.println(placeCode);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(psmt);
		}
		return placeCode;
 	}
 	
 	//시설상세창에서 시설사진 띄우기
 	public ArrayList<Image> selectPlaceImages(String placeName, Connection conn) {
 		
 		ArrayList<Image> placeImages = new ArrayList<>();
 		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPlaceImages");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1,placeName);
			
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				placeImages.add(new Image(
							 rset.getString("FILE_PATH"),
							 rset.getString("CHANGE_NAME"),
							 rset.getInt("FILE_NO")));
			}
			System.out.println(placeImages);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(psmt);
		}
		return placeImages;
	}
 
   
// 검색창
   
   
   //메인창에서 검색키워드로 시설사진 찾기
   public ArrayList<Image> searchPlacePath(String word, Connection conn){
      ArrayList<Image> placePath = new ArrayList<>();
      
      PreparedStatement psmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("searchPlacePath");
      
      try {
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, '%'+word+'%');
         
         rset = psmt.executeQuery();
         
         while(rset.next()) {
            placePath.add(new Image(
                   rset.getString("FILE_PATH"),
                   rset.getString("CHANGE_NAME"),
                   rset.getInt("FILE_NO")
                   ));
         }
         System.out.println(placePath);
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(psmt);
      }
      
      return placePath;
   }
   
   //메인창에서 검색키워드로 시설 정보 찾기
   public ArrayList<Place> searchPlaceInfo(String word, Connection conn){
      ArrayList<Place> placeInfo = new ArrayList<>();
      
      PreparedStatement psmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("searchPlaceInfo");
      
      try {
         psmt = conn.prepareStatement(sql);
         psmt.setString(1, '%'+word+'%');
         
         rset = psmt.executeQuery();
         
         while(rset.next()) {
        	 placeInfo.add(new Place(
                     rset.getString("CATEGORY_CODE"),
                       rset.getString("PLC_NAME"),
                       rset.getString("PLC_ADDRESS"),
                       rset.getString("PLC_PNUMBER"),
                       rset.getString("DAREA_NAME")));

         }
         System.out.println(placeInfo);
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(psmt);
      }
      
      return placeInfo;
   }
   
   //관리자 시설등록시, 상세지역이름으로 상세지역코드 가져오기
	public String selectDAreaCode(String dAreaName, Connection conn) {
		
		String dareaCode = "";
		
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDAreaCode");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, dAreaName);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				dareaCode = rset.getString("DAREA_CODE");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
	         close(rset);
	         close(psmt);
	    }
	      
	    return dareaCode;
	}

	//관리자페이지에서 시설등록하기
	public int insertPlace(Place place, Connection conn) {
		
		int result = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("insertPlace");
		
//		INSERT INTO "Place" 
//		(PLC_CODE, 
//		 CATEGORY_CODE, 
//		 DAREA_CODE, 
//		 PLC_NAME, 
//		 PLC_ADDRESS, 
//		 PLC_TEXT, 
//		 PLC_BNAME,
//		 PLC_PNUMBER, 
//		 PLC_LA, 
//		 PLC_LO, 
//		 LOCAL_CODE)
//		 
//		VALUES(SEQ_PLC.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?)
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, place.getCategoryCode());
			psmt.setString(2, place.getDareaCode());
			psmt.setString(3, place.getPlcName());
			psmt.setString(4, place.getPlcAddress());
			psmt.setString(5, place.getPlcText());
			psmt.setString(6, place.getPlcBname());
			psmt.setString(7, place.getPlcPnumber());
			psmt.setFloat(8, place.getPlcLa());
			psmt.setFloat(9, place.getPlcLo());
			psmt.setString(10, place.getLocalCode());
			
			result = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
	         close(psmt);
	    }
	      
	    return result;
	}

	//관리자페이지에서 시설등록시, 이미지 데베에 업로드하기
	public int insertPlaceImages(ArrayList<Image> list, Connection conn) {
		
		int result1 = 0;
		int result = 0;
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("insertPlaceImages");
		
		try {
			
			psmt = conn.prepareStatement(sql);
			
			// PLC_CODE, ORIGIN_NAME, FILE_PATH, DAREA_CODE, LOCAL_CODE, CATEGORY_CODE
            for( Image img : list) {
                // 반복문이 돌아갈때마다 미완성된 sql문을 담은 psmt객체를 생성
                
//            	INSERT INTO "Image"
//            	   (FILE_NO, 
//            	   PLC_CODE, 
//            	   ORIGIN_NAME, 
//            	   FILE_PATH, 
//            	   DAREA_CODE, 
//            	   STATUS, 
//            	   LOCAL_CODE, 
//            	   CATEGORY_CODE,
//            	   CHANGE_NAME)
//            	   VALUES(SEQ_FILE.NEXTVAL, ?, ?, ?, ?, 'Y', ?, ?, ?)
            	
            	psmt.setInt(1, img.getPlcCode());
                psmt.setString(2, img.getOriginName());
                psmt.setString(3, img.getFilePath());
                psmt.setString(4, img.getDareaCode());
                psmt.setString(5, img.getLocalCode());
                psmt.setString(6, img.getCategoryCode());
                psmt.setString(7, img.getChangeName());
                
                // 실행하고 결과값 받기
                result1 = psmt.executeUpdate();
                
                
                if(result1 == 0) {
                    result = 0;
                }else {
                	result = 1;
                }
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		return result;
	}



	  // 로그인시 찜 유지하기 위한 객체 생성
	   public Heart selectHeart(int memberCode, int placeCode2, Connection conn) {
	         Heart ht = null;
	         
	         ResultSet rset = null;
	         
	         PreparedStatement psmt = null;
	         
	         String sql = prop.getProperty("selectHeart");
	         
	         try {
	         psmt = conn.prepareStatement(sql);
	         
	         psmt.setInt(1, memberCode);
	         psmt.setInt(2, placeCode2);
	         rset = psmt.executeQuery();
	         
	         if(rset.next())  {
	            ht = new Heart(
	                        rset.getInt("MEM_NO"),
	                       rset.getInt("PLC_CODE"));
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(psmt);
	      } 
	         return ht;
	         
	      }

	//관리자페이지 - 시설등록에서 시설정보작성하고 등록된 시설코드(plcCode) 가져오기
	public int selectplaceCode(String plcName, Connection conn) {

		int placeCode = 0;
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPlaceCode");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, plcName);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				placeCode = rset.getInt("PLC_CODE");
			}
			
			System.out.println(placeCode);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
	         close(rset);
	         close(psmt);
	    } 
		return placeCode;
	}



} 