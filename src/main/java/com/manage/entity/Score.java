package com.manage.entity;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Score {
    private Integer id;
    private String course;
    private Integer score;
    private Integer stuId;
    // 关联学生基础信息
    private String stuName;
    private String gender;
    private Integer age;
    private String stuClass;
}