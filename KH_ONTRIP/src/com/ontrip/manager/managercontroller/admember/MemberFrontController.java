package com.ontrip.manager.managercontroller.admember;

import com.ontrip.manager.MyView;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public interface MemberFrontController {

    public MyView process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException;


}
