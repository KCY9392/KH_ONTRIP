package com.ontrip.manager.managercontroller.memreservation.controller;

import com.ontrip.image.vo.Image;
import com.ontrip.manager.managercontroller.memreservation.ResFrontController;
import com.ontrip.reservation.vo.Reservation;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReservationDetailedController implements ResFrontController {

    com.ontrip.manager.managercontroller.memreservation.service.memRevService memRevService = com.ontrip.manager.managercontroller.memreservation.service.memRevService.getInstance();


    @Override
    public void process(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException, SQLException {
        int rnCode = Integer.parseInt(request.getParameter("rnCode"));

        Reservation rev = memRevService.getRev(rnCode);

        int placeCode = rev.getPlaceCode();

        Image image = memRevService.selectHotelPath(placeCode);

        request.setAttribute("image", image);
        request.setAttribute("rev", rev);

        System.out.println("image = " + image);

        String viewPath = "/views/myPage/myPageReservationDetail.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(viewPath);
        requestDispatcher.forward(request, response);


    }
}
