package com.yjq.programmer.controller.admin;

import com.yjq.programmer.domain.DailyReport;
import com.yjq.programmer.domain.Page;
import com.yjq.programmer.service.IDailyReportService;
import com.yjq.programmer.service.IUserService;
import com.yjq.programmer.vo.ResponseVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;


@Controller("AdminDailyReportController")
@RequestMapping("/admin/daily-report")
public class DailyReportController {

    @Resource
    private IDailyReportService dailyReportService;

    @Resource
    private IUserService userService;

    /**
     * 日常打卡列表页面
     * @param model
     * @return
     */
    @RequestMapping(value="/index",method = RequestMethod.GET)
    public ModelAndView index(ModelAndView model){
        model.addObject("firstMenu", "daily-report");
        model.addObject("secondMenu", "daily-report-index");
        model.addObject("Page", dailyReportService.getPage(new Page(), null).getData());
        model.addObject("userList", userService.all().getData());
        model.setViewName("admin/daily-report/index");
        return model;
    }

    /**
     * 日常打卡列表数据获取
     * @param createTime
     * @param page
     * @return
     */
    @RequestMapping(value="/list",method = RequestMethod.POST)
    @ResponseBody
    public List<DailyReport> list(Date createTime, Page page){
        return dailyReportService.list(createTime, page).getData();
    }

    /**
     * 封装分页数据
     * @return
     */
    @RequestMapping(value="/page",method = RequestMethod.POST)
    @ResponseBody
    public Page page(Page page, Date createTime){
        return dailyReportService.getPage(page, createTime).getData();
    }

    /**
     * 保存日常打卡信息
     * @param dailyReport
     * @return
     */
    @RequestMapping(value="/save",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> save(DailyReport dailyReport){
        return dailyReportService.save(dailyReport);
    }



    /**
     * 删除日常打卡信息
     * @param id
     * @return
     */
    @RequestMapping(value="/delete",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> delete(String id){
        return dailyReportService.delete(id);
    }

    /**
     * 导出日常打卡Excel文件
     * @param createTime
     * @return
     */
    @RequestMapping(value="/export_excel",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> exportExcel(Date createTime){
        return dailyReportService.exportExcel(createTime);
    }

}
