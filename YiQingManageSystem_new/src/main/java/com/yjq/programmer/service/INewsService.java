package com.yjq.programmer.service;

import com.yjq.programmer.domain.News;
import com.yjq.programmer.domain.Page;
import com.yjq.programmer.vo.PageVo;
import com.yjq.programmer.vo.ResponseVo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface INewsService {

    // 封装分页数据
    ResponseVo<Page> getPage(Page page, String name);

    // 获取新闻列表数据
    ResponseVo<List<News>> list(String name, Page page);

    // 保存新闻信息
    ResponseVo<Boolean> save(News news, HttpServletRequest request);

    // 删除新闻信息
    ResponseVo<Boolean> delete(String id);

    // 根据id查询新闻信息
    ResponseVo<News> selectById(String id);

    // 前台分页获取新闻文章
    ResponseVo<PageVo<News>> getNewsListByPage(PageVo<News> pageVo);

    // 根据id获取新闻文章信息
    ResponseVo<News> findNewsById(String id);

    // 增加新闻访问量
    ResponseVo<Boolean> addViewNum(String id);

    // 获取热门新闻
    ResponseVo<List<News>> selectHotNews();

    // 获取新闻的总数
    ResponseVo<Integer> getNewsTotal();
}
