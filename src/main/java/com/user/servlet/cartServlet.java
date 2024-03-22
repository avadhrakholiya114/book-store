/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import com.DAO.BookDaoImp;
import com.entity.BookDtls;
import com.DAO.cartDaoimpl;
import com.entity.cart;
import com.DB.DBconnect;
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
@WebServlet("/cart")
public class cartServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            int uid = Integer.parseInt(req.getParameter("uid"));
            int bid = Integer.parseInt(req.getParameter("bid"));
            BookDaoImp dao = new BookDaoImp(DBconnect.getConn());
            BookDtls b = dao.getBook(bid);
            cart c = new cart(0, bid, uid, b.getBookName(), b.getAuthor(), Double.parseDouble(b.getPrice()), Double.parseDouble(b.getPrice()));
            cartDaoimpl dao2 = new cartDaoimpl(DBconnect.getConn());
            boolean f = dao2.addCart(c);
           HttpSession session = req.getSession();
            if (f) {
                session.setAttribute("addcart", "added to cart");
                resp.sendRedirect("all_new.jsp");
               
            } else {
                 session.setAttribute("failed", "not added to cart");
                resp.sendRedirect("all_new.jsp");
                
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
