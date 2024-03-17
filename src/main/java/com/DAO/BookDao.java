/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.DAO;

import java.util.List;

/**
 *
 * @author ADMIN
 */
import com.entity.BookDtls;
import com.entity.update;

public interface BookDao {

    public boolean addBooks(BookDtls b);

    public List<BookDtls> getAllBook();

    public BookDtls getBook(int id);

    public boolean updateBook(update b);

    public boolean deleteBook(int id);
}
