package com.yjq.programmer.controller.home;

import com.yjq.programmer.constant.RuntimeConstant;
import com.yjq.programmer.domain.User;
import com.yjq.programmer.service.*;
import com.yjq.programmer.vo.ResponseVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


@Controller("HomeUserController")
@RequestMapping("/home/user")
public class UserController {

    @Resource
    private IUserService userService;

    @Resource
    private ICommentService commentService;

    @Resource
    private IDailyReportService dailyReportService;

    /**
     * 前台用户中心页面
     * @param model
     * @return
     */
    @RequestMapping(value="/center",method = RequestMethod.GET)
    public ModelAndView center(ModelAndView model){
        model.setViewName("home/user/center");
        return model;
    }

    /**
     * 前台我的日常打卡页面
     * @param model
     * @return
     */
    @RequestMapping(value="/daily-report",method = RequestMethod.GET)
    public ModelAndView dailyReport(ModelAndView model, HttpServletRequest request){
        model.addObject("dailyReportList", dailyReportService.getDailyReportByUserId(request).getData());
        model.setViewName("home/user/daily-report");
        return model;
    }

    /**
     * 前台我的评论页面
     * @param model
     * @return
     */
    @RequestMapping(value="/comment",method = RequestMethod.GET)
    public ModelAndView comment(ModelAndView model, HttpServletRequest request){
        model.addObject("commentList", commentService.getCommentByUserId(request).getData());
        model.setViewName("home/user/comment");
        return model;
    }

    /**
     * 用户注册操作
     * @param user
     * @return
     */
    @RequestMapping(value="/register",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> register(User user){
        return userService.registerUser(user);
    }

    /**
     * 用户登录操作
     * @param user
     * @param request
     * @return
     */
    @RequestMapping(value="/login",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> login(User user, HttpServletRequest request){
        return userService.loginUser(user, request);
    }

    /**
     * 用户退出登录操作
     * @param request
     * @return
     */
    @RequestMapping(value="/logout",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> logout(HttpServletRequest request){
        request.getSession().setAttribute(RuntimeConstant.HOME_USER, null);
        return ResponseVo.success(true);
    }

    /**
     * 修改用户个人信息操作
     * @param user
     * @param request
     * @return
     */
    @RequestMapping(value="/update_info",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> updateInfo(User user, HttpServletRequest request){
        return userService.updateUserInfo(user, request);
    }

}
