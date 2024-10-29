package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MavenMemer;
import com.smhrd.model.MemberDAO;

@WebServlet("/loginSuccess")
public class loginSuccess extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		
		// 데이터베이스에 접근하기 전에 mybatis -> 데이터를 하나로 묶어주기!
		MavenMemer joinMember = new MavenMemer(id, pw);
		
		// 로그인 기능을 실행 -> dao
		MemberDAO dao = new MemberDAO();

		MavenMemer result = dao.login(joinMember);

//		String name = result.getId();
		
		if(result == null) {
			response.sendRedirect("login.html");
		}else {
			System.out.println(result.getNickname());
			// 세션에다가 회원정보를 저장하고, index.jsp로 사용자를 보내주기
			HttpSession session = request.getSession();
			session.setAttribute("member", result);
			response.sendRedirect("index.jsp");
		}
		
		
		response.setContentType("text/html; charset = UTF-8");
		PrintWriter out = response.getWriter();

//		out.print(name + "환영합니다.");
	}

}
