package com.ontrip.manager.managercontroller.admember.controller;


import com.ontrip.manager.MyView;
import com.ontrip.manager.managercontroller.admember.MemberFrontController;
import com.ontrip.manager.service.AdMemberService;
import com.ontrip.member.model.vo.Member;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdMemberListController implements MemberFrontController {

    AdMemberService adMemberService = AdMemberService.getInstance();

    @Override
    public MyView process(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException, SQLException {

//        System.out.println("MemberMainPage");

        ArrayList<Member> members = adMemberService.adminMemberList();

        request.setAttribute("members", members);

        return new MyView("/views/manager/admember/members.jsp");

//        String viewPath = "/views/manager/admember/members.jsp";

//        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);
//
//        dispatcher.forward(request, response);


    }
}
