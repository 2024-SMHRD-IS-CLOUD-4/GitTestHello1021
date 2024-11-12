package com.smhrd.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

@WebServlet("/ImageSenderController")
public class ImageSenderController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	
    	String fileRname = request.getParameter("file_rname");
        if (fileRname == null || fileRname.isEmpty()) {
            System.out.println("file_rname 파라미터가 잘못 전달되었습니다: " + fileRname);
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Missing or invalid file_rname parameter");
            return;
        } else {
            System.out.println("file_rname 파라미터 수신 성공: " + fileRname);
        }
        if (fileRname == null || fileRname.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("Missing file_rname parameter");
            return;
        }
        String imagePath = "\\\\DESKTOP-TIB5NGS\\storage\\" + fileRname; // 이미지 파일 경로
        String serverUrl = "http://127.0.0.1:5000/upload"; // 기본 서버 URL
        try {
            File imageFile = new File(imagePath);
            if (!imageFile.exists()) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                response.getWriter().write("File not found");
                return;
            }

            try (FileInputStream fileInputStream = new FileInputStream(imageFile)) {
                URI uri = new URI(serverUrl);
                URL url = uri.toURL();

                HttpURLConnection connection = (HttpURLConnection) url.openConnection();
                connection.setRequestMethod("POST");
                connection.setDoOutput(true);
                connection.setRequestProperty("Content-Type", "application/octet-stream");
                connection.setRequestProperty("Content-Length", String.valueOf(imageFile.length()));

                try (OutputStream outputStream = connection.getOutputStream()) {
                    byte[] buffer = new byte[4096];
                    int bytesRead;
                    while ((bytesRead = fileInputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                }

                int responseCode = connection.getResponseCode();
                System.out.println("Response Code: " + responseCode);

                if (responseCode == HttpURLConnection.HTTP_OK) {
                    try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8))) {
                        StringBuilder responseContent = new StringBuilder();
                        String inputLine;
                        while ((inputLine = in.readLine()) != null) {
                            responseContent.append(inputLine);
                        }
                        System.out.println("Response Content: " + decodeUnicode(responseContent.toString()));

                        // JSON 응답 파싱
                        JSONObject jsonResponse = new JSONObject(responseContent.toString());
                        String originalCaption = jsonResponse.optString("original_caption", "N/A");
                        String translatedCaption = jsonResponse.optString("translated_caption", "N/A");

                        response.setContentType("application/json");
                        response.setCharacterEncoding("UTF-8");
                        try (PrintWriter out = response.getWriter()) {
                            String jsonString = new JSONObject()
                                .put("original_caption", originalCaption)
                                .put("translated_caption", translatedCaption)
                                .toString();

                            out.write(jsonString);
                        }
                    }
                } else {
                    try (BufferedReader errorReader = new BufferedReader(new InputStreamReader(connection.getErrorStream(), StandardCharsets.UTF_8))) {
                        StringBuilder errorResponse = new StringBuilder();
                        String errorLine;
                        while ((errorLine = errorReader.readLine()) != null) {
                            errorResponse.append(errorLine);
                        }
                        System.out.println("Error Response Content: " + errorResponse);
                        response.setStatus(responseCode);
                        response.getWriter().write("Error: " + responseCode + " - " + errorResponse);
                    }
                }

                connection.disconnect();
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Exception occurred: " + e.getMessage());
        }
    }

    // 유니코드 시퀀스를 실제 문자로 변환하는 메서드
    private String decodeUnicode(String input) {
        Pattern pattern = Pattern.compile("\\\\u([0-9A-Fa-f]{4})");
        Matcher matcher = pattern.matcher(input);
        StringBuffer decodedString = new StringBuffer();
        while (matcher.find()) {
            int codePoint = Integer.parseInt(matcher.group(1), 16);
            matcher.appendReplacement(decodedString, String.valueOf((char) codePoint));
        }
        matcher.appendTail(decodedString);
        return decodedString.toString();
    }
}
