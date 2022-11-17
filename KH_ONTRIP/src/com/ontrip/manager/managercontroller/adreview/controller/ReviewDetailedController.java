package com.ontrip.manager.managercontroller.adreview.controller;

import com.ontrip.manager.managercontroller.adreview.ReviewFrontController;
import com.ontrip.manager.service.AdReviewService;
import com.ontrip.review.vo.ReviewDetailedBoard;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class ReviewDetailedController implements ReviewFrontController {


    AdReviewService adReviewService = AdReviewService.getInstance();


    @Override
    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {

        String revCode1 = request.getParameter("revCode");

        int revCode = Integer.parseInt(revCode1);

        System.out.println("revCode = " + revCode);

        String categoryCode = request.getParameter("categoryCode");

        System.out.println("categoryCode = " + categoryCode);

        ReviewDetailedBoard review = adReviewService.getReview(revCode);

        request.setAttribute("revCode" , revCode);

        request.setAttribute("review", review);

        request.setAttribute("categoryCode" , categoryCode);

        System.out.println("review = " + review);



        String viewPath = "/views/manager/adReview/reviewDetailed.jsp";

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(viewPath);

        requestDispatcher.forward(request, response);

    }
}
