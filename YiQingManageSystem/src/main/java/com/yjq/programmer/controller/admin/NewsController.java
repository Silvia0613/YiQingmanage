package com.yjq.programmer.controller.admin;

import com.yjq.programmer.domain.News;
import com.yjq.programmer.domain.Page;
import com.yjq.programmer.service.INewsService;
import com.yjq.programmer.vo.ResponseVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller("AdminNewsController")
@RequestMapping("/admin/news")
public class NewsController {

    @Resource
    private INewsService newsService;

    /**
     * 新闻列表页面
     * @param model
     * @return
     */
    @RequestMapping(value="/index",method = RequestMethod.GET)
    public ModelAndView index(ModelAndView model){
        model.addObject("firstMenu", "news");
        model.addObject("secondMenu", "news-index");
        model.addObject("Page", newsService.getPage(new Page(), "").getData());
        model.setViewName("admin/news/index");
        return model;
    }

    /**
     * 新闻添加页面
     * @param model
     * @return
     */
    @RequestMapping(value="/add",method = RequestMethod.GET)
    public ModelAndView add(ModelAndView model){
        model.addObject("firstMenu", "news");
        model.addObject("secondMenu", "news-index");
        model.setViewName("admin/news/add");
        return model;
    }

    /**
     * 新闻修改页面
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value="/edit",method = RequestMethod.GET)
    public ModelAndView edit(String id, ModelAndView model){
        model.addObject("news", newsService.selectById(id).getData());
        model.addObject("firstMenu", "news");
        model.addObject("secondMenu", "news-index");
        model.setViewName("admin/news/edit");
        return model;
    }

    /**
     * 新闻列表数据获取
     * @param name
     * @param page
     * @return
     */
    @RequestMapping(value="/list",method = RequestMethod.POST)
    @ResponseBody
    public List<News> list(String name, Page page){
        return newsService.list(name, page).getData();
    }

    /**
     * 封装分页数据
     * @return
     */
    @RequestMapping(value="/page",method = RequestMethod.POST)
    @ResponseBody
    public Page page(Page page, String name){
        return newsService.getPage(page, name).getData();
    }

    /**
     * 保存新闻信息
     * @param news
     * @param request
     * @return
     */
    @RequestMapping(value="/save",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> save(News news, HttpServletRequest request){
        return newsService.save(news, request);
    }

    /**
     * 删除新闻信息
     * @param id
     * @return
     */
    @RequestMapping(value="/delete",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> delete(String id){
        return newsService.delete(id);
    }
}
