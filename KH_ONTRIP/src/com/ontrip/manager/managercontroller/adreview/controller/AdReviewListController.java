package com.ontrip.manager.managercontroller.adreview.controller;


import com.ontrip.manager.managercontroller.adreview.ReviewFrontController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AdReviewListController implements ReviewFrontController {


    @Override
    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {


        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain");
        PrintWriter writer = response.getWriter();
        writer.println("adReviewPage");
    }
}
