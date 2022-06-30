package com.yjq.programmer.service;

import com.yjq.programmer.domain.GoodApply;
import com.yjq.programmer.domain.Page;
import com.yjq.programmer.vo.ResponseVo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author 杨杨吖
 * @QQ 823208782
 * @WX yjqi12345678
 * @create 2022-02-20 11:24
 */
public interface IGoodApplyService {

    // 封装分页数据
    ResponseVo<Page> getPage(Page page, String name);

    // 获取物资申请列表数据
    ResponseVo<List<GoodApply>> list(String name, Page page);

    // 保存物资申请信息
    ResponseVo<Boolean> save(GoodApply goodApply);

    // 审核物资申请信息
    ResponseVo<Boolean> audit(GoodApply goodApply);

    // 删除物资申请信息
    ResponseVo<Boolean> delete(String id);

    // 前台保存物资申请操作
    ResponseVo<Boolean> webSaveGoodApply(GoodApply goodApply, HttpServletRequest request);

    // 获取物资申请的总数
    ResponseVo<Integer> getGoodApplyTotal();

    // 根据用户id获取物资申请信息
    ResponseVo<List<GoodApply>> getGoodApplyByUserId(HttpServletRequest request);

    // 根据id获取物资申请信息
    ResponseVo<GoodApply> getGoodApplyById(String id);
}
