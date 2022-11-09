package com.ontrip.manager.managercontroller.adreview;


import com.ontrip.manager.managercontroller.adreview.controller.AdReviewController;
import com.ontrip.manager.managercontroller.adreview.controller.AdReviewDeleteController;
import com.ontrip.manager.managercontroller.adreview.controller.AdReviewListController;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;


@WebServlet(name = "AdReviewFrontController" , urlPatterns = "/manager/reviews/*")
public class AdReviewFrontController extends HttpServlet {

    private Map<String, ReviewFrontController> controllerMap = new HashMap<>();

    public AdReviewFrontController() {

        controllerMap.put("/manager/reviews", new AdReviewListController());
        controllerMap.put("/manager/reviews/review", new AdReviewController());
        controllerMap.put("/manager/reviews/review/delete", new AdReviewDeleteController());

    }

    public void service(HttpServletRequest request, HttpServletResponse response) {

        String requestURI = request.getRequestURI();

        if (requestURI == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        ReviewFrontController reviewFrontController = controllerMap.get(requestURI);

        reviewFrontController.service(request, response);


    }



}
