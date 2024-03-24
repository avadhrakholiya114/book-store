/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.DAO;
import com.entity.BookDtls;
import com.entity.cart;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public interface cartDao {
    
    public  boolean addCart(cart c);
    
    public List<cart> getBookbyUser(int userid);
    
    public boolean deleteBook(int bid,int uid,int cid);
    
}
