package com.ontrip.manager.managercontroller.qna.controller;

import com.ontrip.manager.managercontroller.qna.QnasFrontController;
import com.ontrip.manager.service.AdQnaService;
import com.ontrip.qna.vo.Qna;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberQnasListController implements QnasFrontController {

    AdQnaService adQnaService = AdQnaService.getInstance();

    @Override
    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {


        ArrayList<Qna> qnaForAccommodation = adQnaService.selectByCategory("숙소");
        ArrayList<Qna> qnaForUsing = adQnaService.selectByCategory("기능");
        ArrayList<Qna> qnaForAccount = adQnaService.selectByCategory("계정");


        request.setAttribute("qnaForAccommodation", qnaForAccommodation);
        request.setAttribute("qnaForUsing", qnaForUsing);
        request.setAttribute("qnaForAccount", qnaForAccount);

        String viewPath = "/views/Q&A/memberQnas.jsp";

        RequestDispatcher requestDispatcher = request.getRequestDispatcher(viewPath);
        requestDispatcher.forward(request, response);



    }
}
