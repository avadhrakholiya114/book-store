/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import com.DAO.cartDaoimpl;
import com.DB.DBconnect;
import com.entity.BookDtls;
import com.entity.bookOrder;
import com.entity.cart;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.DAO.BookOrderDaoimpl;
import com.DAO.orderBookDao;
import java.util.Random;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet("/order")
public class order extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            String name = req.getParameter("name");
            String email = req.getParameter("email");
            String phoNo = req.getParameter("phone");
            String address = req.getParameter("address");
            String landmark = req.getParameter("landmark");
            String city = req.getParameter("city");
            String state = req.getParameter("state");
            String pincode = req.getParameter("zip");
            String paymentType = req.getParameter("paymentMode");
            int id = Integer.parseInt(req.getParameter("id"));

            String fullAdd = address + ", " + landmark + ", " + city + ", " + state + " - " + pincode;

            cartDaoimpl dao = new cartDaoimpl(DBconnect.getConn());
            List<cart> blist = dao.getBookbyUser(id);
            HttpSession session = req.getSession();
            if (blist.isEmpty()) {
                session.setAttribute("errorMsg", "cart is empty");
                resp.sendRedirect("cart.jsp");
            } else {
                BookOrderDaoimpl dao2 = new orderBookDao(DBconnect.getConn());

                bookOrder o = null;

                ArrayList<bookOrder> orderList = new ArrayList<bookOrder>();
                Random r = new Random();

                for (cart c : blist) {
                    o = new bookOrder();
                    o.setOrderId("BOOK-ORD-00" + r.nextInt(1000));
                    o.setUserName(name);
                    o.setEmail(email);

                    o.setFullAdd(fullAdd);
                    o.setPhnNo(phoNo);
                    o.setBookname(c.getBookName());
                    o.setAuthor(c.getAuthor());
                    o.setPrice(c.getPrice() + "");
                    o.setPaymenttype(paymentType);
                    orderList.add(o);

                }
                
                if ("noselect".equals(paymentType)) {
                    session.setAttribute("errorMsg", "please select payment type");
                    resp.sendRedirect("cart.jsp");
                } else {
                    boolean f = dao2.saveOrder(orderList);
                    if (f) {
                        session.setAttribute("succMSG", "Your Order  Placed Successfully");
                        resp.sendRedirect("order_success.jsp");

                    } else {
                        System.out.println("Notdone");
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
