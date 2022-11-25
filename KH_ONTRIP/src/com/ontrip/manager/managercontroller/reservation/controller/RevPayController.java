package com.ontrip.manager.managercontroller.reservation.controller;

import com.ontrip.manager.managercontroller.reservation.RevFrontController;
import com.ontrip.manager.managercontroller.reservation.service.RevService;
import java.io.IOException;
import java.text.ParseException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RevPayController implements RevFrontController {

    RevService revService = RevService.getInstance();

    @Override
    public void process(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ParseException, ServletException {

        String placeName = request.getParameter("placeName");
        String rnName = request.getParameter("rnName");
        String rnPhone = request.getParameter("rnPhone");
        String totalPrice1 = request.getParameter("totalPrice");
        int totalPrice = Integer.parseInt(totalPrice1);

        request.setAttribute("placeName", placeName);
        request.setAttribute("rnName", rnName);
        request.setAttribute("rnPhone", rnPhone);
        request.setAttribute("totalPrice", totalPrice);

        String viewPath = "/views/reservation/payment.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(viewPath);
        requestDispatcher.forward(request, response);


    }


}
