package edu.secondhand.service.impl;

import edu.secondhand.dao.CategoryDao;
import edu.secondhand.entity.Category;
import edu.secondhand.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryDao dao;

    @Override
    public void addCategory(Category category) {
        dao.addCategory(category);
    }

    @Override
    public List<Category> selectCategoryList(Map<String, Object> maps) {
        return   dao.selectCategoryList(maps);
    }

    @Override
    public void deleteCategory(int id) {
        dao.deleteCategory(id);
    }

    @Override
    public Category selectCategoryById(int id) {
        return  dao.selectCategoryById(id);
    }

    @Override
    public void updateCategory(Category category) {
        dao.updateCategory(category);
    }

    @Override
    public List<Category> selectAllCategory() {
        return    dao.selectAllCategory();
    }

}
