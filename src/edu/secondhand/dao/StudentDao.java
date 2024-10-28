package edu.secondhand.dao;

import edu.secondhand.entity.Admin;
import edu.secondhand.entity.Cart;
import edu.secondhand.entity.Student;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface StudentDao {
    void updateStudent(@Param("Student") Student student);

    Student selectStudentById(@Param("id")int id);

    void deleteStudent(@Param("id")int id);

    Student selectStudentByPhone(@Param("Student")Student student);

    List<Student> selectStudentList(@Param("map")Map<String, Object> maps);

    Student selectStudent(@Param("username")String username,@Param("password") String password);

    Admin selectAdmin(@Param("username")String username,@Param("password") String password);

    void addStudent(@Param("Student")Student student);

    void updateAdminPassword(@Param("newpass")String newpass,@Param("Student") Integer id);

}
