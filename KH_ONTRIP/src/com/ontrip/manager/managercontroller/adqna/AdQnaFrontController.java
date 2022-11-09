package com.ontrip.manager.managercontroller.adqna;



import com.ontrip.manager.managercontroller.adqna.controller.AdQnaDeleteController;
import com.ontrip.manager.managercontroller.adqna.controller.AdQnaFormController;
import com.ontrip.manager.managercontroller.adqna.controller.AdQnaListController;
import com.ontrip.manager.managercontroller.adqna.controller.AdQnaSaveController;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;


@WebServlet(name = "AdQnaFrontController" , urlPatterns = "/manager/qnas/*")
public class AdQnaFrontController {

    public Map<String, QnaFrontController> controllerMap = new HashMap<>();

    public AdQnaFrontController() {

        controllerMap.put("/manager/qnas/", new AdQnaListController());
        controllerMap.put("/manager/qnas/saveform", new AdQnaFormController());
        controllerMap.put("/manager/qnas/save", new AdQnaSaveController());
        controllerMap.put("/manager/qnas/delete", new AdQnaDeleteController());

    }

    public void service(HttpServletRequest request, HttpServletResponse response) {

        String requestURI = request.getRequestURI();

        if (requestURI == null) {
            response.setStatus(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        QnaFrontController qnaFrontController = controllerMap.get(requestURI);

        qnaFrontController.service(request, response);

    }


}
