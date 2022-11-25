package com.ontrip.manager.managercontroller.memreservation.controller;

import com.ontrip.manager.managercontroller.memreservation.ResFrontController;
import com.ontrip.manager.managercontroller.memreservation.service.memRevService;
import com.ontrip.manager.vo.Page;
import com.ontrip.member.model.vo.Member;
import com.ontrip.reservation.vo.Reservation;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class ReservationListController implements ResFrontController {

    memRevService memrevService = memRevService.getInstance();


    @Override
    public void process(HttpServletRequest request, HttpServletResponse response)
        throws IOException, ServletException, SQLException {

        HttpSession httpSession = request.getSession();
        Member loginUser = (Member) httpSession.getAttribute("loginUser");
        int memberNo = loginUser.getMemberNo();

        int pageNum = 1;
        int amount = 5;

        System.out.println("amount = " + amount);
        System.out.println("pageNum = " + pageNum);

        if (request.getParameter("pageNum") != null && request.getParameter("amount") != null) {
            pageNum = Integer.parseInt(request.getParameter("pageNum"));
            amount = Integer.parseInt(request.getParameter("amount"));
        }

        List<Reservation> list = memrevService.getRevList(pageNum, amount, memberNo);
        int total = memrevService.getTotal(memberNo);

        System.out.println("total = " + total);

        Page page = new Page(pageNum, amount, total);

        request.setAttribute("page", page);
        request.setAttribute("list", list);

        System.out.println("page = " + page);
        System.out.println("list = " + list);

        String viewPath = "/views/myPage/myPageReservationList.jsp";

        RequestDispatcher dispatcher = request.getRequestDispatcher(viewPath);

        dispatcher.forward(request, response);


    }
}
