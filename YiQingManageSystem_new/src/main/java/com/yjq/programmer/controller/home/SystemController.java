package com.yjq.programmer.controller.home;

import com.yjq.programmer.domain.News;
import com.yjq.programmer.service.INewsService;
import com.yjq.programmer.vo.PageVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;


@Controller("HomeSystemController")
@RequestMapping("/home/system")
public class SystemController {

    @Resource
    private INewsService newsService;

    /**
     * 前台系统首页页面
     * @param model
     * @param searchContent
     * @return
     */
    @RequestMapping(value="/index",method = RequestMethod.GET)
    public ModelAndView index(ModelAndView model, String searchContent){
        PageVo<News> pageVo = new PageVo<>();
        pageVo.setSearchContent(searchContent);
        model.addObject("newsList", newsService.getNewsListByPage(pageVo).getData());
        model.addObject("hotNewsList", newsService.selectHotNews().getData());
        model.addObject("url", "system");
        model.setViewName("home/system/index");
        return model;
    }


    /**
     * 前台系统登录页面
     * @param model
     * @return
     */
    @RequestMapping(value="/login",method = RequestMethod.GET)
    public ModelAndView login(ModelAndView model){
        model.setViewName("home/system/login");
        return model;
    }

    /**
     * 前台系统注册页面
     * @param model
     * @return
     */
    @RequestMapping(value="/register",method = RequestMethod.GET)
    public ModelAndView register(ModelAndView model){
        model.setViewName("home/system/register");
        return model;
    }
}
