package com.ontrip.manager.managercontroller.adque;


import com.ontrip.manager.managercontroller.adque.controller.AdAnsController;
import com.ontrip.manager.managercontroller.adque.controller.AdAnsFormController;
import com.ontrip.manager.managercontroller.adque.controller.AdQueController;
import com.ontrip.manager.managercontroller.adque.controller.AdQueListController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/*
    관리자 문의사항
 */
@WebServlet(name = "AdQueFrontController" , urlPatterns = "/manager/questions/*")
public class AdQueFrontController extends HttpServlet {

    public Map<String, QueFrontController> controllerMap = new HashMap<>();

    public AdQueFrontController() {

        controllerMap.put("/KH_ONTRIP/manager/questions", new AdQueListController());   // 문의사항 리스트 jsp
        controllerMap.put("/KH_ONTRIP/manager/questions/question", new AdQueController()); // 문의사항 상세 jsp
        controllerMap.put("/KH_ONTRIP/manager/questions/answerform", new AdAnsFormController()); // 문의사항 답변폼 jsp
        controllerMap.put("/KH_ONTRIP/manager/questions/answerform/answer", new AdAnsController()); // 문의사항 답변 controller

    }

    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String requestURI = request.getRequestURI();

        if (requestURI == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        QueFrontController queFrontController = controllerMap.get(requestURI);

        try {
            queFrontController.process(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

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
            doProcess(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        //get이든 post든 어떤 방식으로 요청으로 들어오든 로직은 여기에 작성.

        System.out.println("QuestionFrontController.service");

        String requestURI = request.getRequestURI();

        System.out.println("requestURI = " + requestURI);

        QueFrontController queFrontController = controllerMap.get(requestURI);

        if (queFrontController == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        queFrontController.process(request, response);
    }



}
