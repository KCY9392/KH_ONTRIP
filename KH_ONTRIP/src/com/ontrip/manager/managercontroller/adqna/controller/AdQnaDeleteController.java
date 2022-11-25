package com.ontrip.manager.managercontroller.adqna.controller;


import com.ontrip.manager.managercontroller.adqna.QnaFrontController;
import com.ontrip.manager.service.AdQnaService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class AdQnaDeleteController implements QnaFrontController {


    AdQnaService adQnaService = AdQnaService.getInstance();

    @Override
    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {


        String qaCode1 = request.getParameter("qaCode");
        int qaCode = Integer.parseInt(qaCode1);
        adQnaService.deleteQna(qaCode);
        
        
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print("<script>alert('삭제완료'); location.href = '/KH_ONTRIP/manager/qnas'</script>");


    }
}
