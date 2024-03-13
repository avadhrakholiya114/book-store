/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.DAO;

import java.sql.*;
/**
 *
 * @author ADMIN
 */
import com.entity.User;

public class UserDAOimpl implements UserDAO {

    private Connection conn;

    public UserDAOimpl(Connection conn) {
        super();
        this.conn = conn;
    }

    @Override
    public boolean userRegister(User u) {
        boolean f = false;
        try {
            String sql = "insert into user(name,email,phnno,password) values(?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, u.getName());
            pstmt.setString(2, u.getEmail());
            pstmt.setString(3, u.getPhnNo());
            pstmt.setString(4, u.getPassword());
            int rowsAffected = pstmt.executeUpdate();
             if (rowsAffected > 0) {
                f = true; 
            }
             pstmt.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return f;
    }

}
