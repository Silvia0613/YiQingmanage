package com.yjq.programmer.controller.home;

import com.yjq.programmer.domain.Comment;
import com.yjq.programmer.service.ICommentService;
import com.yjq.programmer.vo.ResponseVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


@Controller("HomeCommentController")
@RequestMapping("/home/comment")
public class CommentController {

    @Resource
    private ICommentService commentService;

    /**
     * 前台用户发表评论操作
     * @param comment
     * @param request
     * @return
     */
    @RequestMapping(value="/add",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> addComment(Comment comment, HttpServletRequest request){
        return commentService.webAddComment(comment, request);
    }

    /**
     * 前台删除评论信息
     * @param id
     * @return
     */
    @RequestMapping(value="/delete",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> delete(String id){
        return commentService.delete(id);
    }
}
