/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.admin.servlet;

import com.DAO.BookDaoImp;
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
@WebServlet("/delete")
public class delete extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            
            int id=Integer.parseInt(req.getParameter("id"));
            BookDaoImp dao = new BookDaoImp(DBconnect.getConn());
            boolean b=dao.deleteBook(id);
              HttpSession session = req.getSession();
             if (b) {
                session.setAttribute("succMSG", "Book deleted successfully");
                resp.sendRedirect("admin/all_book.jsp");
            } else {
                session.setAttribute("errorMsg", "Failed to delete book");
                
                resp.sendRedirect("admin/all_book.jsp"); 
            }
            
        }catch (Exception e) {

            e.printStackTrace();

        }
    }
    
    
}
