/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.DAO;

import com.entity.bookOrder;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public interface BookOrderDaoimpl {
    
    public boolean saveOrder(List<bookOrder> b);
      public List<bookOrder> getBook(String email);
      public List<bookOrder> getallBook();
    
}
