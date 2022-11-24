package com.ontrip.manager.managercontroller.reservation.controller;

import com.ontrip.manager.managercontroller.reservation.RevFrontController;
import com.ontrip.manager.managercontroller.reservation.service.RevService;
import com.ontrip.reservation.vo.Reservation;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RevSuccessController implements RevFrontController {

    RevService revService = RevService.getInstance();

    @Override
    public void process(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException, ParseException, SQLException {

        String rnName = request.getParameter("rnName");
        String msg = request.getParameter("msg");

        System.out.println("msg = " + msg);
        System.out.println("rnName = " + rnName);

        HttpSession session = request.getSession();
        Reservation reservation = (Reservation) session.getAttribute("reservation");

        System.out.println("reservation = " + reservation);

        revService.saveRev(reservation);

        session.removeAttribute("reservation");

        String viewPath = "/views/manager/adreservation/success.jsp";

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(viewPath);

        requestDispatcher.forward(request, response);


    }
}
