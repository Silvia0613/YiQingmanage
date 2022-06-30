package com.yjq.programmer.dao;

import com.yjq.programmer.domain.Clue;
import com.yjq.programmer.domain.ClueExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ClueMapper {
    int countByExample(ClueExample example);

    int deleteByExample(ClueExample example);

    int deleteByPrimaryKey(String id);

    int insert(Clue record);

    int insertSelective(Clue record);

    List<Clue> selectByExample(ClueExample example);

    Clue selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") Clue record, @Param("example") ClueExample example);

    int updateByExample(@Param("record") Clue record, @Param("example") ClueExample example);

    int updateByPrimaryKeySelective(Clue record);

    int updateByPrimaryKey(Clue record);
}
