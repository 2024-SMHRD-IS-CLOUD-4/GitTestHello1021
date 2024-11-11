package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import com.smhrd.model.MavenMemer;
import com.smhrd.model.user_edit_DAO;

@MultipartConfig
@WebServlet("/user_edit_controller")
public class user_edit_controller extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        System.out.println("여기");
        HttpSession session = request.getSession();
        JSONObject jsonResponse = new JSONObject();

        try {
            MavenMemer login_user = (MavenMemer) session.getAttribute("login_user");
            if (login_user == null) {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "로그인 정보가 없습니다.");
                response.getWriter().write(jsonResponse.toString());
                return;
            }

            String u_id = login_user.getU_id();
           
            String u_nick = request.getParameter("nickname");
            String u_pw = request.getParameter("password");
            String u_tel = request.getParameter("tel");
            System.out.println(u_id +"/"+ u_nick +"/"+ u_pw +"/"+ u_tel);
            MavenMemer MM = new MavenMemer(u_id,  u_pw, u_nick,u_tel);
            user_edit_DAO dao = new user_edit_DAO();
            int result = dao.UpdateUserinfo(MM);

            if (result > 0) {
                jsonResponse.put("success", true);
                jsonResponse.put("message", "업데이트 성공했습니다.");
            } else {
                jsonResponse.put("success", false);
                jsonResponse.put("message", "업데이트 실패했습니다.");
            }
        } catch (Exception e) {
            jsonResponse.put("success", false);
            jsonResponse.put("message", "서버 오류: " + e.getMessage());
        }

        response.getWriter().write(jsonResponse.toString());
    }
}
