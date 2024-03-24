/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.user.servlet;

import com.DAO.BookDaoImp;
import com.DB.DBconnect;
import com.entity.BookDtls;
/**
 *
 * @author ADMIN
 */

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import javax.servlet.annotation.MultipartConfig;

@WebServlet("/addoldbook")
    @MultipartConfig


public class oldbook extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String bookName = request.getParameter("bookName");
            String authorName = request.getParameter("authorName");
            String price = request.getParameter("price");
            String bookType = "old";
            String status = "active";
            Part filePart = request.getPart("photo");
            String fileName = filePart.getSubmittedFileName();
            String email = request.getParameter("email");

            BookDtls b = new BookDtls(0, bookName, authorName, price, bookType, status, fileName, email);

            BookDaoImp dao = new BookDaoImp(DBconnect.getConn());

            boolean isSuccess = dao.addBooks(b);

            HttpSession session = request.getSession();

            if (isSuccess) {
                String path = getServletContext().getRealPath("") + File.separator + "book";
                File directory = new File(path);
                if (!directory.exists()) {
                    directory.mkdir();
                }
                String filePath = path + File.separator + fileName;
                filePart.write(filePath);
                session.setAttribute("succMSG", "Book Added Successfully");
                response.sendRedirect("sell_book.jsp");
            } else {
                session.setAttribute("errorMsg", "Failed to add book. Something went wrong on the server.");
                response.sendRedirect("sell_book.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();

        }
    }
}
