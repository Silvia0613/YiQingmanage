package com.yjq.programmer.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yjq.programmer.bean.CodeMsg;
import com.yjq.programmer.constant.RuntimeConstant;
import com.yjq.programmer.dao.CommentMapper;
import com.yjq.programmer.dao.NewsMapper;
import com.yjq.programmer.dao.UserMapper;
import com.yjq.programmer.domain.*;
import com.yjq.programmer.service.INewsService;
import com.yjq.programmer.util.CommonUtil;
import com.yjq.programmer.util.UuidUtil;
import com.yjq.programmer.util.ValidateEntityUtil;
import com.yjq.programmer.vo.PageVo;
import com.yjq.programmer.vo.ResponseVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * @author 杨杨吖
 * @QQ 823208782
 * @WX yjqi12345678
 * @create 2022-02-21 8:38
 */
@Service
@Transactional
public class NewsServiceImpl implements INewsService {

    @Resource
    private NewsMapper newsMapper;

    @Resource
    private UserMapper userMapper;

    @Resource
    private CommentMapper commentMapper;

    /**
     * 封装分页数据
     * @param page
     * @param name
     * @return
     */
    @Override
    public ResponseVo<Page> getPage(Page page, String name) {
        NewsExample newsExample = new NewsExample();
        newsExample.createCriteria().andTitleLike('%'+name+'%');
        page.setTotalCount(newsMapper.countByExample(newsExample));
        return ResponseVo.success(page);
    }

    /**
     * 获取新闻列表数据
     * @param name
     * @param page
     * @return
     */
    @Override
    public ResponseVo<List<News>> list(String name, Page page) {
        NewsExample newsExample = new NewsExample();
        if(!CommonUtil.isEmpty(name)){
            // 进行了搜索
            newsExample.createCriteria().andTitleLike('%' + name + '%');
        }
        newsExample.setOrderByClause("create_time desc");
        PageHelper.startPage(page.getPage(), page.getRows());
        List<News> newsList = newsMapper.selectByExample(newsExample);
        for(News news : newsList){
            User user = userMapper.selectByPrimaryKey(news.getUserId());
            news.setUser(user);
        }
        return ResponseVo.success(newsList);
    }

    /**
     * 保存新闻信息
     * @param news
     * @param request
     * @return
     */
    @Override
    public ResponseVo<Boolean> save(News news, HttpServletRequest request) {
        if(news == null){
            return ResponseVo.errorByMsg(CodeMsg.DATA_ERROR);
        }
        // 进行统一表单验证
        CodeMsg validate = ValidateEntityUtil.validate(news);
        if (!validate.getCode().equals(CodeMsg.SUCCESS.getCode())) {
            return ResponseVo.errorByMsg(validate);
        }
        User user = (User) request.getSession().getAttribute(RuntimeConstant.ADMIN_USER);
        if(user == null){
            return ResponseVo.errorByMsg(CodeMsg.USER_SESSION_EXPIRED);
        }
        if(CommonUtil.isEmpty(news.getId())){
            // 添加操作
            news.setId(UuidUtil.getShortUuid());
            news.setUserId(user.getId());
            news.setCreateTime(new Date());
            if(newsMapper.insertSelective(news) == 0){
                return ResponseVo.errorByMsg(CodeMsg.NEWS_ADD_ERROR);
            }
        }else {
            // 修改操作
            if(newsMapper.updateByPrimaryKeySelective(news) == 0){
                return ResponseVo.errorByMsg(CodeMsg.NEWS_EDIT_ERROR);
            }
        }
        return ResponseVo.success(true);
    }

    /**
     * 删除新闻信息
     * @param id
     * @return
     */
    @Override
    public ResponseVo<Boolean> delete(String id) {
        if(CommonUtil.isEmpty(id)){
            return ResponseVo.errorByMsg(CodeMsg.DATA_ERROR);
        }
        // 删除该新闻下面的所有评论信息
        CommentExample commentExample = new CommentExample();
        commentExample.createCriteria().andNewsIdEqualTo(id);
        commentMapper.deleteByExample(commentExample);
        // 删除新闻信息
        if(newsMapper.deleteByPrimaryKey(id) == 0){
            return ResponseVo.errorByMsg(CodeMsg.NEWS_DELETE_ERROR);
        }
        return ResponseVo.success(true);
    }

    /**
     * 根据id查询新闻信息
     * @param id
     * @return
     */
    @Override
    public ResponseVo<News> selectById(String id) {
        News news = newsMapper.selectByPrimaryKey(id);
        return ResponseVo.success(news);
    }

    /**
     * 前台分页获取新闻文章
     * @param pageVo
     * @return
     */
    @Override
    public ResponseVo<PageVo<News>> getNewsListByPage(PageVo<News> pageVo) {
        NewsExample newsExample = new NewsExample();
        if(!CommonUtil.isEmpty(pageVo.getSearchContent())){
            // 如果搜索内容不为空
            newsExample.createCriteria().andTitleLike("%"+pageVo.getSearchContent()+"%");
        }
        // 不知道当前页多少，默认为第一页
        if(pageVo.getPage() == null){
            pageVo.setPage(1);
        }
        // 时间降序获取
        newsExample.setOrderByClause("create_time desc");
        // 每页10条数据
        pageVo.setSize(5);
        PageHelper.startPage(pageVo.getPage(), pageVo.getSize());
        // 分页查出新闻文章数据
        List<News> newsList = newsMapper.selectByExample(newsExample);
        PageInfo<News> pageInfo = new PageInfo<>(newsList);
        // 获取数据的总数
        pageVo.setTotal(pageInfo.getTotal());
        for(News news : newsList){
            User user = userMapper.selectByPrimaryKey(news.getUserId());
            news.setUser(user);
        }
        pageVo.setList(newsList);
        return ResponseVo.success(pageVo);
    }

    /**
     * 根据id获取新闻文章信息
     * @param id
     * @return
     */
    @Override
    public ResponseVo<News> findNewsById(String id) {
        if(CommonUtil.isEmpty(id)) {
            return ResponseVo.success(new News());
        }
        News news = newsMapper.selectByPrimaryKey(id);
        if(news == null) {
            return ResponseVo.success(new News());
        }
        User user = userMapper.selectByPrimaryKey(news.getUserId());
        news.setUser(user);
        return ResponseVo.success(news);
    }

    /**
     * 增加新闻访问量
     * @param id
     * @return
     */
    @Override
    public ResponseVo<Boolean> addViewNum(String id) {
        if(CommonUtil.isEmpty(id)) {
            return ResponseVo.errorByMsg(CodeMsg.DATA_ERROR);
        }
        News news = newsMapper.selectByPrimaryKey(id);
        news.setViewNum(news.getViewNum() + 1);
        newsMapper.updateByPrimaryKeySelective(news);
        return ResponseVo.success(true);
    }

    /**
     * 获取热门新闻
     * @return
     */
    @Override
    public ResponseVo<List<News>> selectHotNews() {
        NewsExample newsExample = new NewsExample();
        newsExample.setOrderByClause("view_num desc, comment_num desc");
        PageHelper.startPage(1, 5);
        List<News> newsList = newsMapper.selectByExample(newsExample);
        return ResponseVo.success(newsList);
    }

    /**
     * 获取新闻的总数
     * @return
     */
    @Override
    public ResponseVo<Integer> getNewsTotal() {
        Integer total = newsMapper.countByExample(new NewsExample());
        return ResponseVo.success(total);
    }
}
