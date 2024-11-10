package com.smhrd.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Base64;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.smhrd.model.FindContentDAO;
import com.smhrd.model.MavenMemer;
import com.smhrd.model.My_post_img_DAO;
import com.smhrd.model.PostImage;

@MultipartConfig
@WebServlet("/My_post_img_Controller")
public class My_post_img_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String file_folder = "\\\\DESKTOP-TIB5NGS\\storage\\";

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("application/json; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		request.setCharacterEncoding("UTF-8");

		HttpSession session = request.getSession();

		MavenMemer login_user = (MavenMemer) session.getAttribute("login_user");
		String u_id = login_user.getU_id();
		System.out.println("유아디는 : " + u_id);
		My_post_img_DAO dao = new My_post_img_DAO();
		JsonObject jsonResponse = new JsonObject();

		JsonArray imageArray = new JsonArray();
		List<PostImage> allImg = dao.selectMyPost(u_id);
		for (int i = 0; i < allImg.size(); i++) {
			String file_rname = allImg.get(i).getFile_rname();
			System.out.println(file_rname);
			String updated_at2 = dao.updated_at2(file_rname);

			FindContentDAO fdao = new FindContentDAO();
			String PostContent = fdao.findcontent(file_rname);
			System.out.println(PostContent);
			File imageFile = new File(file_folder + file_rname);

			if (imageFile.exists() && !imageFile.isDirectory()) {
				String contentType = Files.probeContentType(imageFile.toPath());
				String base64Image = encodeFileToBase64(imageFile);
				JsonObject jo = new JsonObject();
				jo.addProperty("contentType", contentType);
				jo.addProperty("base64Image", base64Image);
				jo.addProperty("PostContent", PostContent);
				jo.addProperty("file_rname", file_rname);
				jo.addProperty("updated_at2", updated_at2);
				imageArray.add(jo);

			}
		}

		if (imageArray.size() > 0) {
			jsonResponse.add("images", imageArray);
		} else {
			jsonResponse.addProperty("error", "No images found");
		}
//        jsonResponse.addProperty("content", content);
		response.getWriter().write(jsonResponse.toString());
	}

	private String encodeFileToBase64(File file) throws IOException {
		try (FileInputStream fis = new FileInputStream(file)) {
			byte[] bytes = fis.readAllBytes();
			return Base64.getEncoder().encodeToString(bytes);
		}
	}

}
