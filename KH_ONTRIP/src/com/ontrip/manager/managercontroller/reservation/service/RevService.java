package com.ontrip.manager.managercontroller.reservation.service;

import static com.ontrip.common.JDBCTemplate.close;

import com.ontrip.common.JDBCTemplate;
import com.ontrip.manager.managercontroller.reservation.revdao.RevDao;
import com.ontrip.reservation.vo.Reservation;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class RevService {

    RevDao revDao = RevDao.getInstance();


    private static final RevService instance = new RevService();

    public static RevService getInstance(){
        return  instance  ;
    }




    public int getPrice(String roomType ,int rnCount , int dates ) {

        Map<String , Integer  > typesForPrice = new HashMap<String , Integer>();
        typesForPrice.put("스탠다드", 100000);
        typesForPrice.put("트윈", 120000);
        typesForPrice.put("패밀리", 200000);
        typesForPrice.put("디럭스", 300000);
        typesForPrice.put("스위트", 400000);



        Integer integer = typesForPrice.get(roomType);

        int typeForPrice = integer.intValue();

        System.out.println("typeForPrice = " + typeForPrice);
        System.out.println("dates = " + dates);
        System.out.println("rnCount = " + rnCount);

        int totalPrice = typeForPrice * rnCount * dates ;

        return totalPrice;

    };

    public void saveRev(Reservation reservation) throws SQLException {
        Connection con = JDBCTemplate.getConnection();
        revDao.saveRev(reservation , con);
        close();

    };


    public String getPlaceName(int plcCode) throws SQLException {
        Connection  con = JDBCTemplate.getConnection();
        return revDao.getPlaceName(con, plcCode);
    }




}
