package com.ontrip.location.service;

import java.sql.Connection;
import static com.ontrip.common.JDBCTemplate.*;
import com.ontrip.location.dao.LocationDao;

public class LocationService {
	
	
	public String selectLocal(String localName) {
		
		Connection conn = getConnection();
		
		String localText =new LocationDao().selectLocal(localName, conn);
		System.out.println(localText);
		close();
		
		return localText;
	}
}
