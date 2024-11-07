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

import com.google.gson.JsonObject;
import com.smhrd.model.FindNumber;
import com.smhrd.model.FindNumberDAO;
import com.smhrd.model.NextPostDAO;
import com.smhrd.model.PostContent;
import com.smhrd.model.PostImage;


@WebServlet("/NextPreController")
public class NextPreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String file_folder = "\\\\DESKTOP-TIB5NGS\\storage\\";
	private static int file_num = 99999;
	private static int RESET_THRESHOLD = 0; // 임계값 설정
	private static int INITIAL_FILE_NUM = 99999; // 초기화 값

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FindNumberDAO fn = new FindNumberDAO();
		List<FindNumber> findnumer = fn.findnumer();
		int maxf = findnumer.get(0).getMax_file_num();
		int minf = findnumer.get(0).getMin_file_num();
		
		System.out.println(maxf +"/"+ minf);

		NextPostDAO dao = new NextPostDAO();
		List<PostImage> image = dao.NextPost(file_num);

		String file_rname = image.get(0).getFile_rname();
		int post_num = image.get(0).getPost_num();
		
		PostContent cont = dao.NextcPost(post_num);
		String content = cont.getPost_content();

		file_num = image.get(0).getFile_num();// 들어온값 저장

		File imageFile = new File(file_folder + file_rname);
		System.out.println(file_rname + "/" + imageFile + "/" + file_num + "/" + post_num);

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
		
		jsonResponse.addProperty("content", content);

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		response.getWriter().write(jsonResponse.toString());
		RESET_THRESHOLD = minf;
		INITIAL_FILE_NUM = maxf+1;
		if (file_num == RESET_THRESHOLD) {
			file_num = INITIAL_FILE_NUM;
		}

	}

	private String encodeFileToBase64(File file) throws IOException {
		try (FileInputStream fis = new FileInputStream(file)) {
			byte[] bytes = fis.readAllBytes();
			return Base64.getEncoder().encodeToString(bytes);
		}
		

	}

}