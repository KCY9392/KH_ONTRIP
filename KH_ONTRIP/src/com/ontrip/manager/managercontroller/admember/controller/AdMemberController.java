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

public class AdMemberController implements MemberFrontController {


    AdMemberService adMemberService = AdMemberService.getInstance();

    @Override
    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {

        String memberId = request.getParameter("memberNo");

        int i = Integer.parseInt(memberId);

        System.out.println("memberId = " + memberId);

        Member member = adMemberService.adminMemberDetails(i);

        request.setAttribute("member", member);

        String viewPath = "/views/manager/admember/memberDetailed.jsp";

        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);

        dispatcher.forward(request,  response);


    }
}
