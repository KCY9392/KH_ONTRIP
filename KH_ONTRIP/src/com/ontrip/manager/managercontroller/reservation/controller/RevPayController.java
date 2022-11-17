package com.ontrip.manager.managercontroller.reservation.controller;

import com.ontrip.manager.managercontroller.reservation.RevFrontController;
import com.ontrip.manager.managercontroller.reservation.service.RevService;
import com.ontrip.reservation.vo.Reservation;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class RevPayController implements RevFrontController {

    RevService revService = RevService.getInstance();

    @Override
    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException, ServletException {


        String sdate = request.getParameter("sdate");
        String edate = request.getParameter("edate");


        System.out.println("sdate = " + sdate);
        System.out.println("edate = " + edate);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startDate = sdf.parse(sdate);
        Date endDate = sdf.parse(edate);


        int dates = getDates(startDate, endDate);

        //  System.out.println("diffDay = " + diffDay);

        System.out.println("dates = " + dates);


        long time = startDate.getTime();
        long time1 = endDate.getTime();
        String plcCode1 = request.getParameter("plcCode");
        System.out.println("plcCode1 = " + plcCode1);
        int plcCode = Integer.parseInt(plcCode1);
        String memNo1 = request.getParameter("memNo");
        int memNo = Integer.parseInt(memNo1);
        String rnName = request.getParameter("rnName");
        String rnAdult1 = request.getParameter("rnAdult");
        int rnAdult = Integer.parseInt(rnAdult1);
        String rnChild1 = request.getParameter("rnChild");
        int rnChild = Integer.parseInt(rnChild1);
        String rnCount1 = request.getParameter("rnCount");
        int rnCount = Integer.parseInt(rnCount1);
        String rnType = request.getParameter("rnType");
        String rnPhone = request.getParameter("rnPhone");
        java.sql.Date rnCheckin = new java.sql.Date(time);
        java.sql.Date rnCheckout = new java.sql.Date(time1);

        Reservation reservation = new Reservation(
                null , plcCode , memNo , rnName , rnAdult , rnChild , rnCount , rnType , rnPhone , rnCheckin , rnCheckout , null , null
        );


        try {
            revService.saveRev(reservation);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            System.out.println("reservation = " + reservation);
        }



        int totalPrice = revService.getPrice(rnType, rnCount, dates);   // 결제가격
        System.out.println("totalPrice = " + totalPrice);



        //결제가격  , 결제자 이름/휴대폰번호
        request.setAttribute("totalPrice", totalPrice);
        request.setAttribute("rnName" , rnName);
        request.setAttribute("rnPhone" , rnPhone);
        String viewPath = "/views/manager/adreservation/payment.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(viewPath);
        requestDispatcher.forward(request, response);



    }

    private static int getDates(Date startDate, Date endDate) {
        long diffSec = (endDate.getTime() - startDate.getTime()) / 1000;
        long diffDay = diffSec / (24*60*60);
        int dates  = Long.valueOf(diffDay).intValue();
        return dates;
    }
}
