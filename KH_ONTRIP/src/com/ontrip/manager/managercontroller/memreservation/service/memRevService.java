package com.ontrip.manager.managercontroller.memreservation.service;

import static com.ontrip.common.JDBCTemplate.close;
import static com.ontrip.common.JDBCTemplate.getConnection;

import com.ontrip.common.JDBCTemplate;
import com.ontrip.image.vo.Image;
import com.ontrip.manager.managercontroller.memreservation.dao.memRevDao;
import com.ontrip.reservation.vo.Reservation;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class memRevService {

    memRevDao memrevdao = memRevDao.getInstance();

    private static final memRevService instance = new memRevService();

    public static memRevService getInstance() {
        return instance;
    }


    public int getTotal(int memberNo) throws SQLException {
        Connection con = JDBCTemplate.getConnection();
        int total = memrevdao.getTotal(con, memberNo);
        return total;
    }


    public ArrayList<Reservation> getRevList(int pageNum, int amount, int memberNo)
        throws SQLException {
        Connection con = JDBCTemplate.getConnection();
        ArrayList<Reservation> reservations = memrevdao.getRevList(con, pageNum, amount, memberNo);
        return reservations;
    }


    public Reservation getRev(int rnCode) throws SQLException {
        Connection con = JDBCTemplate.getConnection();
        Reservation reservation = memrevdao.getRev(con, rnCode);
        return reservation;

    }


    public Image selectHotelPath(int plcCode) throws SQLException {
        Connection conn = getConnection();

        Image image = memrevdao.RevHotelPath(plcCode, conn);

        close();

        return image;
    }


}
