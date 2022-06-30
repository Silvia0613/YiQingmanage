package com.yjq.programmer.service;

import com.yjq.programmer.domain.Clue;
import com.yjq.programmer.domain.Page;
import com.yjq.programmer.vo.ResponseVo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * @author 杨杨吖
 * @QQ 823208782
 * @WX yjqi12345678
 * @create 2022-02-16 15:31
 */
public interface IClueService {

    // 封装分页数据
    ResponseVo<Page> getPage(Page page, String name);

    // 获取线索列表数据
    ResponseVo<List<Clue>> list(String name, Page page);

    // 保存线索信息
    ResponseVo<Boolean> save(Clue clue);

    // 删除线索信息
    ResponseVo<Boolean> delete(String id);

    // 前台保存线索上报操作
    ResponseVo<Boolean> webSaveClue(Clue clue, HttpServletRequest request);

    // 获取线索的总数
    ResponseVo<Integer> getClueTotal();

    // 根据用户id获取线索信息
    ResponseVo<List<Clue>> getClueByUserId(HttpServletRequest request);

    // 根据id获取线索信息
    ResponseVo<Clue> getClueById(String id);

}
