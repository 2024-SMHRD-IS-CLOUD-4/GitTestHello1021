package com.smhrd.controller;

import java.io.IOException;

import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MavenMemer;
import com.smhrd.model.MemberDAO;

@WebServlet("/JoinController2")
public class JoinController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private UUID uuid;
	
	@Override
    public void init() throws ServletException {
        // Servlet 초기화 시 UUID 생성
        uuid = UUID.randomUUID();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UUID uuid = UUID.randomUUID();
		// 로그인 요청 처리
		// 1. post 방식으로 처리 -> 파라미터를 받기 전에 한글 인코딩
		request.setCharacterEncoding("UTF-8");

		// 2. 데이터 꺼내오기 -> 데이터베이스에 전달
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		String uid = "USER-" + uuid.toString();

		// 데이터베이스에 접근해서 데이터 요청하기(join/insert문 요청)
		// mybatis 사용 -> 저장하려는 데이터를 하나로 묶어서 전달!

		// 3가지 방법
		// DAO, @annotation, Mapper Interface

		MavenMemer joinMember = new MavenMemer(id, pw, nick, tel, email, uid);

		// 기능을 가지고 있는 DAO 객체를 생성
		MemberDAO dao = new MemberDAO();

		int result = dao.join(joinMember);

		// 결과를 처리

//		System.out.println(result);

		if (result > 0) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("MainPage.html");
			dispatcher.forward(request, response);
			System.out.print("성공");
//			response.sendRedirect("join.html");
		} else {
			response.sendRedirect("");
			System.out.print("실패");
		}
//			response.sendRedirect("join.html");}
	}
	

}
