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

    @Override
    public User login(String email, String password) {
        User us = null;
        try {
            String sql = "SELECT * FROM user WHERE email = ? AND password = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {

                us = new User();
                us.setId(rs.getInt(1));
                us.setName(rs.getString(2));
                us.setEmail(rs.getString(3));
                us.setPassword(rs.getString(5));
                us.setPhnNo(rs.getString(4));
                us.setAddress(rs.getString(6));
                us.setCity(rs.getString(8));
                us.setLandmark(rs.getString(7));
                us.setState(rs.getString(9));
                us.setPincpde(rs.getString(10));

            }
            rs.close();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return us;
    }

    @Override
    public boolean checkPass(int id, String ps) {
        boolean f = false;
        try {
            String sql = "SELECT *  FROM user WHERE id = ? and password=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            pstmt.setString(2, ps);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                f = true;
            }
            rs.close();
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    @Override
    public boolean updatePro(User u) {
        boolean f = false;
        try {
            String sql = "UPDATE user SET name=?, email=?, phnno=?  WHERE id=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, u.getName());
            pstmt.setString(2, u.getEmail());
            pstmt.setString(3, u.getPhnNo());
            pstmt.setInt(4, u.getId());
            
           
            
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected ==1 ) {
                f = true;
            }
            pstmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

}
