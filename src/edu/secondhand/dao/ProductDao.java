package edu.secondhand.dao;

import edu.secondhand.entity.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ProductDao {
    void updateProduct(@Param("Product") Product product);

    Product selectProductById(@Param("id") int id);

    void deleteProduct(@Param("id") int id);

    List<Product> selectProductList(@Param("map") Map<String, Object> maps);

    void addProduct(@Param("Product") Product product);

    List<Product> selectAllProduct();
}
