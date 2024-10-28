package edu.secondhand.service;


import edu.secondhand.entity.Category;

import java.util.List;
import java.util.Map;

public interface CategoryService {
    void addCategory(Category category);

    List<Category> selectCategoryList(Map<String, Object> maps);

    void deleteCategory(int id);

    Category selectCategoryById(int id);

    void updateCategory(Category category);

    List<Category> selectAllCategory();

}
