package com.ontrip.location.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.ontrip.location.vo.Location;
import com.ontrip.member.model.dao.MemberDao;
import static com.ontrip.common.JDBCTemplate.*;

public class LocationDao {

	private Properties prop = new Properties();
	
	public LocationDao() {
		 String fileName = LocationDao.class.getResource("/sql/location/location-mapper.xml").getPath();
		 
		 try {
			 prop.loadFromXML(new FileInputStream(fileName));
		 } catch (IOException e) {
			 e.printStackTrace();
		 }
	}

	public String selectLocal(String localName, Connection conn) {

		String localText = "";
		
		PreparedStatement psmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectLocal");
		
		try {
			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, localName);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				do {
					localText = rset.getString("LOCAL_TEXT");					
				}while(rset.next());
			}
			System.out.println(localText);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		
		return localText;
	}

	
}
