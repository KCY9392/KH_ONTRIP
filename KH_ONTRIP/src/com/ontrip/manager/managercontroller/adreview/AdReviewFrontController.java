package com.ontrip.manager.managercontroller.adreview;


import com.ontrip.manager.managercontroller.adque.QueFrontController;
import com.ontrip.manager.managercontroller.adreview.controller.AdReviewController;
import com.ontrip.manager.managercontroller.adreview.controller.AdReviewDeleteController;
import com.ontrip.manager.managercontroller.adreview.controller.AdReviewListController;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;


@WebServlet(name = "AdReviewFrontController" , urlPatterns = "/manager/reviews/*")
public class AdReviewFrontController extends HttpServlet {

    private Map<String, ReviewFrontController> controllerMap = new HashMap<>();

    public AdReviewFrontController() {

        controllerMap.put("/KH_ONTRIP/manager/reviews", new AdReviewListController());
        controllerMap.put("/KH_ONTRIP/manager/reviews/review", new AdReviewController());
        controllerMap.put("/KH_ONTRIP/manager/reviews/review/delete", new AdReviewDeleteController());

    }

    public void service(HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException {

        String requestURI = request.getRequestURI();

        if (requestURI == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        ReviewFrontController reviewFrontController = controllerMap.get(requestURI);

        reviewFrontController.process(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            doProcess(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            doProcess(request, response);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        //get이든 post든 어떤 방식으로 요청으로 들어오든 로직은 여기에 작성.

        System.out.println("ReviewFrontController.service");

        String requestURI = request.getRequestURI();

        System.out.println("requestURI = " + requestURI);

        ReviewFrontController reviewFrontController = controllerMap.get(requestURI);

        if (reviewFrontController == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        reviewFrontController.process(request, response);
    }





}
