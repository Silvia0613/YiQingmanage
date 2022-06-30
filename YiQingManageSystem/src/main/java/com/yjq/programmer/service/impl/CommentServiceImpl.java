package com.yjq.programmer.service.impl;

import com.github.pagehelper.PageHelper;
import com.yjq.programmer.bean.CodeMsg;
import com.yjq.programmer.constant.RuntimeConstant;
import com.yjq.programmer.dao.CommentMapper;
import com.yjq.programmer.dao.NewsMapper;
import com.yjq.programmer.dao.UserMapper;
import com.yjq.programmer.domain.*;
import com.yjq.programmer.service.ICommentService;
import com.yjq.programmer.util.CommonUtil;
import com.yjq.programmer.util.UuidUtil;
import com.yjq.programmer.util.ValidateEntityUtil;
import com.yjq.programmer.vo.ResponseVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author 杨杨吖
 * @QQ 823208782
 * @WX yjqi12345678
 * @create 2022-02-28 11:38
 */
@Service
@Transactional
public class CommentServiceImpl implements ICommentService {

    @Resource
    private CommentMapper commentMapper;

    @Resource
    private UserMapper userMapper;

    @Resource
    private NewsMapper newsMapper;

    /**
     * 前台用户发表评论操作
     * @param comment
     * @param request
     * @return
     */
    @Override
    public ResponseVo<Boolean> webAddComment(Comment comment, HttpServletRequest request) {
        if(comment == null){
            return ResponseVo.errorByMsg(CodeMsg.DATA_ERROR);
        }
        // 进行统一表单验证
        CodeMsg validate = ValidateEntityUtil.validate(comment);
        if (!validate.getCode().equals(CodeMsg.SUCCESS.getCode())) {
            return ResponseVo.errorByMsg(validate);
        }
        User user = (User) request.getSession().getAttribute(RuntimeConstant.HOME_USER);
        if(user == null) {
            return ResponseVo.errorByMsg(CodeMsg.USER_SESSION_EXPIRED);
        }
        comment.setId(UuidUtil.getShortUuid());
        comment.setUserId(user.getId());
        comment.setCreateTime(new Date());
        if(commentMapper.insertSelective(comment) == 0){
            return ResponseVo.errorByMsg(CodeMsg.COMMENT_ADD_ERROR);
        }
        // 对应新闻增加评论量
        News news = newsMapper.selectByPrimaryKey(comment.getNewsId());
        news.setCommentNum(news.getCommentNum() + 1);
        newsMapper.updateByPrimaryKeySelective(news);
        return ResponseVo.successByMsg(true, "发表评论成功！");
    }

    /**
     * 根据新闻id获取对应的评论信息
     * @param newsId
     * @return
     */
    @Override
    public ResponseVo<List<Comment>> selectCommentByNewsId(String newsId) {
        if(CommonUtil.isEmpty(newsId)){
            return ResponseVo.success(new ArrayList<>());
        }
        CommentExample commentExample = new CommentExample();
        commentExample.createCriteria().andNewsIdEqualTo(newsId);
        commentExample.setOrderByClause("create_time desc");
        List<Comment> commentList = commentMapper.selectByExample(commentExample);
        for(Comment comment : commentList) {
            User user = userMapper.selectByPrimaryKey(comment.getUserId());
            comment.setUser(user);
        }
        return ResponseVo.success(commentList);
    }

    /**
     * 封装分页数据
     * @param page
     * @param name
     * @return
     */
    @Override
    public ResponseVo<Page> getPage(Page page, String name) {
        CommentExample commentExample = new CommentExample();
        commentExample.createCriteria().andContentLike('%'+name+'%');
        page.setTotalCount(commentMapper.countByExample(commentExample));
        return ResponseVo.success(page);
    }

    /**
     * 获取评论列表数据
     * @param name
     * @param page
     * @return
     */
    @Override
    public ResponseVo<List<Comment>> list(String name, Page page) {
        CommentExample commentExample = new CommentExample();
        if(!CommonUtil.isEmpty(name)){
            // 进行了搜索
            commentExample.createCriteria().andContentLike('%' + name + '%');
        }
        commentExample.setOrderByClause("create_time desc");
        PageHelper.startPage(page.getPage(), page.getRows());
        List<Comment> commentList = commentMapper.selectByExample(commentExample);
        for(Comment comment : commentList){
            User user = userMapper.selectByPrimaryKey(comment.getUserId());
            comment.setUser(user);
            News news = newsMapper.selectByPrimaryKey(comment.getNewsId());
            comment.setNews(news);
        }
        return ResponseVo.success(commentList);
    }

    /**
     * 删除评论信息
     * @param id
     * @return
     */
    @Override
    public ResponseVo<Boolean> delete(String id) {
        if(CommonUtil.isEmpty(id)){
            return ResponseVo.errorByMsg(CodeMsg.DATA_ERROR);
        }
        Comment comment = commentMapper.selectByPrimaryKey(id);
        // 删除评论信息
        if(commentMapper.deleteByPrimaryKey(id) == 0){
            return ResponseVo.errorByMsg(CodeMsg.COMMENT_DELETE_ERROR);
        }
        // 对应新闻的评论数-1
        News news = newsMapper.selectByPrimaryKey(comment.getNewsId());
        news.setCommentNum(news.getCommentNum() - 1);
        newsMapper.updateByPrimaryKeySelective(news);
        return ResponseVo.success(true);
    }

    /**
     * 获取评论的总数
     * @return
     */
    @Override
    public ResponseVo<Integer> getCommentTotal() {
        Integer total = commentMapper.countByExample(new CommentExample());
        return ResponseVo.success(total);
    }

    /**
     * 根据用户id获取评论信息
     * @param request
     * @return
     */
    @Override
    public ResponseVo<List<Comment>> getCommentByUserId(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute(RuntimeConstant.HOME_USER);
        if(user == null){
            return ResponseVo.errorByMsg(CodeMsg.USER_SESSION_EXPIRED);
        }
        CommentExample commentExample = new CommentExample();
        commentExample.createCriteria().andUserIdEqualTo(user.getId());
        commentExample.setOrderByClause("create_time desc");
        List<Comment> commentList = commentMapper.selectByExample(commentExample);
        return ResponseVo.success(commentList);
    }
}
