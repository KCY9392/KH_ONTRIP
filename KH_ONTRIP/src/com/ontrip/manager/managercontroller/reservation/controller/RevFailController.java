package com.ontrip.manager.managercontroller.reservation.controller;
import com.ontrip.manager.managercontroller.reservation.RevFrontController;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RevFailController implements RevFrontController {

    @Override
    public void process(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException, ParseException, SQLException {

        String viewPath = "/views/manager/adreservation/failed.jsp";

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(viewPath);

        requestDispatcher.forward(request, response);

    }
}
