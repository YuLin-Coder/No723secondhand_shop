package edu.secondhand.service;


import edu.secondhand.entity.Product;

import java.util.List;
import java.util.Map;

public interface ProductService {
    void addProduct(Product product);

    List<Product> selectProductList(Map<String, Object> maps);

    void deleteProduct(int id);

    Product selectProductById(int id);

    void updateProduct(Product product);

    List<Product> selectAllProduct();

}
