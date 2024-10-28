package edu.secondhand.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.secondhand.entity.*;
import edu.secondhand.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class IndexController {

    @Autowired
    GoodsService goodsService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    BoardService boardService;

    @Autowired
    StudentService studentService;

    @Autowired
    OrdersService ordersService;

    @Autowired
    ProductService productService;

    @Autowired
    CommentsService commentsService;

    /**
     * 主页面
     */
    @RequestMapping("/toIndex")
    public ModelAndView toIndex(HttpServletRequest request){
        Student student = (Student)request.getSession().getAttribute("student");
        Map<String,Object> maps = new HashMap<>();
        List<Category> categoryList = categoryService.selectCategoryList(maps);
        request.getSession().setAttribute("categoryList",categoryList);
        List<Goods> goodsList = goodsService.selectGoodsList(maps);
        request.setAttribute("goodsList",goodsList);
        if(student!=null){
            maps.put("sid",student.getId());
            List<Cart> cartList = goodsService.selectCartList(maps);
            Integer totalMoney = 0;
            Integer totalNums = 0;
            for(Cart cart:cartList){
                cart.setGoods(goodsService.selectGoodsById(cart.getG_id()));
                totalMoney += cart.getQuantity()*cart.getGoods().getPrice();
                totalNums += cart.getQuantity();
            }
            request.setAttribute("cartList",cartList);
            request.setAttribute("totalNums",totalNums);
            request.setAttribute("totalMoney",totalMoney);
        }
        request.getSession().setAttribute("url","toIndex");
        return new ModelAndView("views/index/index");
    }





    /**
     * 物品查询页面
     */
    @RequestMapping("/toSearchIndex")
    public ModelAndView toSearchIndex(@RequestParam(defaultValue="1") Integer currentPage, HttpServletRequest request,
                                      Map<String,Object> map){
        request.getSession().setAttribute("url","toSearchIndex");
        String orderBy = request.getParameter("orderBy");
        Student student = (Student)request.getSession().getAttribute("student");
        Map<String,Object> maps = new HashMap<>();
        List<Category> categoryList = categoryService.selectCategoryList(maps);
        request.getSession().setAttribute("categoryList",categoryList);
        String key = request.getParameter("key");
        String type = request.getParameter("type");
        List<Goods> list = new ArrayList<>();
        Map<String,Object> dataMap = new HashMap<>();
        dataMap.put("key", key);
        dataMap.put("type", type);
        dataMap.put("index", 1);
        PageHelper.startPage(currentPage,8);
        list=goodsService.selectGoodsList(dataMap);
        PageInfo<Goods> pageInfo=new PageInfo<Goods>(list,8);
        request.getSession().setAttribute("key",key);
        request.setAttribute("pageInfo",pageInfo);
        if(student!=null){
            maps.put("sid",student.getId());
            List<Cart> cartList = goodsService.selectCartList(maps);
            Integer totalMoney = 0;
            Integer totalNums = 0;
            for(Cart cart:cartList){
                cart.setGoods(goodsService.selectGoodsById(cart.getG_id()));
                totalMoney += cart.getQuantity()*cart.getGoods().getPrice();
                totalNums += cart.getQuantity();
            }
            request.setAttribute("cartList",cartList);
            request.setAttribute("totalNums",totalNums);
            request.setAttribute("totalMoney",totalMoney);
        }
        return new ModelAndView("views/index/search_index");
    }


    /**
     * 失物页面页面
     */
    @RequestMapping("/toSearchProduct")
    public ModelAndView toSearchProduct(@RequestParam(defaultValue="1") Integer currentPage, HttpServletRequest request,
                                      Map<String,Object> map){
        request.getSession().setAttribute("url","toSearchProduct");
        Student student = (Student)request.getSession().getAttribute("student");
        Map<String,Object> maps = new HashMap<>();
        List<Category> categoryList = categoryService.selectCategoryList(maps);
        request.getSession().setAttribute("categoryList",categoryList);
        List<Product> list = new ArrayList<>();
        Map<String,Object> dataMap = new HashMap<>();
        PageHelper.startPage(currentPage,8);
        list=productService.selectProductList(dataMap);
        PageInfo<Product> pageInfo=new PageInfo<Product>(list,8);
        request.setAttribute("pageInfo",pageInfo);
        if(student!=null){
            maps.put("sid",student.getId());
            List<Cart> cartList = goodsService.selectCartList(maps);
            Integer totalMoney = 0;
            Integer totalNums = 0;
            for(Cart cart:cartList){
                cart.setGoods(goodsService.selectGoodsById(cart.getG_id()));
                totalMoney += cart.getQuantity()*cart.getGoods().getPrice();
                totalNums += cart.getQuantity();
            }
            request.setAttribute("cartList",cartList);
            request.setAttribute("totalNums",totalNums);
            request.setAttribute("totalMoney",totalMoney);
        }
        return new ModelAndView("views/index/product_index");
    }


    //商品详情页
    @RequestMapping("/toDetail")
    public ModelAndView toDetail(Integer gid, HttpServletRequest request){
        request.getSession().setAttribute("url","toSearchIndex");
        String add = request.getParameter("add");
        String com = request.getParameter("com");
        request.setAttribute("add",add);
        Student student = (Student)request.getSession().getAttribute("student");
        Map<String,Object> maps = new HashMap<>();
        List<Category> categoryList = categoryService.selectCategoryList(maps);
        request.getSession().setAttribute("categoryList",categoryList);
        Goods goods = goodsService.selectGoodsById(gid);
        request.setAttribute("goods",goods);
        request.setAttribute("com",com);
        Map<String,Object> param = new HashMap<>();
        param.put("gid",gid);
        List<Comments> commentsList = commentsService.selectCommentsList(param);
        for(Comments cc:commentsList){
            cc.setStudent(studentService.selectStudentById(cc.getSid()));
        }
        request.setAttribute("commentsList",commentsList);
        if(student!=null){
            maps.put("sid",student.getId());
            List<Cart> cartList = goodsService.selectCartList(maps);
            Integer totalMoney = 0;
            Integer totalNums = 0;
            for(Cart cart:cartList){
                cart.setGoods(goodsService.selectGoodsById(cart.getG_id()));
                totalMoney += cart.getQuantity()*cart.getGoods().getPrice();
                totalNums += cart.getQuantity();
            }
            request.setAttribute("cartList",cartList);
            request.setAttribute("totalNums",totalNums);
            request.setAttribute("totalMoney",totalMoney);
        }

        return new ModelAndView("views/index/detail");
    }

    //失物详情页
    @RequestMapping("/toProductDetail")
    public ModelAndView toProductDetail(Integer gid, HttpServletRequest request){
        request.getSession().setAttribute("url","toSearchProduct");
        Student student = (Student)request.getSession().getAttribute("student");
        Map<String,Object> maps = new HashMap<>();
        List<Category> categoryList = categoryService.selectCategoryList(maps);
        request.getSession().setAttribute("categoryList",categoryList);
        Product product = productService.selectProductById(gid);
        request.setAttribute("product",product);
        if(student!=null){
            maps.put("sid",student.getId());
            List<Cart> cartList = goodsService.selectCartList(maps);
            Integer totalMoney = 0;
            Integer totalNums = 0;
            for(Cart cart:cartList){
                cart.setGoods(goodsService.selectGoodsById(cart.getG_id()));
                totalMoney += cart.getQuantity()*cart.getGoods().getPrice();
                totalNums += cart.getQuantity();
            }
            request.setAttribute("cartList",cartList);
            request.setAttribute("totalNums",totalNums);
            request.setAttribute("totalMoney",totalMoney);
        }

        return new ModelAndView("views/index/product_detail");
    }


    //个人信息
    @RequestMapping("/toMine")
    public ModelAndView toMine(Integer pid, HttpServletRequest request){
        request.getSession().setAttribute("url","toMine");
        Student student = (Student)request.getSession().getAttribute("student");
        if(student!=null){
            Student data = studentService.selectStudentById(student.getId());
            request.getSession().setAttribute("student",data);
        }
        if(student!=null){
            Map<String,Object> maps = new HashMap<>();
            maps.put("sid",student.getId());
            List<Cart> cartList = goodsService.selectCartList(maps);
            Integer totalMoney = 0;
            Integer totalNums = 0;
            for(Cart cart:cartList){
                cart.setGoods(goodsService.selectGoodsById(cart.getG_id()));
                totalMoney += cart.getQuantity()*cart.getGoods().getPrice();
                totalNums += cart.getQuantity();
            }
            request.setAttribute("cartList",cartList);
            request.setAttribute("totalNums",totalNums);
            request.setAttribute("totalMoney",totalMoney);
        }
        return new ModelAndView("views/index/myinfo");
    }



    //公告列表
    @RequestMapping("/toBoard")
    public ModelAndView toBoard(HttpServletRequest request){
        request.getSession().setAttribute("url","toBoard");
        Student student = (Student)request.getSession().getAttribute("student");
        String bid = request.getParameter("bid");
        String search = request.getParameter("search");
        Map<String,Object> maps = new HashMap<>();

        maps.put("search",search);
        List<Board> boardList = boardService.selectBoardList(maps);
        request.setAttribute("boardList",boardList);
        if(bid !=null && !bid.equals("")){
            Board board = boardService.selectBoardById(Integer.parseInt(bid));
            request.setAttribute("board",board);
        }else{
            request.setAttribute("board",boardList.size()>0?boardList.get(0):null);
        }
        if(student!=null){
            maps.put("sid",student.getId());
            List<Cart> cartList = goodsService.selectCartList(maps);
            Integer totalMoney = 0;
            Integer totalNums = 0;
            for(Cart cart:cartList){
                cart.setGoods(goodsService.selectGoodsById(cart.getG_id()));
                totalMoney += cart.getQuantity()*cart.getGoods().getPrice();
                totalNums += cart.getQuantity();
            }
            request.setAttribute("cartList",cartList);
            request.setAttribute("totalNums",totalNums);
            request.setAttribute("totalMoney",totalMoney);
        }
        return new ModelAndView("views/index/board");
    }


    //购物车
    @RequestMapping("/toCart")
    public ModelAndView toCart(HttpServletRequest request){
        request.getSession().setAttribute("url","toCart");
        Student student = (Student)request.getSession().getAttribute("student");
        Map<String,Object> maps = new HashMap<>();
        if(student!=null){
            maps.put("sid",student.getId());
            List<Cart> cartList = goodsService.selectCartList(maps);
            Integer totalMoney = 0;
            Integer totalNums = 0;
            for(Cart cart:cartList){
                cart.setGoods(goodsService.selectGoodsById(cart.getG_id()));
                totalMoney += cart.getQuantity()*cart.getGoods().getPrice();
                totalNums += cart.getQuantity();
            }
            request.setAttribute("cartList",cartList);
            request.setAttribute("totalNums",totalNums);
            request.setAttribute("totalMoney",totalMoney);
        }
        return new ModelAndView("views/index/cart");
    }

    //我的订单
    @RequestMapping("/toOrder")
    public ModelAndView toOrder(HttpServletRequest request){
        request.getSession().setAttribute("url","toOrder");
        Student student = (Student)request.getSession().getAttribute("student");
        Map<String,Object> maps = new HashMap<>();
        if(student!=null){
            maps.put("sid",student.getId());
            List<Items> itemsList = ordersService.selectItemListByMap(maps);
            for(Items Items:itemsList){
                Items.setGoods(goodsService.selectGoodsById(Items.getG_id()));
                Items.setOrders(ordersService.selectOrdersByNo(Items.getOrder_no()));
            }
            request.setAttribute("itemsList",itemsList);

            List<Cart> cartList = goodsService.selectCartList(maps);
            Integer totalMoney = 0;
            Integer totalNums = 0;
            for(Cart cart:cartList){
                cart.setGoods(goodsService.selectGoodsById(cart.getG_id()));
                totalMoney += cart.getQuantity()*cart.getGoods().getPrice();
                totalNums += cart.getQuantity();
            }
            request.setAttribute("cartList",cartList);
            request.setAttribute("totalNums",totalNums);
            request.setAttribute("totalMoney",totalMoney);
        }
        return new ModelAndView("views/index/order");
    }


    //去注册
    @RequestMapping("/toRegister")
    public ModelAndView toRegister(Integer pid, HttpServletRequest request){
        return new ModelAndView("views/index/register");
    }

    //去发布物品
    @RequestMapping("/toIndexAddGoods")
    public ModelAndView toIndexAddGoods(Integer pid, HttpServletRequest request){
        request.getSession().setAttribute("url","toIndexAddGoods");
        Map<String,Object> maps = new HashMap<>();
        List<Category> categoryList = categoryService.selectCategoryList(maps);
        request.getSession().setAttribute("categoryList",categoryList);
        return new ModelAndView("views/index/add");
    }

    //去发布失物
    @RequestMapping("/toIndexAddProduct")
    public ModelAndView toIndexAddProduct(Integer pid, HttpServletRequest request){
        request.getSession().setAttribute("url","toIndexAddProduct");
        Map<String,Object> maps = new HashMap<>();
        return new ModelAndView("views/index/add_product");
    }



    /**
     * 新增购物车
     * @param Cart
     * @return
     */
    @RequestMapping("/addCart")
    @ResponseBody
    public boolean addCart(HttpServletRequest request, Cart Cart){
        boolean re = false;
        Student student = (Student)request.getSession().getAttribute("student");
        Goods goods = goodsService.selectGoodsById(Cart.getG_id());
        if(student !=null){
            Cart.setSid(student.getId());
            Cart data = goodsService.selectCartByUidAndGid(Cart);
            if(data == null){
                if(goods.getStock()>=Cart.getQuantity()){
                    goodsService.addCart(Cart);
                    re = true;
                }
            }else{
                if(goods.getStock()>=(Cart.getQuantity()+data.getQuantity())){
                    data.setQuantity(Cart.getQuantity()+data.getQuantity());
                    goodsService.updateCart(data);
                    re = true;
                }
            }
        }
        return re;
    }
    /**
     * 删除购物车
     * @return
     */
    @RequestMapping("/deleteCart")
    @ResponseBody
    public boolean deleteCart(HttpServletRequest request, Integer id){
        boolean re = false;
        goodsService.deleteCart(id);
        re = true;
        return re;
    }


}
