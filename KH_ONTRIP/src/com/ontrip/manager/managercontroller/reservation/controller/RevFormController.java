package com.ontrip.manager.managercontroller.reservation.controller;

import com.ontrip.manager.managercontroller.reservation.RevFrontController;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class RevFormController implements RevFrontController {
    @Override
    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


        String plcCode1 = request.getParameter("plcCode");
//
        int plcCode = Integer.parseInt(plcCode1);
//
        String memNo1 = request.getParameter("memNo");
//
        int memNo = Integer.parseInt(memNo1);
//
        request.setAttribute("plcCode", plcCode);
        request.setAttribute("memNo", memNo);



        String viewPath = "/views/manager/adreservation/reservationForm.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(viewPath);
        requestDispatcher.forward(request, response);




    }
}
