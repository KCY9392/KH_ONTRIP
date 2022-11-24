package com.ontrip.manager.managercontroller.que;


import com.ontrip.manager.managercontroller.que.controller.*;

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
  사용자 문의사항
 */
@WebServlet(name = "MemberQueFrontController" , urlPatterns = "/question/*")
public class MemberQueFrontController extends HttpServlet {


    public Map<String, QuFrontController> controllerMap = new HashMap<>();

    public MemberQueFrontController() {
        controllerMap.put("/KH_ONTRIP/question/questions", new MemberQueListController()); // 문의사항 리스트
        controllerMap.put("/KH_ONTRIP/question/queDetailed", new MemberQueDetailedController()); // 문의사항 상세
        controllerMap.put("/KH_ONTRIP/question/queUpdateForm", new MemberQueUpdateFormController()); // 문의사항 업데이트폼
        controllerMap.put("/KH_ONTRIP/question/queUpdate", new MemberUpdateQueController()); // 문의사항 업데이트
        controllerMap.put("/KH_ONTRIP/question/queDelete", new MemberDeleteQueController()); // 문의사항 삭제
        controllerMap.put("/KH_ONTRIP/question/write", new MemberWriteQueController()); // 문의사항 등록
        controllerMap.put("/KH_ONTRIP/question/form", new MemberQueFormController()); // 문의사항 등록폼
    }



    public void service(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        String requestURI = request.getRequestURI();

        if (requestURI == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        QuFrontController quFrontController = controllerMap.get(requestURI);

        try {
            quFrontController.process(request, response);
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

        System.out.println("MemberQueFrontController.service");

        String requestURI = request.getRequestURI();

        System.out.println("requestURI = " + requestURI);

        QuFrontController quFrontController = controllerMap.get(requestURI);

        if (quFrontController == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        quFrontController.process(request, response);
    }



}
