/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.DAO;

/**
 *
 * @author ADMIN
 */
import com.entity.User;

public interface UserDAO {

    public boolean userRegister(User u);

    public User login(String email, String password);
    
    public boolean checkPass(int id,String ps);
    
    public boolean updatePro(User u);

}
