package com.yjq.programmer.service.impl;

import com.github.pagehelper.PageHelper;
import com.yjq.programmer.bean.CodeMsg;
import com.yjq.programmer.constant.RuntimeConstant;
import com.yjq.programmer.dao.*;
import com.yjq.programmer.domain.*;
import com.yjq.programmer.enums.RoleEnum;
import com.yjq.programmer.service.INewsService;
import com.yjq.programmer.service.IUserService;
import com.yjq.programmer.util.CommonUtil;
import com.yjq.programmer.util.UuidUtil;
import com.yjq.programmer.util.ValidateEntityUtil;
import com.yjq.programmer.vo.ResponseVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements IUserService {

    @Resource
    private UserMapper userMapper;

    @Resource
    private RoleMapper roleMapper;

    @Resource
    private DailyReportMapper dailyReportMapper;

    @Resource
    private CommentMapper commentMapper;

    @Resource
    private NewsMapper newsMapper;

    @Resource
    private INewsService newsService;


    /**
     * 后台用户登录
     * @param user
     * @param request
     * @return
     */
    @Override
    public ResponseVo<Boolean> adminLogin(User user, HttpServletRequest request) {
        if(user == null){
            return ResponseVo.errorByMsg(CodeMsg.DATA_ERROR);
        }
        if(CommonUtil.isEmpty(user.getUsername())){
            return ResponseVo.errorByMsg(CodeMsg.USERNAME_EMPTY);
        }
        if(CommonUtil.isEmpty(user.getPassword())){
            return ResponseVo.errorByMsg(CodeMsg.PASSWORD_EMPTY);
        }
        // 验证验证码输入是否正确
        String correctCaptcha = (String) request.getSession().getAttribute("admin_login");
        if(CommonUtil.isEmpty(correctCaptcha)){
            return ResponseVo.errorByMsg(CodeMsg.CAPTCHA_EXPIRED);
        }
        if(!(correctCaptcha.toLowerCase()).equals(user.getCaptcha().toLowerCase())){
            return ResponseVo.errorByMsg(CodeMsg.CAPTCHA_ERROR);
        }
        // 验证用户名称和密码是否正确
        UserExample userExample = new UserExample();
        userExample.createCriteria().andUsernameEqualTo(user.getUsername())
                .andPasswordEqualTo(user.getPassword())
                .andRoleIdEqualTo(RoleEnum.ADMIN.getCode());
        List<User> userList = userMapper.selectByExample(userExample);
        if(userList == null || userList.size() != 1){
            return ResponseVo.errorByMsg(CodeMsg.USERNAME_PASSWORD_ERROR);
        }
        User loginUser = userList.get(0);
        loginUser.setLoginTime(new Date());
        userMapper.updateByPrimaryKeySelective(loginUser);
        request.getSession().setAttribute(RuntimeConstant.ADMIN_USER, loginUser);
        return ResponseVo.successByMsg(true, "登录成功！");
    }

    /**
     * 封装分页数据
     * @param page
     * @param name
     * @return
     */
    @Override
    public ResponseVo<Page> getPage(Page page, String name) {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andUsernameLike('%'+name+'%');
        page.setTotalCount(userMapper.countByExample(userExample));
        return ResponseVo.success(page);
    }

    /**
     * 获取用户列表数据
     * @param name
     * @param page
     * @return
     */
    @Override
    public ResponseVo<List<User>> list(String name, Page page) {
        UserExample userExample = new UserExample();
        if(!CommonUtil.isEmpty(name)){
            // 进行了搜索
            userExample.createCriteria().andUsernameLike('%' + name + '%');
        }
        PageHelper.startPage(page.getPage(), page.getRows());
        List<User> userList = userMapper.selectByExample(userExample);
        for(User u : userList){
            Role role = roleMapper.selectByPrimaryKey(u.getRoleId());
            u.setRole(role);
        }
        return ResponseVo.success(userList);
    }

    /**
     * 保存用户信息
     * @param user
     * @return
     */
    @Override
    public ResponseVo<Boolean> save(User user) {
        if(user == null){
            return ResponseVo.errorByMsg(CodeMsg.DATA_ERROR);
        }
        // 进行统一表单验证
        CodeMsg validate = ValidateEntityUtil.validate(user);
        if (!validate.getCode().equals(CodeMsg.SUCCESS.getCode())) {
            return ResponseVo.errorByMsg(validate);
        }
        if(CommonUtil.isEmpty(user.getId())){
            // 添加操作
            // 判断用户名称是否存在
            if(isUsernameExist(user, "")){
                return ResponseVo.errorByMsg(CodeMsg.USERNAME_EXIST);
            }
            user.setId(UuidUtil.getShortUuid());
            user.setLoginTime(new Date());
            if(userMapper.insertSelective(user) == 0){
                return ResponseVo.errorByMsg(CodeMsg.USER_ADD_ERROR);
            }
        }else {
            // 修改操作
            // 判断用户名称是否存在
            if(isUsernameExist(user, user.getId())){
                return ResponseVo.errorByMsg(CodeMsg.USERNAME_EXIST);
            }
            if(userMapper.updateByPrimaryKeySelective(user) == 0){
                return ResponseVo.errorByMsg(CodeMsg.USER_EDIT_ERROR);
            }
        }
        return ResponseVo.success(true);
    }


    /**
     * 删除用户信息
     * @param id
     * @return
     */
    @Override
    public ResponseVo<Boolean> delete(String id) {
        if(CommonUtil.isEmpty(id)){
            return ResponseVo.errorByMsg(CodeMsg.DATA_ERROR);
        }
        // 删除该用户的评论信息
        CommentExample commentExample = new CommentExample();
        commentExample.createCriteria().andUserIdEqualTo(id);
        commentMapper.deleteByExample(commentExample);
        // 删除该用户发布的所有新闻信息
        NewsExample newsExample = new NewsExample();
        newsExample.createCriteria().andUserIdEqualTo(id);
        List<News> newsList = newsMapper.selectByExample(newsExample);
        for(News news : newsList){
            newsService.delete(news.getId());
        }
        // 删除用户信息
        if(userMapper.deleteByPrimaryKey(id) == 0){
            return ResponseVo.errorByMsg(CodeMsg.USER_DELETE_ERROR);
        }
        return ResponseVo.success(true);
    }

    /**
     * 获取所有用户数据
     * @return
     */
    @Override
    public ResponseVo<List<User>> all() {
        return ResponseVo.success(userMapper.selectByExample(new UserExample()));
    }

    /**
     * 前台用户注册操作
     * @param user
     * @return
     */
    @Override
    public ResponseVo<Boolean> registerUser(User user) {
        if(user == null){
            return ResponseVo.errorByMsg(CodeMsg.DATA_ERROR);
        }
        user.setRoleId(RoleEnum.USER.getCode());
        // 进行统一表单验证
        CodeMsg validate = ValidateEntityUtil.validate(user);
        if(!validate.getCode().equals(CodeMsg.SUCCESS.getCode())){
            return ResponseVo.errorByMsg(validate);
        }
        // 判断用户名称是否重复
        if(isUsernameExist(user, "")){
            return ResponseVo.errorByMsg(CodeMsg.USERNAME_EXIST);
        }
        user.setId(UuidUtil.getShortUuid());
        user.setLoginTime(new Date());
        // 添加数据到数据库
        if(userMapper.insertSelective(user) == 0){
            return ResponseVo.errorByMsg(CodeMsg.USER_REGISTER_ERROR);
        }
        return ResponseVo.success(true);
    }

    /**
     * 前台用户登录操作
     * @param user
     * @param request
     * @return
     */
    @Override
    public ResponseVo<Boolean> loginUser(User user, HttpServletRequest request) {
        if(user == null){
            return ResponseVo.errorByMsg(CodeMsg.DATA_ERROR);
        }
        // 判断用户名称和密码是否为空
        if(CommonUtil.isEmpty(user.getUsername())){
            return ResponseVo.errorByMsg(CodeMsg.USERNAME_EMPTY);
        }
        if(CommonUtil.isEmpty(user.getPassword())){
            return ResponseVo.errorByMsg(CodeMsg.PASSWORD_EMPTY);
        }
        UserExample userExample = new UserExample();
        userExample.createCriteria().andUsernameEqualTo(user.getUsername()).andPasswordEqualTo(user.getPassword());
        // 根据用户输入的名称和密码进行数据库查询
        List<User> loginUserList = userMapper.selectByExample(userExample);
        if(loginUserList == null || loginUserList.size() != 1){
            return ResponseVo.errorByMsg(CodeMsg.USERNAME_PASSWORD_ERROR);
        }
        User loginUser = loginUserList.get(0);
        loginUser.setLoginTime(new Date());
        userMapper.updateByPrimaryKeySelective(loginUser);
        // 创建session
        request.getSession().setAttribute(RuntimeConstant.HOME_USER, loginUser);

        return ResponseVo.successByMsg(true, "登录成功！");
    }

    /**
     * 获取用户的总数
     * @return
     */
    @Override
    public ResponseVo<Integer> getUserTotal() {
        Integer total = userMapper.countByExample(new UserExample());
        return ResponseVo.success(total);
    }

    /**
     * 前台用户修改个人信息操作
     * @param user
     * @param request
     * @return
     */
    @Override
    public ResponseVo<Boolean> updateUserInfo(User user, HttpServletRequest request) {
        if(user == null){
            return ResponseVo.errorByMsg(CodeMsg.DATA_ERROR);
        }
        // 进行统一表单验证
        CodeMsg validate = ValidateEntityUtil.validate(user);
        if(!validate.getCode().equals(CodeMsg.SUCCESS.getCode())){
            return ResponseVo.errorByMsg(validate);
        }
        // 判断用户名称是否重复
        if(isUsernameExist(user, user.getId())){
            return ResponseVo.errorByMsg(CodeMsg.USERNAME_EXIST);
        }
        if(userMapper.updateByPrimaryKeySelective(user) == 0){
            return ResponseVo.errorByMsg(CodeMsg.USER_EDIT_ERROR);
        }
        // 更新session中的用户信息
        request.getSession().setAttribute(RuntimeConstant.HOME_USER, userMapper.selectByPrimaryKey(user.getId()));
        return ResponseVo.successByMsg(true, "修改个人信息成功！");
    }


    /**
     * 判断用户名称是否重复
     * @param user
     * @param id
     * @return
     */
    public Boolean isUsernameExist(User user, String id) {
        UserExample userExample = new UserExample();
        userExample.createCriteria().andUsernameEqualTo(user.getUsername());
        List<User> selectedUserList = userMapper.selectByExample(userExample);
        if(selectedUserList != null && selectedUserList.size() > 0) {
            if(selectedUserList.size() > 1){
                return true; //出现重名
            }
            if(!selectedUserList.get(0).getId().equals(id)) {
                return true; //出现重名
            }
        }
        return false;//没有重名
    }


}
