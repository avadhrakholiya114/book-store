/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import com.DAO.BookDaoImp;
import com.DB.DBconnect;
import com.entity.BookDtls;
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
@WebServlet("/deletebook")
public class deleteOldBook extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String email = req.getParameter("em");
            int bid = Integer.parseInt(req.getParameter("id"));
            BookDaoImp dao = new BookDaoImp(DBconnect.getConn());
            boolean b = dao.deleteOldBook(email, "old",bid);
            HttpSession session = req.getSession();
            if (b) {
                session.setAttribute("success", "old book delete successfully ");
                resp.sendRedirect("old_book.jsp");

            } else {
                session.setAttribute("failed", "something wronng on server");
                resp.sendRedirect("old_book.jsp");

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
