package edu.secondhand.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.secondhand.entity.Product;
import edu.secondhand.service.ProductService;
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
public class ProductController {

    @Autowired
    ProductService service;

    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm");


    /**
     * 失物列表
     * @param currentPage
     * @param request
     * @param map
     * @return
     */
    @RequestMapping("/ProductList")
    public ModelAndView ProductList(
            @RequestParam(defaultValue="1") Integer currentPage, HttpServletRequest request,
            Map<String,Object> map){
        String key = request.getParameter("key");
        String state = request.getParameter("state");
        List<Product> list = new ArrayList<>();
        Map<String,Object> maps = new HashMap<>();
        maps.put("key", key);
        maps.put("state", state);
        PageHelper.startPage(currentPage,8);
        list=service.selectProductList(maps);
        PageInfo<Product> pageInfo=new PageInfo<Product>(list,8);
        map.put("pageInfo", pageInfo);
        return new ModelAndView("views/product/list");
    }

    /**
     *
     * 去新增失物页面
     * @param request
     * @param mv
     * @return
     */
    @RequestMapping("/toAddProduct")
    public ModelAndView toAddProduct(HttpServletRequest request, ModelAndView mv){
        mv.setViewName("views/product/add");
        return mv;
    }

    /**
     * 新增失物
     * @param Product
     * @return
     */
    @RequestMapping("/addProduct")
    @ResponseBody
    public boolean addProduct(Product Product){
        boolean re = false;
        Product.setCreate_time(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
        service.addProduct(Product);
        re = true;
        return re;
    }

    /**
     * 删除失物
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/deleteProduct")
    public boolean deleteProduct(Integer id ,HttpServletRequest request,
                              HttpServletResponse response){
        boolean re = false;
        service.deleteProduct(id);
        re = true;
        return re;
    }

    /**
     * 去修改失物页面
     * @param id
     * @param request
     * @param mv
     * @return
     */
    @RequestMapping("/toUpdateProduct")
    public ModelAndView toUpdateProduct(Integer id ,HttpServletRequest request, ModelAndView mv){
        Product Product = service.selectProductById(id);
        mv.addObject("data", Product);
        mv.setViewName("views/product/update");
        return mv;
    }


    /**
     * 修改失物
     * @param Product
     * @return
     */
    @RequestMapping("/updateProduct")
    @ResponseBody
    public boolean updateProduct(Product Product){
        boolean re = false;
        service.updateProduct(Product);
        re = true;
        return re;
    }
}
