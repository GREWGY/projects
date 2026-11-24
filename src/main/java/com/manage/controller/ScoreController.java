package com.manage.controller;

import com.manage.entity.Score;
import com.manage.entity.Student;
import com.manage.service.ScoreService;
import com.manage.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/score")
public class ScoreController {

    @Autowired
    private ScoreService scoreService;

    @Autowired
    private StudentService studentService;

    // 成绩列表（支持按学生筛选）
    @RequestMapping("/list")
    public String list(Integer stuId, Model model){
        List<Score> scoreList;
        if(stuId != null){
            scoreList = scoreService.findByStuId(stuId);
            model.addAttribute("stuId", stuId);
        }else{
            scoreList = scoreService.findAll();
        }
        model.addAttribute("scoreList", scoreList);
        return "scoreList";
    }

    // 全部成绩总览
    @RequestMapping("/listAll")
    public String listAll(Model model){
        List<Score> scoreList = scoreService.findAll();
        model.addAttribute("scoreList",scoreList);
        return "scoreListAll";
    }

    // 跳转新增成绩页
    @RequestMapping("/toAdd")
    public String toAdd(Integer stuId, Model model){
        List<Student> studentList = studentService.findAll();
        model.addAttribute("studentList", studentList);
        model.addAttribute("stuId",stuId);
        return "scoreAdd";
    }

    // 提交新增成绩
    @RequestMapping("/add")
    public String add(Score score, RedirectAttributes ra){
        scoreService.addScore(score);
        ra.addFlashAttribute("msg", "新增成绩成功");
        return "redirect:/score/list?stuId="+score.getStuId();
    }

    // 跳转编辑成绩页
    @RequestMapping("/toEdit")
    public String toEdit(Integer id,Integer stuId, Model model){
        Score score = scoreService.findById(id);
        model.addAttribute("score",score);
        model.addAttribute("stuId",stuId);
        return "scoreEdit";
    }

    // 提交编辑成绩
    @RequestMapping("/edit")
    public String edit(Score score, RedirectAttributes ra){
        scoreService.editScore(score);
        ra.addFlashAttribute("msg", "修改成绩成功");
        return "redirect:/score/list?stuId="+score.getStuId();
    }

    // 删除成绩（修复跳转参数异常）
    @RequestMapping("/delete")
    public String delete(Integer id, Integer stuId, RedirectAttributes ra){
        scoreService.delScore(id);
        ra.addFlashAttribute("msg", "删除成绩成功");
        // 有stuId跳回对应学生成绩页，无则跳回全局成绩总览
        if(stuId != null){
            return "redirect:/score/list?stuId=" + stuId;
        }else{
            return "redirect:/score/listAll";
        }
    }
}