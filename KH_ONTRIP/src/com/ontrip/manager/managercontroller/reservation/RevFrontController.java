package com.ontrip.manager.managercontroller.reservation;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;

public interface RevFrontController {

    void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, ParseException, SQLException;

}
