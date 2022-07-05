package com.yjq.programmer.controller.admin;

import com.yjq.programmer.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;


@Controller("AdminSystemController")
@RequestMapping("/admin/system")
public class SystemController {

    @Resource
    private IRoleService roleService;

    @Resource
    private ICommentService commentService;

    @Resource
    private IDailyReportService dailyReportService;

    @Resource
    private INewsService newsService;

    @Resource
    private IUserService userService;

    /**
     * 后台系统首页页面
     * @param model
     * @return
     */
    @RequestMapping(value="/index",method = RequestMethod.GET)
    public ModelAndView index(ModelAndView model){
        model.addObject("roleList", roleService.all().getData());
        model.addObject("commentTotal", commentService.getCommentTotal().getData());
        model.addObject("dailyReportTotal", dailyReportService.getDailyReportTotal().getData());
        model.addObject("newsTotal", newsService.getNewsTotal().getData());
        model.addObject("userTotal", userService.getUserTotal().getData());
        model.setViewName("admin/system/index");
        return model;
    }
}
