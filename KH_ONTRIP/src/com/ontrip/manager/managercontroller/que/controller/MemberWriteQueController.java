package com.ontrip.manager.managercontroller.que.controller;

import com.ontrip.manager.managercontroller.que.QuFrontController;
import com.ontrip.manager.managercontroller.que.service.MemberQueService;
import com.ontrip.question.vo.Question;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberWriteQueController implements QuFrontController {

    MemberQueService memberQueService = MemberQueService.getInstance();


    @Override
    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {


        String memName = request.getParameter("memName");
        String memNo1 = request.getParameter("memNo");
        int memNo = Integer.parseInt(memNo1);
        String qTitle = request.getParameter("qTitle");
        String qContent = request.getParameter("qContent");



        Question question = new Question(null, memNo, qTitle, qContent, null, null, null, null);
        
        System.out.println(question);



        memberQueService.getWrite(question);


        response.sendRedirect("/KH_ONTRIP/question/questions");




    }
}
