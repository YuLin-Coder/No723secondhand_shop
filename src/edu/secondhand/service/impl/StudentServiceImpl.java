package edu.secondhand.service.impl;

import edu.secondhand.dao.StudentDao;
import edu.secondhand.entity.Admin;
import edu.secondhand.entity.Cart;
import edu.secondhand.entity.Student;
import edu.secondhand.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    StudentDao dao;

    @Override
    public void addStudent(Student student) {
        dao.addStudent(student);
    }

    @Override
    public Admin selectAdmin(String username, String password) {
        return   dao.selectAdmin(username,password);
    }

    @Override
    public Student selectStudent(String username, String password) {
        return   dao.selectStudent(username,password);
    }

    @Override
    public List<Student> selectStudentList(Map<String, Object> maps) {
        return   dao.selectStudentList(maps);
    }

    @Override
    public Student selectStudentByPhone(Student student) {
        return   dao.selectStudentByPhone(student);
    }

    @Override
    public void deleteStudent(int id) {
        dao.deleteStudent(id);
    }

    @Override
    public Student selectStudentById(int id) {
        return  dao.selectStudentById(id);
    }

    @Override
    public void updateStudent(Student student) {
        dao.updateStudent(student);
    }

    @Override
    public void updateAdminPassword(String newpass, Integer id) {
        dao.updateAdminPassword(newpass,id);
    }


}
