package com.ontrip.manager.managercontroller.memreservation;

import com.ontrip.manager.managercontroller.memreservation.controller.ReservationDetailedController;
import com.ontrip.manager.managercontroller.memreservation.controller.ReservationListController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;


/*
    마이페이지 숙소 예약확인 / 상세조회
 */
@WebServlet(name ="memResFrontController"  , urlPatterns ="/myPage/reservationList/*" )
public class memResFrontController extends HttpServlet {

    private Map<String, ResFrontController> controllerMap = new HashMap<>();


    public memResFrontController() {

        controllerMap.put("/KH_ONTRIP/myPage/reservationList", new ReservationListController());   // 마이페이지 숙소리스트
        controllerMap.put("/KH_ONTRIP/myPage/reservationList/Detailed" , new ReservationDetailedController()); // 숙소상세
    }

//    public void service(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException {
//        String requestURI = request.getRequestURI();
//
//        if (requestURI == null) {
//            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
//            return;
//        }
//
//
//        ResFrontController resFrontController = controllerMap.get(requestURI);
//
//        try {
//            resFrontController.process(request, response);
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            doProcess(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            doProcess(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        //get이든 post든 어떤 방식으로 요청으로 들어오든 로직은 여기에 작성.

        System.out.println("ReviewFrontController.service");

        String requestURI = request.getRequestURI();

        System.out.println("requestURI = " + requestURI);

        ResFrontController resFrontController = controllerMap.get(requestURI);


        if (resFrontController == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        resFrontController.process(request, response);
    }





}
