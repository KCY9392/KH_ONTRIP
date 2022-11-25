package com.ontrip.manager.managercontroller.que.controller;

import com.ontrip.manager.managercontroller.que.QuFrontController;
import com.ontrip.member.model.vo.Member;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class MemberQueFormController implements QuFrontController {



    @Override
    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {

        HttpSession session = request.getSession();
        Member loginUser = (Member) session.getAttribute("loginUser");
        int memNo = loginUser.getMemberNo();
        String memName = loginUser.getMemberName();

        request.setAttribute("memNo", memNo);
        request.setAttribute("memName", memName);


        String viewPath = "/views/question/memberQueForm2.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(viewPath);
        requestDispatcher.forward(request, response);
    }
}
