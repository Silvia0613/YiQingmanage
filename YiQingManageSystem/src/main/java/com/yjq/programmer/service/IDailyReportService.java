package com.yjq.programmer.service;

import com.yjq.programmer.domain.DailyReport;
import com.yjq.programmer.domain.Page;
import com.yjq.programmer.vo.ResponseVo;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * @author 杨杨吖
 * @QQ 823208782
 * @WX yjqi12345678
 * @create 2022-02-22 13:39
 */
public interface IDailyReportService {

    // 封装分页数据
    ResponseVo<Page> getPage(Page page, Date createTime);

    // 获取日常打卡列表数据
    ResponseVo<List<DailyReport>> list(Date createTime, Page page);

    // 保存日常打卡信息
    ResponseVo<Boolean> save(DailyReport dailyReport);

    // 删除日常打卡信息
    ResponseVo<Boolean> delete(String id);

    // 导出日常打卡Excel文件
    ResponseVo<Boolean> exportExcel(Date createTime);

    // 前台保存日常打卡操作
    ResponseVo<Boolean> webSaveDailyReport(DailyReport dailyReport, HttpServletRequest request);

    // 获取日常打卡的总数
    ResponseVo<Integer> getDailyReportTotal();

    // 根据用户id获取日常打卡信息
    ResponseVo<List<DailyReport>> getDailyReportByUserId(HttpServletRequest request);

    // 根据id获取日常打卡信息
    ResponseVo<DailyReport> getDailyReportById(String id);

}
