package com.ontrip.manager.managercontroller.reservation.controller;

import com.ontrip.manager.managercontroller.reservation.RevFrontController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;

public class RevSuccessController implements RevFrontController {
    @Override
    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, ParseException {

        String rnName = request.getParameter("rnName");
        String msg = request.getParameter("msg");

        System.out.println("msg = " + msg);
        System.out.println("rnName = " + rnName);


//        String viewPath = "/views/manager/adreservation/success.jsp";
//
//        RequestDispatcher requestDispatcher = request.getRequestDispatcher(viewPath);
//
//        requestDispatcher.forward(request, response);


    }
}
