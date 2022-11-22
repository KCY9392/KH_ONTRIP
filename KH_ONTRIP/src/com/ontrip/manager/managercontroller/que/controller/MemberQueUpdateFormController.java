package com.ontrip.manager.managercontroller.que.controller;

import com.ontrip.manager.managercontroller.que.QuFrontController;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class MemberQueUpdateFormController implements QuFrontController {
    @Override
    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        String qCode = request.getParameter("qCode");
        String qTitle = request.getParameter("qTitle");
        String qContent = request.getParameter("qContent");

        request.setAttribute("qCode", qCode);
        request.setAttribute("qTitle", qTitle);
        request.setAttribute("qContent", qContent);


        String viewPath = "/views/manager/memberque/memberQueUpdateForm2.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(viewPath);
        requestDispatcher.forward(request, response);
    }
}
