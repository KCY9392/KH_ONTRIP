package com.ontrip.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ontrip.hash.service.HashService;
import com.ontrip.hash.vo.Hash;

//로그인 성공후, 시작하기 버튼을 누를경우, mainForm으로 이동시키는 컨트롤러
@WebServlet("/start.me")
public class StartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public StartController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Hash> hash = new HashService().selectHash();
		
		request.setAttribute("hash", hash);
		System.out.println(hash);
		
		String hashTag = "";
		for(int i=0; i< hash.size(); i++) {
			hashTag +="#"+hash.get(i).getHashName()+( i != hash.size()-1 ?  ", " : "");
		}
		
		System.out.println(hashTag);
		request.setAttribute("hashTag", hashTag);
		
		request.getRequestDispatcher("views/common/mainForm.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
