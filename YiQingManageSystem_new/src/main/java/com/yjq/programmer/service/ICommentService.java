package com.yjq.programmer.service;

import com.yjq.programmer.domain.Comment;
import com.yjq.programmer.domain.Page;
import com.yjq.programmer.vo.ResponseVo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface ICommentService {

    // 前台用户发表评论操作
    ResponseVo<Boolean> webAddComment(Comment comment, HttpServletRequest request);

    // 根据新闻id获取对应的评论信息
    ResponseVo<List<Comment>> selectCommentByNewsId(String newsId);

    // 封装分页数据
    ResponseVo<Page> getPage(Page page, String name);

    // 获取评论列表数据
    ResponseVo<List<Comment>> list(String name, Page page);

    // 删除评论信息
    ResponseVo<Boolean> delete(String id);

    // 获取评论的总数
    ResponseVo<Integer> getCommentTotal();

    // 根据用户id获取评论信息
    ResponseVo<List<Comment>> getCommentByUserId(HttpServletRequest request);
}
