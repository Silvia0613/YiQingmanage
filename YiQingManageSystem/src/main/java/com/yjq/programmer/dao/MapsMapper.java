package com.yjq.programmer.dao;

import com.yjq.programmer.domain.Maps;
import com.yjq.programmer.domain.MapsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MapsMapper {
    int countByExample(MapsExample example);

    int deleteByExample(MapsExample example);

    int deleteByPrimaryKey(String id);

    int insert(Maps record);

    int insertSelective(Maps record);

    List<Maps> selectByExample(MapsExample example);

    Maps selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") Maps record, @Param("example") MapsExample example);

    int updateByExample(@Param("record") Maps record, @Param("example") MapsExample example);

    int updateByPrimaryKeySelective(Maps record);

    int updateByPrimaryKey(Maps record);
}
