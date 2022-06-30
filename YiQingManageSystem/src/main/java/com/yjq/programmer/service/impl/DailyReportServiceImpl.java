package com.yjq.programmer.service.impl;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import com.github.pagehelper.PageHelper;
import com.yjq.programmer.bean.CodeMsg;
import com.yjq.programmer.constant.RuntimeConstant;
import com.yjq.programmer.dao.DailyReportMapper;
import com.yjq.programmer.dao.UserMapper;
import com.yjq.programmer.domain.*;
import com.yjq.programmer.enums.HealthStatusEnum;
import com.yjq.programmer.service.IDailyReportService;
import com.yjq.programmer.util.CommonUtil;
import com.yjq.programmer.util.UuidUtil;
import com.yjq.programmer.util.ValidateEntityUtil;
import com.yjq.programmer.vo.ResponseVo;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.List;

/**
 * @author 杨杨吖
 * @QQ 823208782
 * @WX yjqi12345678
 * @create 2022-02-22 13:39
 */
@Service
@Transactional
public class DailyReportServiceImpl implements IDailyReportService {

    @Resource
    private DailyReportMapper dailyReportMapper;

    @Resource
    private UserMapper userMapper;

    /**
     * 封装分页数据
     * @param page
     * @param createTime
     * @return
     */
    @Override
    public ResponseVo<Page> getPage(Page page, Date createTime) {
        DailyReportExample dailyReportExample = new DailyReportExample();
        if(createTime != null){
            String time = CommonUtil.getFormatterDate(createTime, "yyyy-MM-dd");
            String startTime = time + " 00:00:00";
            String endTime = time + " 23:59:59";
            dailyReportExample.createCriteria().andCreateTimeBetween(CommonUtil.getFormatterDate(startTime, "yyyy-MM-dd HH:mm:ss"), CommonUtil.getFormatterDate(endTime, "yyyy-MM-dd HH:mm:ss"));
        }
        page.setTotalCount(dailyReportMapper.countByExample(dailyReportExample));
        return ResponseVo.success(page);
    }

    /**
     * 获取日常打卡列表数据
     * @param createTime
     * @param page
     * @return
     */
    @Override
    public ResponseVo<List<DailyReport>> list(Date createTime, Page page) {
        DailyReportExample dailyReportExample = new DailyReportExample();
        if(createTime != null){
            // 进行了搜索
            String time = CommonUtil.getFormatterDate(createTime, "yyyy-MM-dd");
            String startTime = time + " 00:00:00";
            String endTime = time + " 23:59:59";
            dailyReportExample.createCriteria().andCreateTimeBetween(CommonUtil.getFormatterDate(startTime, "yyyy-MM-dd HH:mm:ss"), CommonUtil.getFormatterDate(endTime, "yyyy-MM-dd HH:mm:ss"));
        }
        dailyReportExample.setOrderByClause("create_time desc");
        PageHelper.startPage(page.getPage(), page.getRows());
        List<DailyReport> dailyReportList = dailyReportMapper.selectByExample(dailyReportExample);
        for(DailyReport dailyReport : dailyReportList){
            User user = userMapper.selectByPrimaryKey(dailyReport.getUserId());
            dailyReport.setUser(user);
        }
        return ResponseVo.success(dailyReportList);
    }

    /**
     * 保存日常打卡信息
     * @param dailyReport
     * @return
     */
    @Override
    public ResponseVo<Boolean> save(DailyReport dailyReport) {
        if(dailyReport == null){
            return ResponseVo.errorByMsg(CodeMsg.DATA_ERROR);
        }
        // 进行统一表单验证
        CodeMsg validate = ValidateEntityUtil.validate(dailyReport);
        if (!validate.getCode().equals(CodeMsg.SUCCESS.getCode())) {
            return ResponseVo.errorByMsg(validate);
        }
        if(CommonUtil.isEmpty(dailyReport.getId())){
            // 添加操作
            // 判断当前用户是否已经参与打卡
            DailyReportExample dailyReportExample = new DailyReportExample();
            String time = CommonUtil.getFormatterDate(new Date(), "yyyy-MM-dd");
            String startTime = time + " 00:00:00";
            String endTime = time + " 23:59:59";
            dailyReportExample.createCriteria().andUserIdEqualTo(dailyReport.getUserId()).andCreateTimeBetween(CommonUtil.getFormatterDate(startTime, "yyyy-MM-dd HH:mm:ss"), CommonUtil.getFormatterDate(endTime, "yyyy-MM-dd HH:mm:ss"));
            List<DailyReport> dailyReportList = dailyReportMapper.selectByExample(dailyReportExample);
            if(dailyReportList != null && dailyReportList.size() > 0) {
                return ResponseVo.errorByMsg(CodeMsg.USER_DAILY_REPORT_EXIST);
            }
            // 存储日常打卡数据
            dailyReport.setId(UuidUtil.getShortUuid());
            dailyReport.setCreateTime(new Date());
            if(dailyReportMapper.insertSelective(dailyReport) == 0){
                return ResponseVo.errorByMsg(CodeMsg.DAILY_REPORT_ADD_ERROR);
            }
        }else {
            // 修改操作
            if(dailyReportMapper.updateByPrimaryKeySelective(dailyReport) == 0){
                return ResponseVo.errorByMsg(CodeMsg.DAILY_REPORT_EDIT_ERROR);
            }
        }
        return ResponseVo.success(true);
    }

    /**
     * 删除日常打卡信息
     * @param id
     * @return
     */
    @Override
    public ResponseVo<Boolean> delete(String id) {
        if(CommonUtil.isEmpty(id)){
            return ResponseVo.errorByMsg(CodeMsg.DATA_ERROR);
        }
        // 删除日常打卡信息
        if(dailyReportMapper.deleteByPrimaryKey(id) == 0){
            return ResponseVo.errorByMsg(CodeMsg.DAILY_REPORT_DELETE_ERROR);
        }
        return ResponseVo.success(true);
    }

    /**
     * 导出日常打卡Excel文件
     * @param createTime
     * @return
     */
    @Override
    public ResponseVo<Boolean> exportExcel(Date createTime) {
        DailyReportExample dailyReportExample = new DailyReportExample();
        if(createTime != null){
            String time = CommonUtil.getFormatterDate(createTime, "yyyy-MM-dd");
            String startTime = time + " 00:00:00";
            String endTime = time + " 23:59:59";
            dailyReportExample.createCriteria().andCreateTimeBetween(CommonUtil.getFormatterDate(startTime, "yyyy-MM-dd HH:mm:ss"), CommonUtil.getFormatterDate(endTime, "yyyy-MM-dd HH:mm:ss"));
        }
        dailyReportExample.setOrderByClause("create_time desc");
        List<DailyReport> dailyReportList = dailyReportMapper.selectByExample(dailyReportExample);
        for(DailyReport dailyReport : dailyReportList){
            User user = userMapper.selectByPrimaryKey(dailyReport.getUserId());
            dailyReport.setUsername(user.getUsername());
            if(dailyReport.getHealthStatus().equals(HealthStatusEnum.HEALTH.getCode())){
                dailyReport.setStringHealthStatus(HealthStatusEnum.HEALTH.getDesc());
            }else if(dailyReport.getHealthStatus().equals(HealthStatusEnum.FEVER.getCode())){
                dailyReport.setStringHealthStatus(HealthStatusEnum.FEVER.getDesc());
            }else if(dailyReport.getHealthStatus().equals(HealthStatusEnum.OTHER.getCode())){
                dailyReport.setStringHealthStatus(HealthStatusEnum.OTHER.getDesc());
            }
        }
        // Excel配置
        Workbook workbook = ExcelExportUtil.exportExcel(new ExportParams("日常打卡情况汇总表","日常打卡情况汇总表"), DailyReport.class, dailyReportList);
        try{
            FileOutputStream outputStream = new FileOutputStream("D:\\日常打卡情况汇总表.xls");
            workbook.write(outputStream);
            outputStream.close();
            workbook.close();
        }catch(Exception e){
            e.printStackTrace();
            return ResponseVo.errorByMsg(CodeMsg.EXPORT_EXCEL_ERROR);
        }
        return ResponseVo.successByMsg(true, "导出Excel文件成功，导出位置：D:\\日常打卡情况汇总表.xls！");
    }

    /**
     * 前台保存日常打卡操作
     * @param dailyReport
     * @param request
     * @return
     */
    @Override
    public ResponseVo<Boolean> webSaveDailyReport(DailyReport dailyReport, HttpServletRequest request) {
        if(dailyReport == null){
            return ResponseVo.errorByMsg(CodeMsg.DATA_ERROR);
        }
        // 进行统一表单验证
        CodeMsg validate = ValidateEntityUtil.validate(dailyReport);
        if (!validate.getCode().equals(CodeMsg.SUCCESS.getCode())) {
            return ResponseVo.errorByMsg(validate);
        }
        User user = (User) request.getSession().getAttribute(RuntimeConstant.HOME_USER);
        if(user == null) {
            return ResponseVo.errorByMsg(CodeMsg.USER_SESSION_EXPIRED);
        }
        if(CommonUtil.isEmpty(dailyReport.getId())){
            // 添加操作
            dailyReport.setUserId(user.getId());
            // 判断当前用户是否已经参与打卡
            DailyReportExample dailyReportExample = new DailyReportExample();
            String time = CommonUtil.getFormatterDate(new Date(), "yyyy-MM-dd");
            String startTime = time + " 00:00:00";
            String endTime = time + " 23:59:59";
            dailyReportExample.createCriteria().andUserIdEqualTo(dailyReport.getUserId()).andCreateTimeBetween(CommonUtil.getFormatterDate(startTime, "yyyy-MM-dd HH:mm:ss"), CommonUtil.getFormatterDate(endTime, "yyyy-MM-dd HH:mm:ss"));
            List<DailyReport> dailyReportList = dailyReportMapper.selectByExample(dailyReportExample);
            if(dailyReportList != null && dailyReportList.size() > 0) {
                return ResponseVo.errorByMsg(CodeMsg.USER_DAILY_REPORT_EXIST);
            }
            // 存储日常打卡数据
            dailyReport.setId(UuidUtil.getShortUuid());
            dailyReport.setCreateTime(new Date());
            if(dailyReportMapper.insertSelective(dailyReport) == 0){
                return ResponseVo.errorByMsg(CodeMsg.DAILY_REPORT_ADD_ERROR);
            }
        } else {
            //修改操作
            if(dailyReportMapper.updateByPrimaryKeySelective(dailyReport) == 0){
                return ResponseVo.errorByMsg(CodeMsg.DAILY_REPORT_EDIT_ERROR);
            }
        }
        return ResponseVo.successByMsg(true, "日常打卡成功！");
    }

    /**
     * 获取日常打卡的总数
     * @return
     */
    @Override
    public ResponseVo<Integer> getDailyReportTotal() {
        Integer total = dailyReportMapper.countByExample(new DailyReportExample());
        return ResponseVo.success(total);
    }

    /**
     * 根据用户id获取日常打卡信息
     * @param request
     * @return
     */
    @Override
    public ResponseVo<List<DailyReport>> getDailyReportByUserId(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute(RuntimeConstant.HOME_USER);
        if(user == null){
            return ResponseVo.errorByMsg(CodeMsg.USER_SESSION_EXPIRED);
        }
        DailyReportExample dailyReportExample = new DailyReportExample();
        dailyReportExample.createCriteria().andUserIdEqualTo(user.getId());
        dailyReportExample.setOrderByClause("create_time desc");
        List<DailyReport> dailyReportList = dailyReportMapper.selectByExample(dailyReportExample);
        return ResponseVo.success(dailyReportList);
    }

    /**
     * 根据id获取日常打卡信息
     * @param id
     * @return
     */
    @Override
    public ResponseVo<DailyReport> getDailyReportById(String id) {
        if(CommonUtil.isEmpty(id)){
            return ResponseVo.success(new DailyReport());
        }
        DailyReport dailyReport = dailyReportMapper.selectByPrimaryKey(id);
        return ResponseVo.success(dailyReport);
    }
}
