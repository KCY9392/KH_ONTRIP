package com.ontrip.manager.managercontroller.memreservation.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.manager.managercontroller.memreservation.ResFrontController;

public class ReservationDelete implements ResFrontController{
	
	com.ontrip.manager.managercontroller.memreservation.service.memRevService memRevService = com.ontrip.manager.managercontroller.memreservation.service.memRevService.getInstance();


@Override
public void process(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException, SQLException {
	
    int rnCode = Integer.parseInt(request.getParameter("rnCode"));

    memRevService.deleteReservation(rnCode);

    response.sendRedirect("/KH_ONTRIP/myPage/reservationList");
}
}