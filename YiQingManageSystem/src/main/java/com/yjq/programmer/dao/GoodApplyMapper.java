package com.yjq.programmer.dao;

import com.yjq.programmer.domain.GoodApply;
import com.yjq.programmer.domain.GoodApplyExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodApplyMapper {
    int countByExample(GoodApplyExample example);

    int deleteByExample(GoodApplyExample example);

    int deleteByPrimaryKey(String id);

    int insert(GoodApply record);

    int insertSelective(GoodApply record);

    List<GoodApply> selectByExample(GoodApplyExample example);

    GoodApply selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") GoodApply record, @Param("example") GoodApplyExample example);

    int updateByExample(@Param("record") GoodApply record, @Param("example") GoodApplyExample example);

    int updateByPrimaryKeySelective(GoodApply record);

    int updateByPrimaryKey(GoodApply record);
}
