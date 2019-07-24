package com.kwbbin.controller;

import com.kwbbin.bean.Student;
import com.kwbbin.dao.IStudentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HelloWorld {

//    @Autowired
//    IStudentService service;
    @Autowired
    IStudentDao dao;

    @RequestMapping("/helloworld")
    public String HelloWorld(){
        System.out.println("HelloWorld");
        return "success";
    }

    @RequestMapping("/addStudent")
    public void addStudent(){
        Student student=new Student("kwbbin","男");
        dao.addStudent(student);
        System.out.println("学生添加");
    }
}
