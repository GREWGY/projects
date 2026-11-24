package com.manage.service.impl;

import com.manage.entity.Student;
import com.manage.mapper.StudentMapper;
import com.manage.service.StudentService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    @Resource
    private StudentMapper studentMapper;

    @Override
    public List<Student> findAll() {
        return studentMapper.selectAll();
    }

    @Override
    public Student findById(Integer id) {
        return studentMapper.selectById(id);
    }

    @Override
    public int addStudent(Student student) {
        return studentMapper.insert(student);
    }

    @Override
    public int editStudent(Student student) {
        return studentMapper.update(student);
    }

    @Override
    public int delStudent(Integer id) {
        return studentMapper.delete(id);
    }
}