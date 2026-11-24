package com.manage.service.impl;
import com.manage.entity.Score;
import com.manage.mapper.ScoreMapper;
import com.manage.service.ScoreService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import javax.annotation.Resource;
import java.util.List;

@Service
public class ScoreServiceImpl implements ScoreService {
    @Resource
    private ScoreMapper scoreMapper;

    @Override
    public List<Score> findByStuId(Integer stuId) {
        return scoreMapper.selectByStuId(stuId);
    }

    @Override
    @Transactional
    public int addScore(Score score) {
        return scoreMapper.insert(score);
    }

    @Override
    public Score findById(Integer id) {
        return scoreMapper.selectById(id);
    }

    @Override
    @Transactional
    public int editScore(Score score) {
        return scoreMapper.updateById(score);
    }

    @Override
    @Transactional
    public int delScore(Integer id) {
        return scoreMapper.deleteById(id);
    }

    @Override
    public List<Score> findAll() {
        return scoreMapper.selectAll();
    }
}