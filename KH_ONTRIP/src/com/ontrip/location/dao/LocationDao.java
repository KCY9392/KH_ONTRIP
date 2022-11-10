package com.ontrip.location.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.ontrip.location.vo.Location;

public class LocationDao {

	private Properties prop = new Properties();
	
	public String selectlocalText(String localName, Connection conn) {

		String localText = "";
		
		PreparedStatement psmt = null;
		
		String sql = prop.getProperty("selectlocalText");
		
		try {
			psmt = conn.prepareStatement(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
}
