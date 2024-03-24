/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.entity.BookDtls;
import javax.servlet.annotation.MultipartConfig;
import com.DAO.BookDaoImp;
import com.DB.DBconnect;
import javax.servlet.http.HttpSession;
import java.io.File;


/**
 *
 * @author ADMIN
 */
@WebServlet("/add_book")
@MultipartConfig
public class BookAdd extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String bookName = request.getParameter("bookName");
            String authorName = request.getParameter("authorName");
            String price = request.getParameter("price");
            String bookType = request.getParameter("bookType");
            String status = request.getParameter("status");
            Part filePart = request.getPart("photo");
            String fileName = filePart.getSubmittedFileName();
       
            BookDtls b = new BookDtls(0, bookName, authorName, price, bookType, status, fileName, "admin");

            BookDaoImp dao = new BookDaoImp(DBconnect.getConn());

            boolean f = dao.addBooks(b);

            HttpSession session = request.getSession();

            if (f) {
                String path = getServletContext().getRealPath("") + "book";
//                System.out.println(path);
                File fa = new File(path);
                filePart.write(path + File.separator + fileName);
                session.setAttribute("succMSG", "Book Add Sucessfully");
                resp.sendRedirect("admin/add_book.jsp");
            } else {
                session.setAttribute("failedMsg", "Something wrong on Server");
                resp.sendRedirect("admin/add_book.jsp");
            }
        } catch (Exception e) {

            e.printStackTrace();

        }
    }

}
