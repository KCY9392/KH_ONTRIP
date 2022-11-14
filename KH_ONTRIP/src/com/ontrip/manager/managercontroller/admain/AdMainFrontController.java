package com.ontrip.manager.managercontroller.admain;


import com.ontrip.manager.managercontroller.admain.controller.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


@WebServlet(name = "adMainFrontController", urlPatterns = "/manager/main/*")
public class AdMainFrontController extends HttpServlet {

    private Map<String, MainFrontController> controllerMap = new HashMap<>();

    public AdMainFrontController() {

        controllerMap.put("/KH_ONTRIP/manager/main", new AdMainListController());
        controllerMap.put("/KH_ONTRIP/manager/main/saveform", new AdMainSaveFormController());
        controllerMap.put("/KH_ONTRIP/manager/main/save", new AdMainSaveController());
        controllerMap.put("/KH_ONTRIP/manager/main/place", new AdPlaceController());
        controllerMap.put("/KH_ONTRIP/manager/main/place/updateform", new AdMainUpdateFormController());
        controllerMap.put("/KH_ONTRIP/manager/main/place/update", new AdMainUpdateController());
        controllerMap.put("/KH_ONTRIP/manager/main/place/delete", new AdMainDeleteController());

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }
    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //get이든 post든 어떤 방식으로 요청으로 들어오든 로직은 여기에 작성.

        System.out.println("Main´FrontController.service");

        String requestURI = request.getRequestURI();

        System.out.println("requestURI = " + requestURI);

        MainFrontController mainFrontController = controllerMap.get(requestURI);

        if (mainFrontController == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        mainFrontController.process(request, response);
    }
}
