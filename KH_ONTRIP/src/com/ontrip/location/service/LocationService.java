package com.ontrip.location.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.ontrip.common.JDBCTemplate.*;

import com.ontrip.detailArea.vo.DetailArea;
import com.ontrip.image.vo.Image;
import com.ontrip.location.dao.LocationDao;

public class LocationService {
	
	
	public String selectLocal(String localName) {
		
		Connection conn = getConnection();
		
		String localText =new LocationDao().selectLocal(localName, conn);
//		System.out.println(localText);
		close();
		
		return localText;
	}
	
	public ArrayList<DetailArea> selectDAreaName(String localCode) {
			
			Connection conn = getConnection();
			
			ArrayList<DetailArea> darea = new LocationDao().selectDAreaName(localCode, conn);
			
			close();
			
			return darea;
		}
	
	public ArrayList<Image> selectFilePath(String localCode){
		
		Connection conn = getConnection();
		ArrayList<Image> filePath = new LocationDao().selectFilePath(localCode, conn);
		
		close();
		
		return filePath;
	}
}
