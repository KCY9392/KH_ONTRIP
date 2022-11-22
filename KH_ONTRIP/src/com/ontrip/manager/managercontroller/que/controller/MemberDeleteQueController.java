package com.ontrip.manager.managercontroller.que.controller;

import com.ontrip.manager.managercontroller.que.QuFrontController;
import com.ontrip.manager.managercontroller.que.service.MemberQueService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class MemberDeleteQueController implements QuFrontController {

    MemberQueService memberQueService = MemberQueService.getInstance();

    @Override
    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        String qCode1 = request.getParameter("qCode");
        int qCode = Integer.parseInt(qCode1);
        memberQueService.deleteMember(qCode);


        response.sendRedirect("/KH_ONTRIP/question/questions");
    }
}
