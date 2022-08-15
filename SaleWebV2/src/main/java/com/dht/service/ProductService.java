/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.dht.service;

import com.dht.pojo.Comment;
import com.dht.pojo.Product;
import java.util.List;
import java.util.Map;

/**
 *
 * @author admin
 */
public interface ProductService {
    List<Product> getProducts(Map<String, String> params, int page);
    int countProduct();
    boolean addProduct(Product p);
    boolean deleteProduct(int productId);
    List<Object[]> countProductByCate();
    List<Object[]> revenueStats(int quarter, int year);
    List<Comment> getComments(int productId);
    Product getProductById(int id);
    Comment addComment(String content, int productId);
}
