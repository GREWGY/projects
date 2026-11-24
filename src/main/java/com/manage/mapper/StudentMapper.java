package com.manage.mapper;

import com.manage.entity.Student;

import java.util.List;

public interface StudentMapper {
    List<Student> selectAll();
    Student selectById(Integer id);
    int insert(Student student);
    int update(Student student);
    int delete(Integer id);
}