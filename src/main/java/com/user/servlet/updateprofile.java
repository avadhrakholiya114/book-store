/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import com.DAO.UserDAOimpl;
import com.DB.DBconnect;
import com.entity.User;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet("/update_profile")

public class updateprofile extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phnNo = req.getParameter("phone");
            String password = req.getParameter("password");
            int id = Integer.parseInt(req.getParameter("id"));

            UserDAOimpl dao = new UserDAOimpl(DBconnect.getConn());
            HttpSession session = req.getSession();
            boolean f = dao.checkPass(id, password);
            User user = new User();
            user.setName(name);
            user.setEmail(email);
            user.setPhnNo(phnNo);
            user.setId(id);
            if (f) {
                boolean f2 = dao.updatePro(user);
                if (f) {

                    session.setAttribute("succMSG", "updated Successfully");
                    resp.sendRedirect("edit_profile.jsp");
                } else {
                    session.setAttribute("failed", "not update");
                    resp.sendRedirect("edit_profile.jsp");
                }

            } else {
                session.setAttribute("failed", "imvalid password");
                resp.sendRedirect("edit_profile.jsp");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
