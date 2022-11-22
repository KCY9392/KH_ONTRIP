package com.ontrip.manager.managercontroller.que.controller;

import com.ontrip.manager.managercontroller.que.QuFrontController;
import com.ontrip.manager.managercontroller.que.service.MemberQueService;
import com.ontrip.member.model.vo.Member;
import com.ontrip.question.vo.MemberQuestionDetailed;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

public class MemberQueDetailedController implements QuFrontController {

    MemberQueService memberQueService = MemberQueService.getInstance();
    @Override
    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {

        HttpSession session = request.getSession();

        Member loginUser = (Member) session.getAttribute("loginUser");

        String memNum1 = request.getParameter("memNo");
        int memNum = Integer.parseInt(memNum1);


        if (loginUser.getMemberNo() != memNum) {
            response.sendRedirect("/KH_ONTRIP/question/questions");
            return;
        }


        String qCode1 = request.getParameter("qCode");
        int qCode = Integer.parseInt(qCode1);
        MemberQuestionDetailed memberQuestionDetailed = memberQueService.getMemberQuestionBoard(qCode);



        boolean isUpdated = false;

        if (memberQuestionDetailed.getaContent() == null) {
            isUpdated = true;
        }


        request.setAttribute("isUpdated", isUpdated);

        request.setAttribute("memberQuestionDetailed", memberQuestionDetailed);

        String viewPath = "/views/manager/memberque/memberQueDetailed2.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(viewPath);
        requestDispatcher.forward(request, response);

    }
}
