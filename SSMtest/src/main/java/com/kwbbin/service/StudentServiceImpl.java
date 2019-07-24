package com.kwbbin.service;

import com.kwbbin.bean.Student;
import com.kwbbin.dao.IStudentDao;

//@Service
public class StudentServiceImpl implements IStudentService {
//    @Autowired
    IStudentDao dao;

    public void addStudent(Student student) {
        dao.addStudent(student);
    }
}
