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
import com.smhrd.model.SharedFileNumber;

import oracle.jdbc.driver.json.tree.JsonpPrimitive;

@WebServlet("/NextPostController")
public class NextPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String file_folder = "\\\\DESKTOP-TIB5NGS\\storage\\";

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        FindNumberDAO fn = new FindNumberDAO();
        List<FindNumber> findnumer = fn.findnumer();
        int maxf = findnumer.get(0).getMax_file_num();
        int minf = findnumer.get(0).getMin_file_num();
        System.out.println(maxf + "/" + minf);

        NextPostDAO dao = new NextPostDAO();
        SharedFileNumber sharedFileNumber = SharedFileNumber.getInstance();
        JsonObject jsonResponse = new JsonObject();
        int file_num = sharedFileNumber.getFileNum();

        List<PostImage> image = dao.NextPost(file_num);
        if (image.isEmpty()) {
        	System.out.println("Reached max file number: ");
            jsonResponse.addProperty("error", "No images found for the given file number");
            response.getWriter().write(jsonResponse.toString());
            return; // 더 이상 진행하지 않고 메서드를 종료
        }
        String file_rname = image.get(0).getFile_rname();
        int post_num = image.get(0).getPost_num();
        PostContent cont = dao.NextcPost(post_num);
        String content = cont.getPost_content();
        file_num = image.get(0).getFile_num();
        sharedFileNumber.setFileNum(file_num);
        
        String u_nick = dao.NextNick(post_num);
        String updated_at = dao.updated_at(post_num);

        File imageFile = new File(file_folder + file_rname);
        System.out.println(file_rname + "/" + imageFile + "/" + file_num + "/" + post_num+"/" + u_nick+"/" + updated_at);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        if (imageFile.exists() && !imageFile.isDirectory()) {
            String contentType = Files.probeContentType(imageFile.toPath());
            String base64Image = encodeFileToBase64(imageFile);
            jsonResponse.addProperty("contentType", contentType);
            jsonResponse.addProperty("base64Image", base64Image);
        } else {
            jsonResponse.addProperty("error", "Image not found");
            
        }
        jsonResponse.addProperty("content", content);
        jsonResponse.addProperty("u_nick", u_nick);
        jsonResponse.addProperty("updated_at", updated_at);
        jsonResponse.addProperty("file_rname", file_rname);
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
