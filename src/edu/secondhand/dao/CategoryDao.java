package edu.secondhand.dao;

import edu.secondhand.entity.Category;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface CategoryDao {
    void updateCategory(@Param("Category") Category category);

    Category selectCategoryById(@Param("id") int id);

    void deleteCategory(@Param("id") int id);

    List<Category> selectCategoryList(@Param("map") Map<String, Object> maps);

    void addCategory(@Param("Category") Category category);

    List<Category> selectAllCategory();
}
