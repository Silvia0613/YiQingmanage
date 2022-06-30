package com.yjq.programmer.service;

import com.yjq.programmer.domain.Page;
import com.yjq.programmer.domain.Role;
import com.yjq.programmer.vo.ResponseVo;

import java.util.List;

/**
 * @author 杨杨吖
 * @QQ 823208782
 * @WX yjqi12345678
 * @create 2022-02-15 15:23
 */
public interface IRoleService {

    // 获取所有角色数据
    ResponseVo<List<Role>> all();

    // 封装分页数据
    ResponseVo<Page> getPage(Page page, String name);

    // 获取角色列表数据
    ResponseVo<List<Role>> list(String name, Page page);

    // 保存角色信息
    ResponseVo<Boolean> save(Role role);

    // 删除角色信息
    ResponseVo<Boolean> delete(String id);

}
