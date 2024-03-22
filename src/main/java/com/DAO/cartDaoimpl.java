package com.DAO;

import com.entity.cart;
import java.sql.Connection;
import java.sql.PreparedStatement;

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
}
