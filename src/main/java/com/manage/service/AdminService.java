package com.manage.service;

import com.manage.entity.Admin;

public interface AdminService {
    Admin login(String username, String password);
}