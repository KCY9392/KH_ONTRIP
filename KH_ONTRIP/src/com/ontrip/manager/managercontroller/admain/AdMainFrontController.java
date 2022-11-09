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

        controllerMap.put("/manager/main/", new AdMainListController());
        controllerMap.put("/manager/main/saveform", new AdMainSaveFormController());
        controllerMap.put("/manager/main/save", new AdMainSaveController());
        controllerMap.put("/manager/main/place", new AdPlaceController());
        controllerMap.put("manager/main/place/updateform", new AdMainUpdateFormController());
        controllerMap.put("manager/main/place/update", new AdMainUpdateController());
        controllerMap.put("manager/main/place/delete", new AdMainDeleteController());

    }

    @Override
    public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("MainFrontController.service");

        String requestURI = request.getRequestURI();

        MainFrontController mainFrontController = controllerMap.get(requestURI);

        if (mainFrontController == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        mainFrontController.process(request, response);

    }
}
