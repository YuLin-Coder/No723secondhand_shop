package edu.secondhand.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.secondhand.entity.Category;
import edu.secondhand.entity.Goods;
import edu.secondhand.service.CategoryService;
import edu.secondhand.service.GoodsService;
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
public class GoodsController {

    @Autowired
    GoodsService service;

    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm");

    @Autowired
    CategoryService categoryService;

    /**
     * 商品列表
     * @param currentPage
     * @param request
     * @param map
     * @return
     */
    @RequestMapping("/GoodsList")
    public ModelAndView GoodsList(
            @RequestParam(defaultValue="1") Integer currentPage, HttpServletRequest request,
            Map<String,Object> map){
        String key = request.getParameter("key");
        List<Goods> list = new ArrayList<>();
        Map<String,Object> maps = new HashMap<>();
        maps.put("key", key);
        PageHelper.startPage(currentPage,8);
        list=service.selectGoodsList(maps);
        PageInfo<Goods> pageInfo=new PageInfo<Goods>(list,8);
        map.put("pageInfo", pageInfo);
        return new ModelAndView("views/goods/list");
    }

    /**
     *
     * 去新增商品页面
     * @param request
     * @param mv
     * @return
     */
    @RequestMapping("/toAddGoods")
    public ModelAndView toAddGoods(HttpServletRequest request, ModelAndView mv){
        List<Category> categoryList = categoryService.selectAllCategory();
        mv.addObject("categoryList", categoryList);
        mv.setViewName("views/goods/add");
        return mv;
    }

    /**
     * 新增商品
     * @param Goods
     * @return
     */
    @RequestMapping("/addGoods")
    @ResponseBody
    public boolean addGoods(Goods Goods){
        Goods.setCreate_time(new  SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
        boolean re = false;
        service.addGoods(Goods);
        re = true;
        return re;
    }

    /**
     * 删除商品
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/deleteGoods")
    public boolean deleteGoods(Integer id ,HttpServletRequest request,
                              HttpServletResponse response){
        boolean re = false;
        service.deleteGoods(id);
        re = true;
        return re;
    }

    /**
     * 去修改商品页面
     * @param id
     * @param request
     * @param mv
     * @return
     */
    @RequestMapping("/toUpdateGoods")
    public ModelAndView toUpdateGoods(Integer id ,HttpServletRequest request, ModelAndView mv){
        Goods Goods = service.selectGoodsById(id);
        mv.addObject("data", Goods);
        List<Category> categoryList = categoryService.selectAllCategory();
        mv.addObject("categoryList", categoryList);
        mv.setViewName("views/goods/update");
        return mv;
    }


    /**
     * 修改商品
     * @param Goods
     * @return
     */
    @RequestMapping("/updateGoods")
    @ResponseBody
    public boolean updateGoods(Goods Goods){
        boolean re = false;
        service.updateGoods(Goods);
        re = true;
        return re;
    }
}
