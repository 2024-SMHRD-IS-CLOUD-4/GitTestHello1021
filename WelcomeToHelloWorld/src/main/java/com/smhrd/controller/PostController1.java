package com.smhrd.controller;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.smhrd.model.ImageDAO;
import com.smhrd.model.PostImage;

@MultipartConfig
@WebServlet("/PostController1")
public class PostController1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String file_folder = "\\\\DESKTOP-TIB5NGS\\storage";
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");


		Part filePart = request.getPart("imageUpload");
//		System.out.println(filePart);
		
		String file_name = filePart.getSubmittedFileName();
		String file_basename = file_name.substring(0, file_name.lastIndexOf('.'));
        
		String file_ext = file_name.substring(file_name.lastIndexOf('.'));
        long file_size = filePart.getSize();
        String file_rname = file_basename + "_" + System.nanoTime() + file_ext;
        
        File file = new File(file_folder, file_rname);
        filePart.write(file.getAbsolutePath());
        System.out.println(file_name +"/"+ file_basename +"/"+ file_ext +"/"+ file_rname +"/"+ file_size);
        
        PostImage PI = new PostImage(file_ext, file_size, file_rname);
        ImageDAO dao = new ImageDAO();
        int result = dao.insertImage(PI);
        
        if (result > 0) {
//			RequestDispatcher dispatcher = request.getRequestDispatcher("login.html");
			response.sendRedirect("Mainpage_hw.jsp");
//			dispatcher.forward(request, response);
			System.out.print("성공");
//			response.sendRedirect("join.html");
		} else {
			response.sendRedirect("");
			System.out.print("실패");
		}
		
	}

}
