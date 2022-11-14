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

public class AdAnsFormController implements QueFrontController {

    AdQuestionService adQuestionService = AdQuestionService.getInstance();

    @Override
    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        String qCode = request.getParameter("qCode");
        int i = Integer.parseInt(qCode);


        Question byCode = adQuestionService.getByCode(i);

        request.setAttribute("byCode", byCode);

        String viewPath = "/views/manager/adquestion/questionform.jsp";

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(viewPath);
        requestDispatcher.forward(request, response);
    }
}
