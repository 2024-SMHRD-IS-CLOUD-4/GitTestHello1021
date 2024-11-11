package com.smhrd.model;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import org.json.JSONObject;

public class ImageSender {
    public static void main(String[] args) {
        String imagePath = "\\\\DESKTOP-TIB5NGS\\storage\\호두_187709561460000.jpg"; // 이미지 파일 경로
        String serverUrl = "http://127.0.0.1:5000/upload"; // Flask 서버 URL

        try {
            File imageFile = new File(imagePath);
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

                // 서버 응답 읽기
                try (BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
                    String inputLine;
                    StringBuilder response = new StringBuilder();
                    while ((inputLine = in.readLine()) != null) {
                        response.append(inputLine);
                    }
                    System.out.println("Response Content: " + response.toString());

                    // JSON 응답 파싱
                    JSONObject jsonResponse = new JSONObject(response.toString());
                    String originalCaption = jsonResponse.optString("original_caption", "N/A");
                    String translatedCaption = jsonResponse.optString("translated_caption", "N/A");

                    System.out.println("Original Caption: " + originalCaption);
                    System.out.println("Translated Caption: " + translatedCaption);
                }

                connection.disconnect();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
