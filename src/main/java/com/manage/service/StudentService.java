package com.manage.service;

import com.manage.entity.Student;
import java.util.List;

public interface StudentService {
    List<Student> findAll();
    Student findById(Integer id);
    int addStudent(Student student);
    int editStudent(Student student);
    int delStudent(Integer id);
}