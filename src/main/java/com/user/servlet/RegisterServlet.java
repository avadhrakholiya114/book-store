/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

/**
 *
 * @author ADMIN
 */
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;

import com.entity.User;
import com.DAO.UserDAOimpl;
import com.DB.DBconnect;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String name = req.getParameter("fullName");
            String email = req.getParameter("email");
            String phnNo = req.getParameter("phoneNumber");
            String password = req.getParameter("password");
            String check = req.getParameter("check");
//            System.out.println(fullName+" "+email+" "+phoneNumber+" "+password+" "+check);

            User user = new User();
            user.setName(name);
            user.setEmail(email);
            user.setPassword(password);
            user.setPhnNo(phnNo);
            HttpSession session = req.getSession();

            if (check != null) {
                UserDAOimpl dao = new UserDAOimpl(DBconnect.getConn());
                boolean f = dao.userRegister(user);
//            System.out.println(f);
        //error message
                if (f) {
//                System.out.println("inserted");
                    session.setAttribute("succMSG", "Registration Successfully");
                    resp.sendRedirect("register.jsp");
                } else {
                    session.setAttribute("failed", "not Registerd");
                    resp.sendRedirect("register.jsp");
                }
            } else {
                session.setAttribute("failed", "please checck Terms and Conditions");
                resp.sendRedirect("register.jsp");

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
