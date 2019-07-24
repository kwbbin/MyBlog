package com.kwbbin.dao;

import com.kwbbin.bean.Student;
import org.springframework.stereotype.Repository;

@Repository
public interface IStudentDao {
    public void addStudent(Student student);
}
