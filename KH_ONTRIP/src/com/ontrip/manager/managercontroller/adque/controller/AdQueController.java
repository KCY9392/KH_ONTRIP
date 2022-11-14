package com.ontrip.manager.managercontroller.adque.controller;


import com.ontrip.manager.managercontroller.adque.QueFrontController;
import com.ontrip.manager.service.AdQuestionService;
import com.ontrip.question.vo.Question;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class AdQueController implements QueFrontController {

    AdQuestionService adQuestionService = AdQuestionService.getInstance();

    @Override
    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {

        String qCode = request.getParameter("qCode");
        int i = Integer.parseInt(qCode);

        System.out.println("i = " + i);

        Question questionByCode = adQuestionService.getByCode(i);

        request.setAttribute("questionByCode", questionByCode);

        String viewPath = "/views/manager/adquestion/questionDetailed.jsp";

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(viewPath);

        requestDispatcher.forward(request, response);

    }
}
