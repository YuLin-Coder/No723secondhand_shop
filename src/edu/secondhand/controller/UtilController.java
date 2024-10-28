package edu.secondhand.controller;

import edu.secondhand.entity.Items;
import edu.secondhand.entity.Orders;
import edu.secondhand.entity.Statics;
import edu.secondhand.service.GoodsService;
import edu.secondhand.service.OrdersService;
import edu.secondhand.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class UtilController {
    @Autowired
    OrdersService service;
    @Autowired
    StudentService studentService;
    @Autowired
    GoodsService goodsService;

    //跳转至登陆界面
    @RequestMapping("toLogin")
    public String toLogin(HttpSession session) {
        session.removeAttribute("admin");
        session.removeAttribute("student");
        return "views/login";
    }

    @RequestMapping("toLoginOutAct")
    public String toLoginOutAct(HttpSession session) {
        session.removeAttribute("admin");
        session.removeAttribute("student");
        return "views/login";
    }

    //跳转到控制页console.jsp
    @RequestMapping("toConsoleAct")
    public String toWelocmeAct() {
        return "views/console";
    }

    @RequestMapping("toMain")
    public String toMain(HttpServletRequest request) {
        Map<String, Object> maps = new HashMap<>();
        List<Orders> ordersList = service.selectOrdersList(maps);
        for (Orders orders : ordersList) {
            orders.setStudent(studentService.selectStudentById(orders.getSid()));
            List<Items> itemsList = service.selectItemList(orders.getOrder_no());
            for (Items items : itemsList) {
                items.setGoods(goodsService.selectGoodsById(items.getG_id()));
            }
            orders.setItems(itemsList);
        }
        List<Statics> statics = service.selectStaticsTwo();
        request.setAttribute("ordersList", ordersList);
        request.setAttribute("statics", statics.size() > 0 ? statics.subList(0, 1) : statics);
        return "views/main";
    }

    @RequestMapping("toEcharts")
    public String toEcharts(HttpServletRequest request) {
        return "views/echarts";
    }

    //图片上传测试
    @ResponseBody
    @RequestMapping("/upload")
    public Map upload2(MultipartFile file, HttpServletRequest request) {
        String prefix = "";
        String dateStr = "";
        //保存上传
        OutputStream out = null;
        InputStream fileInput = null;
        try {
            if (file != null) {
                String originalName = file.getOriginalFilename();
                prefix = originalName.substring(originalName.lastIndexOf(".") + 1);
                Date date = new Date();
                String uuid = UUID.randomUUID() + "";
                SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
                dateStr = simpleDateFormat.format(date);
                String filepath = "D:\\upload\\" + dateStr + "\\" + uuid + "." + prefix;
                File files = new File(filepath);
                //打印查看上传路径
                System.out.println(filepath);
                if (!files.getParentFile().exists()) {
                    files.getParentFile().mkdirs();
                }
                file.transferTo(files);
                Map<String, Object> map2 = new HashMap<>();
                Map<String, Object> map = new HashMap<>();
                map.put("code", 0);
                map.put("msg", "");
                map.put("data", map2);
                map2.put("src", dateStr + "/" + uuid + "." + prefix);
                return map;
            }
        } catch (Exception e) {
        } finally {
            try {
                if (out != null) {
                    out.close();
                }
                if (fileInput != null) {
                    fileInput.close();
                }
            } catch (Exception e) {
            }
        }
        Map<String, Object> map = new HashMap<>();
        map.put("code", 1);
        map.put("msg", "");
        return map;
    }
}
