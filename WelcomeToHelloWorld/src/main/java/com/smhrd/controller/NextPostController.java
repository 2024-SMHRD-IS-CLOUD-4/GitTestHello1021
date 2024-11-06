package com.smhrd.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.OutputStream;

import com.google.gson.JsonObject;
import com.smhrd.model.NextPostDAO;
import com.smhrd.model.PostImage;

@WebServlet("/NextPostController")
public class NextPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String file_folder = "\\\\DESKTOP-TIB5NGS\\storage\\";

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		NextPostDAO dao = new NextPostDAO();
		List<PostImage> image = dao.NextPost();

		String file_ext = image.get(0).getFile_ext();
		String file_rname = image.get(0).getFile_rname();

		File imageFile = new File(file_folder + file_rname);
		System.out.println(file_ext + "/" + file_rname + "/" + imageFile);

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		JsonObject jsonResponse = new JsonObject();

		if (imageFile.exists() && !imageFile.isDirectory()) {
			// MIME 타입 설정 및 Base64 인코딩
			String contentType = Files.probeContentType(imageFile.toPath());
			String base64Image = encodeFileToBase64(imageFile);

			jsonResponse.addProperty("contentType", contentType);
			jsonResponse.addProperty("base64Image", base64Image);
		} else {
			jsonResponse.addProperty("error", "Image not found");
		}

		response.getWriter().write(jsonResponse.toString());
	}

	private String encodeFileToBase64(File file) throws IOException {
		try (FileInputStream fis = new FileInputStream(file)) {
			byte[] bytes = fis.readAllBytes();
			return Base64.getEncoder().encodeToString(bytes);
		}

//		// 파일이 존재하고 디렉토리가 아닐 경우 전송
//		if (imageFile.exists() && !imageFile.isDirectory()) {
//			// MIME 타입 설정
//			String contentType = Files.probeContentType(imageFile.toPath());
//			if (contentType == null) {
//				contentType = "application/octet-stream";
//			}
//			response.setContentType("text/html;charset=UTF-8");
//
//			// 이미지 파일을 Base64로 인코딩
//			String base64Image = encodeFileToBase64(imageFile);
//			request.setAttribute("base64Image", base64Image);
//			request.setAttribute("contentType", contentType);
//
//			// JSP로 포워딩
//			request.getRequestDispatcher("Mainpage_hw.jsp").forward(request, response);
//		} else {
//			response.sendError(HttpServletResponse.SC_NOT_FOUND);
//		}
//	}
//
//	private String encodeFileToBase64(File file) throws IOException {
//		try (FileInputStream fis = new FileInputStream(file)) {
//			byte[] bytes = fis.readAllBytes();
//			return Base64.getEncoder().encodeToString(bytes);
//		}

	}

}
