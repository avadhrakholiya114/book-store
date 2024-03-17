package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.entity.update;
import com.DAO.BookDaoImp;
import com.DB.DBconnect;
import javax.servlet.http.HttpSession;

@WebServlet("/edit")
public class EditBook extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String bookName = req.getParameter("bookName");
            String authorName = req.getParameter("authorName");
            String price = req.getParameter("price");
            String status = req.getParameter("status");
            
            update book = new update(bookName, authorName, price, status);

            BookDaoImp dao = new BookDaoImp(DBconnect.getConn());
            boolean success = dao.updateBook(book);

            HttpSession session = req.getSession();
            if (success) {
                session.setAttribute("succMSG", "Book updated successfully");
                resp.sendRedirect("admin/all_book.jsp");
            } else {
                session.setAttribute("errorMsg", "Failed to update book");
                
                resp.sendRedirect("admin/all_book.jsp"); 
            }

        } catch (Exception e) {
            e.printStackTrace();
            // Handle any exceptions here
        }
    }
}
