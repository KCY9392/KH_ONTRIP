package com.ontrip.manager.managercontroller.adque.controller;


import com.ontrip.manager.managercontroller.adque.QueFrontController;
import com.ontrip.manager.service.AdQuestionService;
import com.ontrip.manager.vo.Page;
import com.ontrip.question.vo.MemberQuestionBoard;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class AdQueListController implements QueFrontController {


    AdQuestionService adQuestionService = AdQuestionService.getInstance();


    @Override
    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {

        int pageNum = 1;
        int amount =5;

        System.out.println("amount = " + amount);
        System.out.println("pageNum = " + pageNum);

        if (request.getParameter("pageNum") != null && request.getParameter("amount") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
            amount = Integer.parseInt(request.getParameter("amount"));
        }

        List<MemberQuestionBoard> list = adQuestionService.getList(pageNum, amount);
        int total = adQuestionService.getTotal();

        System.out.println("total = " + total);


        Page page = new Page(pageNum, amount, total);

        request.setAttribute("page", page);
        request.setAttribute("list", list);

        System.out.println("page = " + page);
        System.out.println("list = " + list);


        String viewPath = "/views/manager/admember/questions.jsp";

        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);

        dispatcher.forward(request,  response);


    }
}
