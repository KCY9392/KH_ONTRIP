package com.ontrip.location.service;

import java.sql.Connection;

import com.ontrip.common.JDBCTemplate;
import com.ontrip.location.dao.LocationDao;
import com.ontrip.location.vo.Location;

public class LocationService {
	
	LocationDao ld = new LocationDao();
	
	public String selectlocalText(String localName) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		String localText = ld.selectlocalText(localName, conn);
		
		return localText;
	}
}
