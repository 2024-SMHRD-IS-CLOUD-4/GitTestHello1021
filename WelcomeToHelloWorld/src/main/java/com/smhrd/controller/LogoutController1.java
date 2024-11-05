package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutController1")
public class LogoutController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		System.out.println(session);
		session.removeAttribute("login_user");
		response.sendRedirect("Login.html");
		Object user = session.getAttribute("login_user");
		if (user == null) {
		    System.out.println("login_user 속성이 삭제되었습니다.");
		} else {
		    System.out.println("login_user 속성이 여전히 존재합니다.");
		}
		System.out.println("현재 세션 정보: " + session.getAttribute("login_user"));

	}

}
