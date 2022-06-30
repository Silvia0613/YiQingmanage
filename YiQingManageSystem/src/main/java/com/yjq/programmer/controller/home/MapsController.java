package com.yjq.programmer.controller.home;

import com.yjq.programmer.service.IMapsService;
import com.yjq.programmer.service.INewsService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;


@Controller("HomeMapsController")
@RequestMapping("/home/maps")
public class MapsController {

    @Resource
    private IMapsService mapsService;

    @Resource
    private INewsService newsService;

    /**
     * 前台疫情地图页面
     * @param model
     * @return
     */
    @RequestMapping(value="/index",method = RequestMethod.GET)
    public ModelAndView index(ModelAndView model){
        model.addObject("url", "map");
        model.setViewName("home/maps/index");
        model.addObject("hotNewsList", newsService.selectHotNews().getData());
        model.addObject("mapsList", mapsService.all().getData());
        return model;
    }
}
