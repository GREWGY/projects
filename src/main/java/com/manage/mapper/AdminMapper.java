package com.manage.mapper;

import com.manage.entity.Admin;
import org.apache.ibatis.annotations.Param;

public interface AdminMapper {
    Admin login(@Param("username") String username, @Param("password") String password);
}