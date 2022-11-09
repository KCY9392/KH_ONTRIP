package com.ontrip.manager.managercontroller.admember;


import com.ontrip.manager.managercontroller.admember.controller.AdMemberController;
import com.ontrip.manager.managercontroller.admember.controller.AdMemberDeleteController;
import com.ontrip.manager.managercontroller.admember.controller.AdMemberListController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


@WebServlet(name = "AdMemberFrontController" , urlPatterns = "/manager/members/*")
public class AdMemberFrontController extends HttpServlet {


    public Map<String, MemberFrontController> controllerMap = new HashMap<>();


    public AdMemberFrontController() {
        controllerMap.put("/manager/members/", new AdMemberListController());
        controllerMap.put("/manager/members/member", new AdMemberController());
        controllerMap.put("manager/members/member/delete",
                new AdMemberDeleteController());
    }


    public void process(HttpServletRequest request , HttpServletResponse response) throws IOException , ServletException {
        System.out.println("MemberFrontController.service");

        String requestURI = request.getRequestURI();

        MemberFrontController memberFrontController = controllerMap.get(requestURI);

        if (memberFrontController == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        memberFrontController.service(request, response);

    }



}
