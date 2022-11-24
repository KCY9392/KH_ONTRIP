package com.ontrip.manager.managercontroller.admember.controller;


import com.ontrip.manager.MyView;
import com.ontrip.manager.managercontroller.admember.MemberFrontController;
import com.ontrip.manager.service.AdMemberService;
import com.ontrip.member.model.vo.Member;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AdMemberController implements MemberFrontController {


    AdMemberService adMemberService = AdMemberService.getInstance();

    @Override
    public MyView process(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException, SQLException {

        String memberId = request.getParameter("memberNo");

        int i = Integer.parseInt(memberId);

        System.out.println("memberId = " + memberId);

        Member member = adMemberService.adminMemberDetails(i);

        request.setAttribute("member", member);

        return new MyView("/views/manager/admember/memberDetailed.jsp");

//        String viewPath = "/views/manager/admember/memberDetailed.jsp";
//
//        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);
//
//        dispatcher.forward(request, response);


    }
}
