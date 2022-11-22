package com.ontrip.manager.managercontroller.qna;

import com.ontrip.manager.managercontroller.qna.controller.MemberQnasListController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "MemberQnaFrontController" , urlPatterns ="/qnas/*" )
public class MemberQnaFrontController extends HttpServlet {

    public Map<String, QnasFrontController> controllerMap = new HashMap<>();

    public MemberQnaFrontController() {

        controllerMap.put("/KH_ONTRIP/qnas", new MemberQnasListController());

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            doProcess(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            doProcess(request,response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        //get이든 post든 어떤 방식으로 요청으로 들어오든 로직은 여기에 작성.

        System.out.println("MemberQnAFrontController.service");

        String requestURI = request.getRequestURI();

        System.out.println("requestURI = " + requestURI);

        QnasFrontController qnasFrontController = controllerMap.get(requestURI);

        if (qnasFrontController == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        qnasFrontController.process(request, response);
    }














}
