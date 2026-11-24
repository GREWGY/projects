package com.manage.mapper;
import com.manage.entity.Score;
import org.apache.ibatis.annotations.Param;
import java.util.List;

public interface ScoreMapper {
    List<Score> selectByStuId(@Param("stuId") Integer stuId);
    int insert(Score score);
    Score selectById(@Param("id") Integer id);
    int updateById(Score score);
    int deleteById(@Param("id") Integer id);
    List<Score> selectAll();
}