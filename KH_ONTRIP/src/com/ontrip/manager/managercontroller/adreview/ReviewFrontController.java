package com.ontrip.manager.managercontroller.adreview;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public interface ReviewFrontController {

    public void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException;

}
