/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.entity;

public class cart {
    private int cId;
    private int bId;
    private int uId;
    private String bookName;
    private String author;
    private Double price;
    private Double totalPrice;

    // Constructor
    public cart(int cId, int bId, int uId, String bookName, String author, Double price, Double totalPrice) {
        this.cId = cId;
        this.bId = bId;
        this.uId = uId;
        this.bookName = bookName;
        this.author = author;
        this.price = price;
        this.totalPrice = totalPrice;
    }

    // Getters and Setters
    public int getCId() {
        return cId;
    }

    public void setCId(int cId) {
        this.cId = cId;
    }

    public int getBId() {
        return bId;
    }

    public void setBId(int bId) {
        this.bId = bId;
    }

    public int getUId() {
        return uId;
    }

    public void setUId(int uId) {
        this.uId = uId;
    }

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
