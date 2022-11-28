package com.ontrip.manager.managercontroller.adqna.controller;


import com.ontrip.manager.managercontroller.adqna.QnaFrontController;
import com.ontrip.manager.service.AdQnaService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class AdQnaSaveController implements QnaFrontController {

    AdQnaService adQnaService = AdQnaService.getInstance();

    @Override
    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        String category = request.getParameter("category");
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");


//        System.out.println("answer = " + answer);
//        System.out.println("question = " + question);
//        System.out.println("category = " + category);


        adQnaService.saveQna(question, answer, category);

        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print("<script>alert('등록완료'); location.href = '/KH_ONTRIP/manager/qnas'</script>");
    }
}
