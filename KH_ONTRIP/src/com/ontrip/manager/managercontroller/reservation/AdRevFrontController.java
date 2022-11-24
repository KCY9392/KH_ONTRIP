package com.ontrip.manager.managercontroller.reservation;


import com.ontrip.manager.managercontroller.reservation.controller.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

/*
  사용자 숙소 예약/결제
 */
@WebServlet(name = "AdRevFrontController" , urlPatterns = "/reservation/*")
public class AdRevFrontController extends HttpServlet {

    private Map<String, RevFrontController> controllerMap = new HashMap<>();

    public AdRevFrontController() {

        controllerMap.put("/KH_ONTRIP/reservation/saveform", new RevFormController()); // 예약하기 폼
        controllerMap.put("/KH_ONTRIP/reservation/save", new RevSaveController()); // 예약결과호출
        controllerMap.put("/KH_ONTRIP/reservation/pay", new RevPayController()); // 예약결제
        controllerMap.put("/KH_ONTRIP/reservation/order/paySuccess" , new RevSuccessController()); //결제성공 / 예약저장
        controllerMap.put("/KH_ONTRIP/reservation/order/payFail" , new RevFailController()); // 결제실패

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            doProcess(request, response);
        } catch (ParseException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            doProcess(request, response);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException, SQLException {
        //get이든 post든 어떤 방식으로 요청으로 들어오든 로직은 여기에 작성.

        System.out.println("Main´FrontController.service");

        String requestURI = request.getRequestURI();

        System.out.println("requestURI = " + requestURI);

        RevFrontController revFrontController = controllerMap.get(requestURI);

        if (revFrontController == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        revFrontController.process(request, response);
    }






}
