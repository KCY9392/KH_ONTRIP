package com.ontrip.manager.managercontroller.admember;


import com.ontrip.manager.MyView;
import com.ontrip.manager.managercontroller.admember.controller.AdMemberController;
import com.ontrip.manager.managercontroller.admember.controller.AdMemberListController;

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
    관리자 회원관리
 */
@WebServlet(name = "AdMemberFrontController", urlPatterns = "/manager/members/*")
public class AdMemberFrontController extends HttpServlet {


    public Map<String, MemberFrontController> controllerMap = new HashMap<>();


    public AdMemberFrontController() {
        controllerMap.put("/KH_ONTRIP/manager/members", new AdMemberListController());    // 회원리스트jsp uri

        controllerMap.put("/KH_ONTRIP/manager/members/member", new AdMemberController()); // 회원상세페이지jsp uri

    }


    public void process(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException, SQLException {
        System.out.println("MemberFrontController.service");

        String requestURI = request.getRequestURI();

        MemberFrontController memberFrontController = controllerMap.get(requestURI);

        if (memberFrontController == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        memberFrontController.process(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try {
            doProcess(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try {
            doProcess(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException, SQLException {
        //get이든 post든 어떤 방식으로 요청으로 들어오든 로직은 여기에 작성.

        System.out.println("MemberFrontController.service");

        String requestURI = request.getRequestURI();

        System.out.println("requestURI = " + requestURI);

        MemberFrontController memberFrontController = controllerMap.get(requestURI);

        if (memberFrontController == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        MyView myview = memberFrontController.process(request, response);
        myview.render(request, response);


//        memberFrontController.process(request, response);
    }


}
