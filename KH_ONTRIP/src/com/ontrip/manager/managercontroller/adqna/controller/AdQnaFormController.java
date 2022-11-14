package com.ontrip.manager.managercontroller.adqna.controller;


import com.ontrip.manager.managercontroller.adqna.QnaFrontController;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdQnaFormController implements QnaFrontController {

    @Override
    public void process(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException {

        String viewPath = "/views/manager/adqna/qnaSaveForm.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(viewPath);
        requestDispatcher.forward(request, response);

    }
}
