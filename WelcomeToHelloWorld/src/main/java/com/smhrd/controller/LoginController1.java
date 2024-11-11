package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MavenMemer;
import com.smhrd.model.MemberDAO;


@WebServlet("/LoginController1")
public class LoginController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String u_id = request.getParameter("u_id");
		String u_pw = request.getParameter("u_pw");
		
		MavenMemer loginMember = new MavenMemer(u_id, u_pw);
		
		MemberDAO dao = new MemberDAO();
		MavenMemer result = dao.login(loginMember);
		System.out.println(u_id);
		
		System.out.println(u_pw);
		System.out.println(result);

		if(result == null) {
			if(result == null) {
			    response.sendRedirect("Login.html?error=invalid");
			    System.out.print("실패");
			}
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("login_user", result);
			response.sendRedirect("Mainpage_hw.jsp");
			System.out.println(session);
		}

	}

}
