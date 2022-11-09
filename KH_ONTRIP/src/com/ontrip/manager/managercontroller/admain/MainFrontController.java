package com.ontrip.manager.managercontroller.admain;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public interface MainFrontController {
    void process(HttpServletRequest request, HttpServletResponse response) throws IOException , ServletException;
}
