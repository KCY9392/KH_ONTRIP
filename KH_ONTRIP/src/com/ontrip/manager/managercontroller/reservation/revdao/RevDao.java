package com.ontrip.manager.managercontroller.reservation.revdao;

import com.ontrip.reservation.vo.Reservation;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import static com.ontrip.common.JDBCTemplate.close;

public class RevDao {



    private static final RevDao instance = new RevDao();

    public static RevDao getInstance(){
        return  instance  ;
    }



    private Properties prop = new Properties();

    public RevDao() {

        String fileName = RevDao.class.getResource("/sql/manager/manager-mapper.xml").getPath();


        try {
            prop.loadFromXML(new FileInputStream(fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public void saveRev(Reservation reservation, Connection con) throws SQLException {

        String sql = prop.getProperty("saveRev");
        PreparedStatement pstmt = null;

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, reservation.getPlaceCode());
            pstmt.setInt(2, reservation.getMemberNo());
            pstmt.setString(3, reservation.getRnName());
            pstmt.setInt(4, reservation.getRnAdult());
            pstmt.setInt(5, reservation.getRnChild());
            pstmt.setInt(6, reservation.getRnCount());
            pstmt.setString(7, reservation.getRnRoomType());
            pstmt.setString(8, reservation.getRnPhoneNumber());
            pstmt.setDate(9, reservation.getRnCheckIn());
            pstmt.setDate(10, reservation.getRnCheckOut());
            pstmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(pstmt);
        }

    }

}
