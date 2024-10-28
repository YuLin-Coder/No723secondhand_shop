package edu.secondhand.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.secondhand.entity.Admin;
import edu.secondhand.entity.Board;
import edu.secondhand.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;


@RestController
public class BoardController {

    @Autowired
    BoardService service;

    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm");


    /**
     * 公告列表
     * @param currentPage
     * @param request
     * @param map
     * @return
     */
    @RequestMapping("/BoardList")
    public ModelAndView BoardList(
            @RequestParam(defaultValue="1") Integer currentPage, HttpServletRequest request,
            Map<String,Object> map){
        String key = request.getParameter("key");
        String state = request.getParameter("state");
        List<Board> list = new ArrayList<>();
        Map<String,Object> maps = new HashMap<>();
        maps.put("key", key);
        maps.put("state", state);
        PageHelper.startPage(currentPage,8);
        list=service.selectBoardList(maps);
        PageInfo<Board> pageInfo=new PageInfo<Board>(list,8);
        map.put("pageInfo", pageInfo);
        return new ModelAndView("views/board/list");
    }

    /**
     *
     * 去新增公告页面
     * @param request
     * @param mv
     * @return
     */
    @RequestMapping("/toAddBoard")
    public ModelAndView toAddBoard(HttpServletRequest request, ModelAndView mv){
        mv.setViewName("views/board/add");
        return mv;
    }

    /**
     * 新增公告
     * @param Board
     * @return
     */
    @RequestMapping("/addBoard")
    @ResponseBody
    public boolean addBoard(Board Board){
        Board.setCreate_time(new  SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
        boolean re = false;
        service.addBoard(Board);
        re = true;
        return re;
    }

    /**
     * 删除公告
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/deleteBoard")
    public boolean deleteBoard(Integer id ,HttpServletRequest request,
                              HttpServletResponse response){
        boolean re = false;
        service.deleteBoard(id);
        re = true;
        return re;
    }

    /**
     * 去修改公告页面
     * @param id
     * @param request
     * @param mv
     * @return
     */
    @RequestMapping("/toUpdateBoard")
    public ModelAndView toUpdateBoard(Integer id ,HttpServletRequest request, ModelAndView mv){
        Board Board = service.selectBoardById(id);
        mv.addObject("data", Board);
        mv.setViewName("views/board/update");
        return mv;
    }


    /**
     * 修改公告
     * @param Board
     * @return
     */
    @RequestMapping("/updateBoard")
    @ResponseBody
    public boolean updateBoard(Board Board){
        boolean re = false;
        service.updateBoard(Board);
        re = true;
        return re;
    }
}
