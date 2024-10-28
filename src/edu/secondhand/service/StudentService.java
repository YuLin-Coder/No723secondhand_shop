package edu.secondhand.service;


import edu.secondhand.entity.Admin;
import edu.secondhand.entity.Cart;
import edu.secondhand.entity.Student;

import java.util.List;
import java.util.Map;

public interface StudentService {
    void addStudent(Student student);

    Admin selectAdmin(String username, String password);

    Student selectStudent(String username, String password);

    List<Student> selectStudentList(Map<String, Object> maps);

    Student selectStudentByPhone(Student student);

    void deleteStudent(int id);

    Student selectStudentById(int id);

    void updateStudent(Student student);

    void updateAdminPassword(String newpass, Integer id);

}
