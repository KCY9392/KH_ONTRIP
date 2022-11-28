package com.ontrip.manager.dao;

import com.ontrip.common.model.vo.PageInfo;
import com.ontrip.hash.vo.Hash;
import com.ontrip.image.vo.Image;
import com.ontrip.member.model.dao.MemberDao;
import com.ontrip.member.model.vo.Member;
import com.ontrip.place.model.vo.Place;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.ontrip.common.JDBCTemplate.close;

public class ManagerDao {

    private static final ManagerDao instance = new ManagerDao();

    public static ManagerDao getInstance(){
        return  instance  ;
    }


    private Properties prop = new Properties();

    public ManagerDao() {

        String fileName = MemberDao.class.getResource("/sql/member/member-mapper.xml").getPath();

        try {
            prop.loadFromXML(new FileInputStream(fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }

    }


    public ArrayList<Member> adMinMembers(Connection con) throws SQLException {

        ArrayList<Member> members = new ArrayList<Member>();

        ResultSet rs = null;

        PreparedStatement psmt = null;

        String sql = prop.getProperty("memberList");

        try {

            psmt = con.prepareStatement(sql);
            rs = psmt.executeQuery();

            while (rs.next()) {
                Member member = new Member();
                member.setMemberNo(rs.getInt("MEM_NO"));
                member.setMemberId(rs.getString("MEM_ID"));
                member.setMemberPwd(rs.getString("MEM_PWD"));
                member.setMemberName(rs.getString("MEM_NAME"));
                member.setGender(rs.getString("MEM_GENDER"));
                member.setPhone(rs.getString("MEM_PHONE"));
                member.setBirthDate(rs.getString("MEM_BIRTH"));
                member.setStatus(rs.getString("STATUS"));
                member.setEnrollDate(rs.getDate("MEM_ENROLLDATE"));
                member.setModifyDate(rs.getDate("MEM_MODIFYDATE"));
                members.add(member);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(psmt);
        }

        return members;
    }

    public Member adMinMember(int memberNo , Connection con) throws SQLException {

        ResultSet rs = null;

        PreparedStatement psmt = null;

        String sql = prop.getProperty("memberByNo");
        Member member = new Member();

        try {
            psmt = con.prepareStatement(sql);
            psmt.setInt(1, memberNo);
            rs = psmt.executeQuery();
            if (rs.next()) {
                member.setMemberNo(rs.getInt("MEM_NO"));
                member.setMemberId(rs.getString("MEM_ID"));
                member.setMemberPwd(rs.getString("MEM_PWD"));
                member.setMemberName(rs.getString("MEM_NAME"));
                member.setGender(rs.getString("MEM_GENDER"));
                member.setPhone(rs.getString("MEM_PHONE"));
                member.setBirthDate(rs.getString("MEM_BIRTH"));
                member.setStatus(rs.getString("STATUS"));
                member.setEnrollDate(rs.getDate("MEM_ENROLLDATE"));
                member.setModifyDate(rs.getDate("MEM_MODIFYDATE"));
                return member;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            close(rs);
            close(psmt);
        }
        return member;
    }

    // 총 시설 목록구하는 메소드
    public ArrayList<Place> getList(String categoryCode, int pageNum, int amount, Connection conn){
    	ArrayList<Place> placeList = new ArrayList<Place>();
    	
    	PreparedStatement psmt = null;
    	
    	ResultSet rset = null;
    	
    	String sql = prop.getProperty("placePaging");
    	
    	try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1,categoryCode);
			psmt.setInt(2, ((pageNum - 1) * amount)+1);
            psmt.setInt(3, pageNum * amount);
            
            rset = psmt.executeQuery();
            
            while(rset.next()) {
            	placeList.add(new Place(
            					rset.getInt("PLC_CODE"),
            					rset.getString("PLC_NAME"),
            					rset.getDate("PLC_DATE"),
            					rset.getString("CATEGORY_CODE")));
            }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
    	
    	return placeList;
    }
    
    // 시설목록의 총 갯수를 구하는 메소드
    public int getTotal(Connection conn) {
    	int total = 0;
    	
    	PreparedStatement psmt = null;
    	
    	ResultSet rset = null;
    	
    	String sql = prop.getProperty("getPlaceListTotal");
    	
    	try {
			psmt = conn.prepareStatement(sql);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				total = rset.getInt("total");
				
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
    	
    	return total;
    }
    
    // 시설 상세조회를 위한 메소드
   public Place detailPlace(String placeName, Connection conn){
	   Place place = null;
	   
	   PreparedStatement psmt = null;
	   
	   ResultSet rset = null;
	   
	   String sql = prop.getProperty("detailPlace");
	   try {
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, placeName);
		
		rset = psmt.executeQuery();
		
		while(rset.next()) {
			place = new Place(
							rset.getString("PLC_NAME"),
							rset.getString("PLC_ADDRESS"),
							rset.getString("PLC_TEXT"),
							rset.getString("PLC_BNAME"),
							rset.getString("PLC_PNUMBER"),
							rset.getFloat("PLC_LA"),
							rset.getFloat("PLC_LO"),
							rset.getString("CATEGORY_NAME"),
							rset.getString("LOCAL_NAME"),
							rset.getString("DAREA_NAME"),
							rset.getString("CATEGORY_CODE"));
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(psmt);
	}
	   
	   return place;
	   
	   
   }
   
   // 시설 삭제 메소드
   public int deletePlace(String placeName, Connection conn) {
	   int result1 = 0;
	   
	   PreparedStatement psmt = null;
	   
	   String sql = prop.getProperty("deletePlace");
	   
	   try {
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, placeName);
		
		result1 = psmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(psmt);
	}
	  return result1;
   }
   
   // 시설 이미지 삭제 메소드
   public int deletePlaceImg(String placeName, Connection conn) {
	   int result2 = 0;
	   
	   PreparedStatement psmt = null;
	   
	   String sql = prop.getProperty("deletePlaceImg");
	   
	   try {
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, placeName);
		
		result2 = psmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(psmt);
	}
	  return result2;
   }
   
   public ArrayList<Image> detailPlaceImage(String placeName, Connection conn) {
	   ArrayList<Image> placeImg = new ArrayList<Image>();
	   
	   PreparedStatement psmt = null;
	   
	   ResultSet rset = null;
	   
	   String sql = prop.getProperty("detailPlaceImage");
	   
	   try {
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, placeName);
		
		rset = psmt.executeQuery();
		
		while(rset.next()) {
			placeImg.add( new Image( 
					 rset.getString("FILE_PATH"),
					 rset.getString("CHANGE_NAME"),
					 rset.getInt("FILE_NO")));
		}
		
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(psmt);
	}
	   return placeImg;
	   
   }
   
   public ArrayList<Hash> detailHash(String placeName, Connection conn) {
	   ArrayList<Hash> hash = new ArrayList<Hash>();
	   
	   PreparedStatement psmt = null;
	   
	   ResultSet rset = null;
	   
	   String sql = prop.getProperty("detailHash");
	   
	   try {
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, placeName);
		
		rset = psmt.executeQuery();
		
		while(rset.next()) {
			hash.add( new Hash( 
					rset.getInt("HAS_NO"),
					 rset.getString("HAS_NAME")));
		}
		
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(psmt);
	}
	   return hash;

   }
   
   public int deleteHashStorage(String placeName, Connection conn) {
	   int result2 = 0;
	   
	   PreparedStatement psmt = null;
	   
	   String sql = prop.getProperty("deleteHashStorage");
	   
	   try {
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, placeName);
		
		result2 = psmt.executeUpdate();
		
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(psmt);
	}
	  return result2;
   }
   
   
   public int deleteHash(int[] hashArr, Connection conn) {
	   int result4 = 0;
	   
	   String hash = "";
		for(int i=0; i<hashArr.length; i++) {
			hash += "?";
			if(i<hashArr.length-1) {
				hash += ",";
			}
//			System.out.println(hash);	
				
		}
		//? , ? , ? 
		PreparedStatement psmt = null;
		String sql = prop.getProperty("deleteHash");
		sql = sql.replace("@",  hash);
		try {
			psmt = conn.prepareStatement(sql);
			
			for(int i=0; i<hashArr.length; i++) {
				psmt.setInt(i+1, hashArr[i]);
			}
			
			result4 = psmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		
		return result4;
   }
}


