package com.yjq.programmer.service;

import com.yjq.programmer.domain.Page;
import com.yjq.programmer.domain.User;
import com.yjq.programmer.vo.ResponseVo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author 杨杨吖
 * @QQ 823208782
 * @WX yjqi12345678
 * @create 2022-02-07 20:12
 */
public interface IUserService {

    // 后台用户登录操作处理
    ResponseVo<Boolean> adminLogin(User user, HttpServletRequest request);

    // 封装分页数据
    ResponseVo<Page> getPage(Page page, String name);

    // 获取用户列表数据
    ResponseVo<List<User>> list(String name, Page page);

    // 保存用户信息
    ResponseVo<Boolean> save(User user);

    // 删除用户信息
    ResponseVo<Boolean> delete(String id);

    // 获取所有用户数据
    ResponseVo<List<User>> all();

    // 前台用户注册操作
    ResponseVo<Boolean> registerUser(User user);

    // 前台用户登录操作
    ResponseVo<Boolean> loginUser(User user, HttpServletRequest request);

    // 获取用户的总数
    ResponseVo<Integer> getUserTotal();

    // 前台用户修改个人信息操作
    ResponseVo<Boolean> updateUserInfo(User user, HttpServletRequest request);

}
