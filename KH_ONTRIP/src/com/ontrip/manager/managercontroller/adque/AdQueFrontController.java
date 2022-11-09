package com.ontrip.manager.managercontroller.adque;



import com.ontrip.manager.managercontroller.adque.controller.AdAnsController;
import com.ontrip.manager.managercontroller.adque.controller.AdAnsFormController;
import com.ontrip.manager.managercontroller.adque.controller.AdQueController;
import com.ontrip.manager.managercontroller.adque.controller.AdQueListController;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "AdQueFrontController" , urlPatterns = "/manager/questions/*")
public class AdQueFrontController {

    public Map<String, QueFrontController> controllerMap = new HashMap<>();

    public AdQueFrontController() {

        controllerMap.put("/manager/questions/", new AdQueListController());
        controllerMap.put("/manager/questions/question", new AdQueController());
        controllerMap.put("/manager/questions/answerform", new AdAnsFormController());
        controllerMap.put("/manager/questions/answerform/answer", new AdAnsController());

    }

    public void service(HttpServletRequest request, HttpServletResponse response) {

        String requestURI = request.getRequestURI();

        if (requestURI == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        QueFrontController queFrontController = controllerMap.get(requestURI);

        queFrontController.service(request, response);

    }



}
