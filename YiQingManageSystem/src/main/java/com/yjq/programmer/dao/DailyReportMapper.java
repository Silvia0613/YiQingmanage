package com.yjq.programmer.dao;

import com.yjq.programmer.domain.DailyReport;
import com.yjq.programmer.domain.DailyReportExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DailyReportMapper {
    int countByExample(DailyReportExample example);

    int deleteByExample(DailyReportExample example);

    int deleteByPrimaryKey(String id);

    int insert(DailyReport record);

    int insertSelective(DailyReport record);

    List<DailyReport> selectByExample(DailyReportExample example);

    DailyReport selectByPrimaryKey(String id);

    int updateByExampleSelective(@Param("record") DailyReport record, @Param("example") DailyReportExample example);

    int updateByExample(@Param("record") DailyReport record, @Param("example") DailyReportExample example);

    int updateByPrimaryKeySelective(DailyReport record);

    int updateByPrimaryKey(DailyReport record);
}
