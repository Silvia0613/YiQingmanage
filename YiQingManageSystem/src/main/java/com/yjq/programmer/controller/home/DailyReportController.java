package com.yjq.programmer.controller.home;

import com.yjq.programmer.domain.DailyReport;
import com.yjq.programmer.service.IDailyReportService;
import com.yjq.programmer.vo.ResponseVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


@Controller("HomeDailyReportController")
@RequestMapping("/home/daily-report")
public class DailyReportController {

    @Resource
    private IDailyReportService dailyReportService;

    /**
     * 日常打卡页面
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(value="/index",method = RequestMethod.GET)
    public ModelAndView index(ModelAndView model, String id){
        model.addObject("url", "daily-report");
        model.addObject("dailyReport", dailyReportService.getDailyReportById(id).getData());
        model.setViewName("home/daily-report/index");
        return model;
    }

    /**
     * 前台保存日常打卡数据
     * @param dailyReport
     * @param request
     * @return
     */
    @RequestMapping(value="/save",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> saveDailyReport(DailyReport dailyReport, HttpServletRequest request){
        return dailyReportService.webSaveDailyReport(dailyReport, request);
    }

    /**
     * 前台删除日常打卡信息
     * @param id
     * @return
     */
    @RequestMapping(value="/delete",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> delete(String id){
        return dailyReportService.delete(id);
    }
}
