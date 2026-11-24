package com.manage.service;
import com.manage.entity.Score;
import java.util.List;

public interface ScoreService {
    List<Score> findByStuId(Integer stuId);
    int addScore(Score score);
    Score findById(Integer id);
    int editScore(Score score);
    int delScore(Integer id);
    List<Score> findAll();
}