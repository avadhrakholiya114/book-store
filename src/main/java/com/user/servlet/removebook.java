/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.DAO.cartDaoimpl;
import com.DB.DBconnect;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet("/removebook")
public class removebook extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       
        int bid = Integer.parseInt(req.getParameter("bid"));
        int uid = Integer.parseInt(req.getParameter("uid"));
        int cid = Integer.parseInt(req.getParameter("cid"));
        cartDaoimpl dao = new cartDaoimpl(DBconnect.getConn());
        boolean f = dao.deleteBook(bid, uid,cid);
        HttpSession session = req.getSession();
        if (f) {
            session.setAttribute("success", "book removed successfully from the cart");
            resp.sendRedirect("cart.jsp");

        } else {
            session.setAttribute("failed", "something wronng on server");
            resp.sendRedirect("cart.jsp");

        }

    }

}
