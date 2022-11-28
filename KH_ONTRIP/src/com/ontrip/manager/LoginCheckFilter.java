package com.ontrip.manager;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName = "loginCheckFilter")
public class LoginCheckFilter implements Filter {


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

        System.out.println(" -- filter init() --");


    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse,
        FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest httpRequest = (HttpServletRequest) servletRequest;

        String requestURI = httpRequest.getRequestURI();

        HttpServletResponse httpResponse = (HttpServletResponse) servletResponse;

        try {
            if (!requestURI.equals("/KH_ONTRIP/") && !requestURI.equals("/KH_ONTRIP/login.me")
                    && !requestURI.equals("/KH_ONTRIP/agreeForm.me") 
                    && !requestURI.equals("/KH_ONTRIP/enrollForm.me") && !requestURI.equals("/KH_ONTRIP/insert.me")
                    && !requestURI.equals("/KH_ONTRIP/%EC%8B%9C%ED%80%80%EC%8A%A4%2001.mp4")
                    && !requestURI.equals("/KH_ONTRIP/find.me") 
                    && !requestURI.equals("/KH_ONTRIP/findId.me") 
                    && !requestURI.equals("/KH_ONTRIP/findPwd.me")
                    && !requestURI.equals("/KH_ONTRIP/newPwd.le") 
                    && !requestURI.equals("/KH_ONTRIP/newPwdUpdateCheck.le") 
                    && !requestURI.equals("/KH_ONTRIP/views/common/newPwdUpdate.jsp")
                    && !requestURI.equals("/KH_ONTRIP/logout.me")
                    && !requestURI.equals("/KH_ONTRIP/idCheck.me")) {
                HttpSession session = httpRequest.getSession(false);
                if (session == null || session.getAttribute("loginUser") == null) {
                    System.out.println("미인증사용자: " + requestURI);
                    httpResponse.sendRedirect("/KH_ONTRIP");
                    return;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            System.out.println("인증체크 종료");
        }

        System.out.println(" -- filter doFilter() --");

        filterChain.doFilter(servletRequest, servletResponse);

    }

    @Override
    public void destroy() {

    }
}


