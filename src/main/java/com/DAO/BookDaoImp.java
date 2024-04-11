package com.DAO;

import com.entity.BookDtls;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.entity.update;

public class BookDaoImp implements BookDao {

    private Connection conn;

    public BookDaoImp(Connection conn) {
        super();
        this.conn = conn;
    }

    @Override
    public boolean addBooks(BookDtls b) {
        boolean f = false;
        String sql = "INSERT INTO book_detail (book_id, b_name, author, price, catagory, status, photo, email) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (
                PreparedStatement pstmt = conn.prepareStatement(sql);) {
            pstmt.setInt(1, b.getBookId());
            pstmt.setString(2, b.getBookName());
            pstmt.setString(3, b.getAuthor());
            pstmt.setString(4, b.getPrice());
            pstmt.setString(5, b.getBookCategory());
            pstmt.setString(6, b.getStatus());
            pstmt.setString(7, b.getPhotoName());
            pstmt.setString(8, b.getUseremail());

            // Execute the query
            int i = pstmt.executeUpdate();

            if (i == 1) {
                f = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public List<BookDtls> getAllBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;

        try {
            String sql = "select * from book_detail";

            PreparedStatement ps = conn.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDtls(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );
                list.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public BookDtls getBook(int id) {
        BookDtls book = null;

        try {
            String sql = "SELECT * FROM book_detail WHERE book_id= ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                book = new BookDtls(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return book;
    }

    @Override
    public boolean updateBook(update b) {
        boolean f = false;
        try {
            String sql = "UPDATE book_detail SET b_name=?, author=?, price=?, status=? WHERE book_id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, b.getBookName());
            pstmt.setString(2, b.getAuthor());
            pstmt.setString(3, b.getPrice());
            pstmt.setString(4, b.getStatus());
            pstmt.setInt(5, b.getBookId());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected == 1) {
                f = true;
            }
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean deleteBook(int id) {
        String query = "DELETE FROM book_detail WHERE book_id = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();
            return rowsAffected == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public List<BookDtls> geNewBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {

            String sql = "SELECT * FROM book_detail  WHERE catagory = ? and status=? order by book_id desc";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "new");
            ps.setString(2, "active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BookDtls(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );
                list.add(b);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<BookDtls> geRecenentBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {

            String sql = "SELECT * FROM book_detail  WHERE  status=? order by book_id desc";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BookDtls(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );
                list.add(b);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<BookDtls> geOldBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {

            String sql = "SELECT * FROM book_detail  WHERE catagory = ? and status=? order by book_id desc";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "old");
            ps.setString(2, "active");
            ResultSet rs = ps.executeQuery();
            int i = 1;
            while (rs.next() && i <= 4) {
                b = new BookDtls(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );
                list.add(b);
                i++;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<BookDtls> getAllRecenentBook() {

        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {

            String sql = "SELECT * FROM book_detail  WHERE  status=? order by book_id desc";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "active");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new BookDtls(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );
                list.add(b);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<BookDtls> getAllNewBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {

            String sql = "SELECT * FROM book_detail  WHERE catagory = ? and status=? order by book_id desc";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "new");
            ps.setString(2, "active");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new BookDtls(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );
                list.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<BookDtls> getAllOldBook() {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {

            String sql = "SELECT * FROM book_detail  WHERE catagory = ? and status=? order by book_id desc";

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "old");
            ps.setString(2, "active");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                b = new BookDtls(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );
                list.add(b);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public List<BookDtls> getOldBook(String email, String cat) {
        List<BookDtls> list = new ArrayList<BookDtls>();
        BookDtls b = null;
        try {
            String sql = "SELECT * FROM book_detail WHERE email = ? AND catagory = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, cat);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                b = new BookDtls(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );
                list.add(b);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    @Override
    public boolean deleteOldBook(String email, String cat, int bid) {
        String query = "DELETE FROM book_detail WHERE email = ? AND catagory = ? and book_id=?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, email);
            ps.setString(2, cat);
            ps.setInt(3, bid);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
