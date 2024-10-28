package edu.secondhand.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import edu.secondhand.entity.Admin;
import edu.secondhand.entity.Student;
import edu.secondhand.service.StudentService;
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
public class StudentController {

    @Autowired
    StudentService service;

    SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm");

    /**
     * 注册
     * @param student
     * @param mv
     * @return
     */
    @RequestMapping("/registerStudent")
    public ModelAndView registerStudent(Student student, ModelAndView mv){
        student.setRegiste_time(simpleDateFormat.format(new Date()));
        service.addStudent(student);
        mv.setViewName("view/login");
        return mv;
    }

    /**
     * 登录
     * @param username
     * @param request
     * @param password
     * @param session
     * @param response
     * @param mv
     * @return
     * @throws ServletException
     * @throws IOException
     */
    @RequestMapping("/login")
    @ResponseBody
    public  String login(@RequestParam("username")String username,
                         HttpServletRequest request, @RequestParam("password")String password,
                         HttpSession session, HttpServletResponse response, ModelAndView mv) throws ServletException, IOException {
        session.removeAttribute("admin");
        session.removeAttribute("student");
        String type=request.getParameter("type").toString();
        request.getSession().setAttribute("type", type);
        String message = "error";
        if(type != null && type.equals("1")){
            Admin admin1 = service.selectAdmin(username,password);
            if(admin1 != null){
                request.getSession().setAttribute("admin", admin1);
                message = "ok";
            }
        }else if(type != null && type.equals("2")){
            Student te = service.selectStudent(username,password);
            if(te != null){
                request.getSession().setAttribute("student", te);
                message = "toIndex";
            }
        }
        return message;

    }

    /**
     * 学生列表
     * @param currentPage
     * @param request
     * @param map
     * @return
     */
    @RequestMapping("/StudentList")
    public ModelAndView StudentList(
            @RequestParam(defaultValue="1") Integer currentPage, HttpServletRequest request,
            Map<String,Object> map){
        String key = request.getParameter("key");
        String state = request.getParameter("state");
        List<Student> list = new ArrayList<>();
        Map<String,Object> maps = new HashMap<>();
        maps.put("key", key);
        maps.put("state", state);
        PageHelper.startPage(currentPage,8);
        list=service.selectStudentList(maps);
        PageInfo<Student> pageInfo=new PageInfo<Student>(list,8);
        map.put("pageInfo", pageInfo);
        return new ModelAndView("views/student/list");
    }

    /**
     * 去新增学生页面
     * @param request
     * @param mv
     * @return
     */
    @RequestMapping("/toAddStudent")
    public ModelAndView toAddStudent(HttpServletRequest request, ModelAndView mv){
        mv.setViewName("views/student/add");
        return mv;
    }

    /**
     * 新增学生
     * @param Student
     * @return
     */
    @RequestMapping("/addStudent")
    @ResponseBody
    public boolean addStudent(Student Student){
        Student.setRegiste_time(new  SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
        boolean re = false;
        Student student = service.selectStudentByPhone(Student);
        if(student ==null){
            service.addStudent(Student);
            re = true;
        }
        return re;
    }

 /*   @RequestMapping("/updateInfo")
    @ResponseBody
    public boolean updateInfo(HttpServletRequest request,Student ss){
        boolean re = false;
        service.updateStudent(ss);
        re = true;
        Student student = service.selectStudentById(ss.getId().toString());
        request.getSession().setAttribute("student", student);
        return re;
    }*/

    /**
     * 删除学生
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/deleteStudent")
    public boolean deleteStudent(Integer id ,HttpServletRequest request,
                              HttpServletResponse response){
        boolean re = false;
        service.deleteStudent(id);
        re = true;
        return re;
    }


    /**
     * 去修改学生页面
     * @param id
     * @param request
     * @param mv
     * @return
     */
    @RequestMapping("/toUpdateStudent")
    public ModelAndView toUpdateStudent(Integer id ,HttpServletRequest request, ModelAndView mv){
        Student Student = service.selectStudentById(id);
        mv.addObject("data", Student);
        mv.setViewName("views/student/update");
        return mv;
    }


    /**
     * 修改学生
     * @param Student
     * @return
     */
    @RequestMapping("/updateStudent")
    @ResponseBody
    public boolean updateStudent(Student Student){
        boolean re = false;
        service.updateStudent(Student);
        re = true;
        return re;
    }


    /**
     * 去修改管理员页面
     * @param request
     * @param mv
     * @return
     */
    @RequestMapping("/toUpdateAdminPassword")
    public ModelAndView toUpdateAdminPassword(HttpServletRequest request,ModelAndView mv){
        mv.setViewName("views/admin/updatePassword");
        return mv;
    }


    /**
     * 修改管理员密码
     * @param request
     * @return
     */
    @RequestMapping("/updateAdminPassword")
    @ResponseBody
    public boolean updateAdminPassword(HttpServletRequest request){
        boolean re = false;
        Admin admin = (Admin)request.getSession().getAttribute("admin");
        String nowpass = request.getParameter("nowpass");
        String newpass = request.getParameter("newpass");
        if(admin !=null && admin.getPassword().equals(nowpass)) {
            service.updateAdminPassword(newpass,admin.getId());
            re = true;
        }
        return re;
    }

}
