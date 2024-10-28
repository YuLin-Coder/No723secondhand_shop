package edu.secondhand.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.secondhand.entity.*;
import edu.secondhand.service.GoodsService;
import edu.secondhand.service.OrdersService;
import edu.secondhand.service.StudentService;
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
public class OrdersController {

    @Autowired
    OrdersService service;

    @Autowired
    StudentService studentService;

    @Autowired
    GoodsService goodsService;

    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm");


    /**
     * 订单列表
     * @param currentPage
     * @param request
     * @param map
     * @return
     */
    @RequestMapping("/OrdersList")
    public ModelAndView OrdersList(
            @RequestParam(defaultValue="1") Integer currentPage, HttpServletRequest request,
            Map<String,Object> map){
        String key = request.getParameter("key");
        String state = request.getParameter("state");
        List<Orders> list = new ArrayList<>();
        Map<String,Object> maps = new HashMap<>();
        maps.put("key", key);
        maps.put("state", state);
        PageHelper.startPage(currentPage,8);
        list=service.selectOrdersList(maps);
        for(Orders orders : list){
            orders.setStudent(studentService.selectStudentById(orders.getSid()));
            List<Items> itemsList = service.selectItemList(orders.getOrder_no());
            for(Items items : itemsList){
                items.setGoods(goodsService.selectGoodsById(items.getG_id()));
            }
            orders.setItems(itemsList);
        }
        PageInfo<Orders> pageInfo=new PageInfo<Orders>(list,8);
        map.put("pageInfo", pageInfo);
        return new ModelAndView("views/orders/list");
    }


    /**
     * 新增订单
     * @param Orders
     * @return
     */
    @RequestMapping("/addOrders")
    @ResponseBody
    public boolean addOrders(HttpServletRequest request,Orders Orders){
        boolean re = false;
        Student student = (Student)request.getSession().getAttribute("student");
        if(student!=null){
            Orders.setSid(student.getId());
            Orders.setCreate_time(new  SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
            Orders.setOrder_no(getRno());
            Map<String,Object> maps = new HashMap<>();
            maps.put("sid",student.getId());
            List<Cart> cartList = goodsService.selectCartList(maps);
            int total = 0;
            int nums = 0;
            for(Cart cart : cartList){
                Goods goods = goodsService.selectGoodsById(cart.getG_id());
                total += goods.getPrice()*cart.getQuantity()*goods.getDiscount()/10;
                nums += cart.getQuantity();
                Items items = new Items();
                items.setG_id(cart.getG_id());
                items.setOrder_no(Orders.getOrder_no());
                items.setQuantity(cart.getQuantity());
                service.addItems(items);
                goodsService.deleteCart(cart.getId());
                goodsService.updateGoodsQuantity(goods.getStock()-cart.getQuantity(),goods.getId());
            }
            Orders.setQuantity(nums);
            Orders.setTotal_price(total);
            service.addOrders(Orders);
            re = true;
        }


        return re;
    }


    public String getRno() {//生成订单号
        SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
        String newDate=sdf.format(new Date());
        String result="";
        Random random=new Random();
        for(int i=0;i<3;i++){
            result+=random.nextInt(10);
        }
        return newDate+result;

    }

    /**
     * 删除订单
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/deleteOrders")
    public boolean deleteOrders(Integer id ,HttpServletRequest request,
                              HttpServletResponse response){
        boolean re = false;
        service.deleteItems(id);
        service.deleteOrders(id);
        re = true;
        return re;
    }


    @RequestMapping("/selectOrdersStatics")
    @ResponseBody
    public List<Statics> selectInOrderStatics() {
        return service.selectInOrderStatics();
    }

}
