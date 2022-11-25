package com.ontrip.manager.managercontroller.reservation.controller;

import com.ontrip.manager.managercontroller.reservation.RevFrontController;
import com.ontrip.manager.managercontroller.reservation.service.RevService;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RevFormController implements RevFrontController {


    RevService revService = RevService.getInstance();

    @Override
    public void process(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException, SQLException {

        String plcCode1 = request.getParameter("plcCode");
//
        int plcCode = Integer.parseInt(plcCode1);
//
        String memNo1 = request.getParameter("memNo");
//
        int memNo = Integer.parseInt(memNo1);
//

        String placeName = revService.getPlaceName(plcCode);

        request.setAttribute("placeName", placeName);
        request.setAttribute("plcCode", plcCode);
        request.setAttribute("memNo", memNo);

        String viewPath = "/views/reservation/reservationForm2.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(viewPath);
        requestDispatcher.forward(request, response);


    }
}
