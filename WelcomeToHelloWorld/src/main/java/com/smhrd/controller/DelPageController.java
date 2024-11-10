package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.DelPageDAO;

@WebServlet("/DelPageController")
public class DelPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String file_rname = request.getParameter("name");
		System.out.println("file_rname : " +file_rname );
		System.out.println("DelPageController");
		if (file_rname != null) {
			DelPageDAO dao = new DelPageDAO();
			int result = dao.DeleteImage(file_rname);
			if (result > 0) {
				System.out.println("이미지 삭제 성공");
				response.sendRedirect("My_post.jsp");
			} else {
				System.out.println("이미지 삭제 실패");
			}
		} else {
			System.out.println("이미지 삭제 실패");
		}
	}

}
