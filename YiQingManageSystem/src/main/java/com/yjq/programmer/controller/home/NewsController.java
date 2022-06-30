package com.yjq.programmer.controller.home;

import com.yjq.programmer.domain.News;
import com.yjq.programmer.service.ICommentService;
import com.yjq.programmer.service.INewsService;
import com.yjq.programmer.vo.PageVo;
import com.yjq.programmer.vo.ResponseVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;


@Controller("HomeNewsController")
@RequestMapping("/home/news")
public class NewsController {

    @Resource
    private INewsService newsService;

    @Resource
    private ICommentService commentService;

    /**
     * 获取更多新闻文章内容
     * @param pageVo
     * @return
     */
    @RequestMapping(value="/more",method = RequestMethod.POST)
    @ResponseBody
    ResponseVo<PageVo<News>> moreNews(PageVo<News> pageVo){
        return newsService.getNewsListByPage(pageVo);
    }

    /**
     * 查看新闻文章详情
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(value="/detail",method = RequestMethod.GET)
    public ModelAndView detail(ModelAndView model, String id){
        //增加访问量
        newsService.addViewNum(id);
        //获取此新闻文章信息
        model.addObject("news", newsService.findNewsById(id).getData());
        // 获取此新闻文章对应的评论信息
        model.addObject("commentList", commentService.selectCommentByNewsId(id).getData());
        model.addObject("hotNewsList", newsService.selectHotNews().getData());
        model.setViewName("home/news/detail");
        return model;
    }
}
