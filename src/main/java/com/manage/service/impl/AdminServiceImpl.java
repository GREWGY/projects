package com.manage.service.impl;

import com.manage.entity.Admin;
import com.manage.mapper.AdminMapper;
import com.manage.service.AdminService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;

@Service
public class AdminServiceImpl implements AdminService {
    @Resource
    private AdminMapper adminMapper;

    @Override
    public Admin login(String username, String password) {
        return adminMapper.login(username, password);
    }
}