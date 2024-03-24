package com.DAO;

import com.entity.BookDtls;
import com.entity.cart;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class cartDaoimpl implements cartDao {

    private Connection conn;

    public cartDaoimpl(Connection conn) {
        super();
        this.conn = conn;
    }

    @Override
    public boolean addCart(cart c) {

        boolean f = false;
        try {
            String query = "INSERT INTO cart (cid,bid, uid, bookname, author, price, totalprice) VALUES (?,?, ?, ?, ?, ?, ?)";

            PreparedStatement pstmt = conn.prepareStatement(query);

            pstmt.setInt(1, c.getCId());
            pstmt.setInt(2, c.getBId());
            pstmt.setInt(3, c.getUId());
            pstmt.setString(4, c.getBookName());
            pstmt.setString(5, c.getAuthor());
            pstmt.setDouble(6, c.getPrice());
            pstmt.setDouble(7, c.getTotalPrice());

            int rows = pstmt.executeUpdate();

            if (rows == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;
    }

    @Override
    public List<cart> getBookbyUser(int userid) {
        List<cart> list = new ArrayList<cart>();
        cart b = null;
        double totalprice = 0;
        try {
            String sql = "select * from cart where uid=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, userid);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                totalprice += rs.getDouble(7);
                b = new cart(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        totalprice
                );
                list.add(b);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    @Override
    public boolean deleteBook(int bid,int uid,int cid) {
        boolean success = false;
        try {
            String sql = "DELETE FROM cart WHERE bid = ? and uid=? and cid=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, bid);
            pstmt.setInt(2, uid);
            pstmt.setInt(3, cid);
            int rows = pstmt.executeUpdate();

            if (rows ==1 ) {
                success = true; 
            }

            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

}
