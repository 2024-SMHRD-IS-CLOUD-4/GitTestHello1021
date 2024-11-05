package com.smhrd.controller;

import java.io.IOException;
import java.util.Random;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MavenMemer;
import com.smhrd.model.MemberDAO;

@WebServlet("/notLoginController1")
public class notLoginController1 extends HttpServlet {
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
		Random random = new Random();

		int min = 100000; // 최소값
		int max = 999999; // 최대값
		int randomNumber = random.nextInt(max - min + 1) + min; // 50~150

		request.setCharacterEncoding("UTF-8");

		String u_id = "UnUser-" + uuid.toString();
		String u_pw = "UnUser-" + randomNumber + uuid.toString().substring(3, 7);
		String u_nick = "User-" + uuid.toString().substring(0, 5);
		String u_tel = "UnUser";
		String u_email = "UnUser";
		String u_type = "UnUser-" + uuid.toString();

		MavenMemer joinMember = new MavenMemer(u_id, u_pw, u_nick, u_tel, u_email, u_type);

		MemberDAO dao = new MemberDAO();

		int result = dao.join(joinMember);


		if (result > 0) {
			MavenMemer loginMember = new MavenMemer(u_id, u_pw);
			MavenMemer result2 = dao.login(loginMember);
			System.out.println(u_id);
			
			System.out.println(u_pw);
			System.out.println(result2);
			if(result2 == null) {
				System.out.print("실패");
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("login_user", result2);
				response.sendRedirect("Mainpage_hw.jsp");
				System.out.println(session);
			}
		} else {
			response.sendRedirect("");
			System.out.print("실패");
		}
//			response.sendRedirect("join.html");}
	}

}
