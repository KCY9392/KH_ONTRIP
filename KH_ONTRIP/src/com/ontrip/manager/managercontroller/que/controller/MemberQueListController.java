package com.ontrip.manager.managercontroller.que.controller;

import com.ontrip.manager.managercontroller.que.QuFrontController;
import com.ontrip.manager.managercontroller.que.service.MemberQueService;
import com.ontrip.manager.vo.Page;
import com.ontrip.question.vo.MemberQuestionBoard;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class MemberQueListController implements QuFrontController {


    MemberQueService memberQueService = MemberQueService.getInstance();



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

        List<MemberQuestionBoard> list = memberQueService.getList(pageNum, amount);
        int total = memberQueService.getTotal();



        Page page = new Page(pageNum, amount, total);

        request.setAttribute("page", page);
        request.setAttribute("list", list);



        String viewPath = "/views/question/memberQueList2.jsp";

        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);

        dispatcher.forward(request,  response);

    }
}
