package com.ontrip.manager.managercontroller.que.controller;

import com.ontrip.manager.managercontroller.que.QuFrontController;
import com.ontrip.manager.managercontroller.que.service.MemberQueService;
import com.ontrip.member.model.vo.Member;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class MemberUpdateQueController implements QuFrontController {

    MemberQueService memberQueService = MemberQueService.getInstance();

    @Override
    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {

        String qCode1 = request.getParameter("qCode");
        int qCode = Integer.parseInt(qCode1);

        String qTitle = request.getParameter("qTitle");
        String qContent = request.getParameter("qContent");


        memberQueService.updateQuestion(qTitle, qContent, qCode);


        HttpSession session = request.getSession();
        Member loginUser = (Member) session.getAttribute("loginUser");
        int memNo = loginUser.getMemberNo();


        response.sendRedirect("/KH_ONTRIP/question/queDetailed?qCode="+qCode+"&memNo="+memNo);


    }
}
