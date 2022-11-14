package com.ontrip.manager.managercontroller.admember.controller;


import com.ontrip.manager.managercontroller.admember.MemberFrontController;
import com.ontrip.manager.service.AdMemberService;
import com.ontrip.member.model.vo.Member;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class AdMemberListController implements MemberFrontController {

    AdMemberService adMemberService = AdMemberService.getInstance();

    @Override
    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {

        System.out.println("MemberMainPage");

        ArrayList<Member> members = adMemberService.adminMemberList();

        request.setAttribute("members", members);

        String viewPath = "/views/manager/admember/members.jsp";

        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);

        dispatcher.forward(request,  response);


    }
}
