package com.ontrip.manager.managercontroller.adque.controller;


import com.ontrip.manager.managercontroller.adque.QueFrontController;
import com.ontrip.manager.service.AdQuestionService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdAnsController implements QueFrontController {

    AdQuestionService adQuestionService = AdQuestionService.getInstance();
    @Override
    public void process(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException {
        String aContent = request.getParameter("aContent");
        String qCode = request.getParameter("qCode");
        int i = Integer.parseInt(qCode);

        System.out.println("i = " + i);
        System.out.println("aContent = " + aContent);

        adQuestionService.insertAnswer(aContent, i);
//
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print("<script>alert('수정완료'); location.href = '/KH_ONTRIP/manager/questions/question?qCode="+i+"'</script>");

    }
}
