package com.ontrip.manager.managercontroller.adreview.controller;


import com.ontrip.manager.managercontroller.adreview.ReviewFrontController;
import com.ontrip.manager.service.AdReviewService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class AdReviewDeleteController implements ReviewFrontController {


    AdReviewService adReviewService = AdReviewService.getInstance();

    @Override
    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
        String categoryCode = request.getParameter("categoryCode");
        System.out.println("categoryCode = " + categoryCode);
        String revCode1 = request.getParameter("revCode");
        int revCode = Integer.parseInt(revCode1);

        System.out.println("revCode = " + revCode);
        System.out.println("categoryCode = " + categoryCode);



        adReviewService.deleteReview(revCode);

        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().print("<script>alert('삭제완료'); location.href = '/KH_ONTRIP/manager/reviews/play?category="+categoryCode+"'</script>");

    }
}
