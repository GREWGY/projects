package com.manage.controller;

import com.manage.entity.Admin;
import com.manage.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource
    private AdminService adminService;

    // 跳转登录页
    @RequestMapping("/toLogin")
    public String toLogin(){
        return "login";
    }

    // 登录校验，成功跳 功能首页
    @RequestMapping("/login")
    public String login(String username, String password, Model model, HttpSession session){
        Admin admin = adminService.login(username, password);
        if(admin != null){
            session.setAttribute("admin",admin);
            // 登录成功跳 首页接口 /admin/toIndex
            return "redirect:/admin/toIndex";
        }else{
            model.addAttribute("msg","账号或密码错误！");
            return "login";
        }
    }

    // 统一入口：返回系统功能首页
    @RequestMapping("/toIndex")
    public String toIndex(){
        return "index";
    }

    // 退出登录 → 回到登录页
    @RequestMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/admin/toLogin";
    }
}