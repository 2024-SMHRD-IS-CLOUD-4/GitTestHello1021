package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import oracle.net.ns.SessionAtts;


@WebServlet("/logoutController")
public class logoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그아웃
		// HttpSession (세션 Scope)에 저장되어있는 "member"
		
		HttpSession session = request.getSession();
		//세션 안에 모든 값을 삭제
		//session.invalidate();
		session.removeAttribute("member");
		
		//다시 index페이지로 이동
		response.sendRedirect("index.jsp");
	}

}
