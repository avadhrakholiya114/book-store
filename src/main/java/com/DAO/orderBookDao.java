/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import com.entity.bookOrder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class orderBookDao implements BookOrderDaoimpl {

    private Connection conn;

    public orderBookDao(Connection conn) {
        super();
        this.conn = conn;
    }

    

    @Override
    public boolean saveOrder(List<bookOrder> blist) {
        boolean f = false;
        try {
            String sql = "INSERT INTO book_order(order_id, user_name, email, address, phone, book_name, author, price, payment) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            conn.setAutoCommit(false);
            PreparedStatement ps = conn.prepareStatement(sql);

            for (bookOrder b : blist) {
                ps.setString(1, b.getOrderId());
                ps.setString(2, b.getUserName());
                ps.setString(3, b.getEmail());
                ps.setString(4, b.getFullAdd());
                ps.setString(5, b.getPhnNo());
                ps.setString(6, b.getBookname());
                ps.setString(7, b.getAuthor());
                ps.setString(8, b.getPrice());
                ps.setString(9, b.getPaymenttype());
                ps.addBatch();
            }

            int[] count = ps.executeBatch();
            conn.commit();
            f = true;
            conn.setAutoCommit(true);
            
            } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

}
