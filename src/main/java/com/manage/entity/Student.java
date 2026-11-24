package com.manage.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Student {
    private Integer id;
    private String stuName;
    private String gender;
    private Integer age;
    private String stuClass;

    // 必须生成getter/setter
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getStuName() { return stuName; }
    public void setStuName(String stuName) { this.stuName = stuName; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public Integer getAge() { return age; }
    public void setAge(Integer age) { this.age = age; }

    public String getStuClass() { return stuClass; }
    public void setStuClass(String stuClass) { this.stuClass = stuClass; }
}