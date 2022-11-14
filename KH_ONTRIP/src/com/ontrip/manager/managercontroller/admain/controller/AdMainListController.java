package com.ontrip.manager.managercontroller.admain.controller;


import com.ontrip.manager.managercontroller.admain.MainFrontController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class AdMainListController implements MainFrontController {
    @Override
    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        System.out.println("AdmainListController.service");

        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/plain");
        PrintWriter writer = response.getWriter();
        writer.println("adMainPage");

    }



}
