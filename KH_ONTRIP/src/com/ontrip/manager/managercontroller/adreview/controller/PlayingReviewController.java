package com.ontrip.manager.managercontroller.adreview.controller;

import com.ontrip.manager.managercontroller.adreview.ReviewFrontController;
import com.ontrip.manager.service.AdReviewService;
import com.ontrip.manager.vo.Page;
import com.ontrip.review.vo.ReviewBoard;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class PlayingReviewController  implements ReviewFrontController {

    AdReviewService adReviewService = AdReviewService.getInstance();

    @Override
    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {


        int amount = 5;
        int pageNum = 1;

        String category = request.getParameter("category");

        System.out.println("category = " + category);
        System.out.println("amount = " + amount);
        System.out.println("pageNum = " + pageNum);

        if (request.getParameter("pageNum") != null && request.getParameter("amount") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
            amount = Integer.parseInt(request.getParameter("amount"));
        }

        int total = adReviewService.getTotal();

        Page page = new Page(pageNum, amount, total);

        ArrayList<ReviewBoard> list = adReviewService.getList(category, pageNum, amount);

        System.out.println("list = " + list);

        request.setAttribute("page", page);
        request.setAttribute("list", list);
        request.setAttribute("category", category);

        String viewPath = "/views/manager/adReview/playingReview.jsp";

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(viewPath);

        requestDispatcher.forward(request, response);


    }
}
