// 补全包声明，消除红色Missing package
package com.manage.controller;

import com.manage.entity.Student;
import com.manage.service.StudentService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;
import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {
    // 注入注解，消除未赋值警告
    @Resource
    private StudentService studentService;

    // 跳新增页面
    @RequestMapping("/toAdd")
    public String toAdd(){
        return "studentAdd";
    }

    // 提交新增学生，解决提交404
    @RequestMapping("/add")
    public String add(Student student){
        studentService.addStudent(student);
        return "redirect:/student/list";
    }

    // 学生列表
    @RequestMapping("/list")
    public String list(Model model){
        List<Student> stuList = studentService.findAll();
        model.addAttribute("stuList",stuList);
        return "studentList";
    }

    // 跳编辑页面
    @RequestMapping("/toEdit")
    public String toEdit(Integer id, Model model){
        Student stu = studentService.findById(id);
        model.addAttribute("stu",stu);
        return "studentEdit";
    }

    // 保存编辑
    @RequestMapping("/edit")
    public String edit(Student student){
        studentService.editStudent(student);
        return "redirect:/student/list";
    }

    // 删除学生
    @RequestMapping("/delete")
    public String delete(Integer id){
        studentService.delStudent(id);
        return "redirect:/student/list";
    }
}