/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

/**
 *
 * @author ADMIN
 */
import com.DAO.UserDAOimpl;
import com.DB.DBconnect;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import com.entity.User;

@WebServlet("/login")
public class login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            UserDAOimpl dao = new UserDAOimpl(DBconnect.getConn());
            HttpSession session = req.getSession();
            String email = req.getParameter("email");
            String password = req.getParameter("password");
//            System.out.println(email+" "+password);
            if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
                User us = new User();
                session.setAttribute("userObj", us);

                resp.sendRedirect("admin/home.jsp");

            } else {
                User us = dao.login(email, password);
                if (us != null) {
                    session.setAttribute("userObj", us);

                    resp.sendRedirect("home.jsp");
                } else {
                    session.setAttribute("failed", "invalid credential");
                    resp.sendRedirect("login.jsp");

                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
