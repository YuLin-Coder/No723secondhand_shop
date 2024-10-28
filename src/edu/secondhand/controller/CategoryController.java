package edu.secondhand.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.secondhand.entity.Category;
import edu.secondhand.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.SimpleDateFormat;
import java.util.*;


@RestController
public class CategoryController {

    @Autowired
    CategoryService service;

    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm");


    /**
     * 分类列表
     * @param currentPage
     * @param request
     * @param map
     * @return
     */
    @RequestMapping("/CategoryList")
    public ModelAndView CategoryList(
            @RequestParam(defaultValue="1") Integer currentPage, HttpServletRequest request,
            Map<String,Object> map){
        String key = request.getParameter("key");
        String state = request.getParameter("state");
        List<Category> list = new ArrayList<>();
        Map<String,Object> maps = new HashMap<>();
        maps.put("key", key);
        maps.put("state", state);
        PageHelper.startPage(currentPage,8);
        list=service.selectCategoryList(maps);
        PageInfo<Category> pageInfo=new PageInfo<Category>(list,8);
        map.put("pageInfo", pageInfo);
        return new ModelAndView("views/category/list");
    }

    /**
     *
     * 去新增分类页面
     * @param request
     * @param mv
     * @return
     */
    @RequestMapping("/toAddCategory")
    public ModelAndView toAddCategory(HttpServletRequest request, ModelAndView mv){
        mv.setViewName("views/category/add");
        return mv;
    }

    /**
     * 新增分类
     * @param Category
     * @return
     */
    @RequestMapping("/addCategory")
    @ResponseBody
    public boolean addCategory(Category Category){
        boolean re = false;
        service.addCategory(Category);
        re = true;
        return re;
    }

    /**
     * 删除分类
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/deleteCategory")
    public boolean deleteCategory(Integer id ,HttpServletRequest request,
                              HttpServletResponse response){
        boolean re = false;
        service.deleteCategory(id);
        re = true;
        return re;
    }

    /**
     * 去修改分类页面
     * @param id
     * @param request
     * @param mv
     * @return
     */
    @RequestMapping("/toUpdateCategory")
    public ModelAndView toUpdateCategory(Integer id ,HttpServletRequest request, ModelAndView mv){
        Category Category = service.selectCategoryById(id);
        mv.addObject("data", Category);
        mv.setViewName("views/category/update");
        return mv;
    }


    /**
     * 修改分类
     * @param Category
     * @return
     */
    @RequestMapping("/updateCategory")
    @ResponseBody
    public boolean updateCategory(Category Category){
        boolean re = false;
        service.updateCategory(Category);
        re = true;
        return re;
    }
}
