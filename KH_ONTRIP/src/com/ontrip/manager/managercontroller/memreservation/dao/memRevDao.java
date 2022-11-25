package com.ontrip.manager.managercontroller.memreservation.dao;

import static com.ontrip.common.JDBCTemplate.close;

import com.ontrip.image.vo.Image;
import com.ontrip.reservation.vo.Reservation;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

public class memRevDao {

    private static final memRevDao instance = new memRevDao();

    public static memRevDao getInstance() {
        return instance;
    }


    private Properties prop = new Properties();

    public memRevDao() {

        String fileName = memRevDao.class.getResource("/sql/manager/manager-mapper.xml").getPath();

        try {
            prop.loadFromXML(new FileInputStream(fileName));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public int getTotal(Connection con, int memberNo) throws SQLException {
        int result = 0;
        String sql = prop.getProperty("revGetTotal");
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, memberNo);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                result = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        return result;
    }


    public ArrayList<Reservation> getRevList(Connection con, int pageNum, int amount, int memberNo)
        throws SQLException {

        ArrayList<Reservation> revList = new ArrayList<Reservation>();

        String sql = prop.getProperty("reservationPaging");

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, memberNo);
            pstmt.setInt(2, ((pageNum - 1) * amount) + 1);
            pstmt.setInt(3, pageNum * amount);

            rs = pstmt.executeQuery();

            while (rs.next()) {
                Reservation reservation = new Reservation();
                reservation.setRnCode(rs.getInt("RN_CODE"));
                reservation.setPlaceCode(rs.getInt("PLC_CODE"));
                reservation.setMemberNo(rs.getInt("MEM_NO"));
                reservation.setRnName(rs.getString("RN_NAME"));
                reservation.setRnAdult(rs.getInt("RN_ADULT"));
                reservation.setRnChild(rs.getInt("RN_CHILD"));
                reservation.setRnCount(rs.getInt("RN_COUNT"));
                reservation.setRnRoomType(rs.getString("ROOM_TYPE"));
                reservation.setRnPhoneNumber(rs.getString("RN_PHONE"));
                reservation.setRnCheckIn(rs.getDate("RN_CIN"));
                reservation.setRnCheckOut(rs.getDate("RN_COUT"));
                reservation.setRnDate(rs.getDate("RN_DATE"));
                reservation.setRnStatus(rs.getString("STATUS"));
                reservation.setRnPrice(rs.getInt("RN_PRICE"));
                reservation.setPlcName(rs.getString("PLC_NAME"));
                revList.add(reservation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        return revList;
    }


    public Reservation getRev(Connection con, int rnCode) throws SQLException {
        Reservation reservation = new Reservation();
        String sql = prop.getProperty("reservationByCode");
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, rnCode);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                reservation.setRnCode(rs.getInt("RN_CODE"));
                reservation.setPlaceCode(rs.getInt("PLC_CODE"));
                reservation.setMemberNo(rs.getInt("MEM_NO"));
                reservation.setRnName(rs.getString("RN_NAME"));
                reservation.setRnAdult(rs.getInt("RN_ADULT"));
                reservation.setRnChild(rs.getInt("RN_CHILD"));
                reservation.setRnCount(rs.getInt("RN_COUNT"));
                reservation.setRnRoomType(rs.getString("ROOM_TYPE"));
                reservation.setRnPhoneNumber(rs.getString("RN_PHONE"));
                reservation.setRnCheckIn(rs.getDate("RN_CIN"));
                reservation.setRnCheckOut(rs.getDate("RN_COUT"));
                reservation.setRnDate(rs.getDate("RN_DATE"));
                reservation.setRnStatus(rs.getString("STATUS"));
                reservation.setRnPrice(rs.getInt("RN_PRICE"));
                reservation.setPlcName(rs.getString("PLC_NAME"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        return reservation;
    }


    public Image RevHotelPath(int plcCode, Connection con) throws SQLException {
        Image image = new Image();
        String sql = prop.getProperty("getHotelsImage");

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, plcCode);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                image.setFileNo(rs.getInt("FILE_NO"));
                image.setFilePath(rs.getString("FILE_PATH"));
                image.setChangeName(rs.getString("CHANGE_NAME"));
            }


        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(rs);
            close(pstmt);
        }
        return image;
    }

}
