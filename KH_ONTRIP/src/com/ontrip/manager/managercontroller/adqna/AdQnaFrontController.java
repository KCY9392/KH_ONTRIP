package com.ontrip.manager.managercontroller.adqna;


import com.ontrip.manager.managercontroller.adqna.controller.AdQnaDeleteController;
import com.ontrip.manager.managercontroller.adqna.controller.AdQnaFormController;
import com.ontrip.manager.managercontroller.adqna.controller.AdQnaListController;
import com.ontrip.manager.managercontroller.adqna.controller.AdQnaSaveController;

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
   관리자 qna
 */

@WebServlet(name = "adQnaFrontController" , urlPatterns = "/manager/qnas/*")
public class AdQnaFrontController extends HttpServlet {

    public Map<String, QnaFrontController> controllerMap = new HashMap<>();

    public AdQnaFrontController() {

        controllerMap.put("/KH_ONTRIP/manager/qnas", new AdQnaListController());     // qna리스트 jsp uri
        controllerMap.put("/KH_ONTRIP/manager/qnas/saveform", new AdQnaFormController()); // qna등록폼 jsp uri
        controllerMap.put("/KH_ONTRIP/manager/qnas/save", new AdQnaSaveController()); // qna저장
        controllerMap.put("/KH_ONTRIP/manager/qnas/delete", new AdQnaDeleteController()); // qna삭제

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

        System.out.println("QnAFrontController.service");

        String requestURI = request.getRequestURI();

        System.out.println("requestURI = " + requestURI);

        QnaFrontController qnaFrontController = controllerMap.get(requestURI);

        if (qnaFrontController == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        qnaFrontController.process(request, response);
    }


}
