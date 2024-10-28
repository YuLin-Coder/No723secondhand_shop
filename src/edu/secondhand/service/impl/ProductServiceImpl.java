package edu.secondhand.service.impl;

import edu.secondhand.dao.ProductDao;
import edu.secondhand.entity.Product;
import edu.secondhand.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    ProductDao dao;

    @Override
    public void addProduct(Product product) {
        dao.addProduct(product);
    }

    @Override
    public List<Product> selectProductList(Map<String, Object> maps) {
        return   dao.selectProductList(maps);
    }

    @Override
    public void deleteProduct(int id) {
        dao.deleteProduct(id);
    }

    @Override
    public Product selectProductById(int id) {
        return  dao.selectProductById(id);
    }

    @Override
    public void updateProduct(Product product) {
        dao.updateProduct(product);
    }

    @Override
    public List<Product> selectAllProduct() {
        return    dao.selectAllProduct();
    }

}
