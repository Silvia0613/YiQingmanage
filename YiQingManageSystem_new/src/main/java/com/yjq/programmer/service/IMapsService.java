package com.yjq.programmer.service;

import com.yjq.programmer.domain.Maps;
import com.yjq.programmer.domain.Page;
import com.yjq.programmer.vo.ResponseVo;

import java.util.List;

public interface IMapsService {

    // 封装分页数据
    ResponseVo<Page> getPage(Page page, String name);

    // 获取疫情地图列表数据
    ResponseVo<List<Maps>> list(String name, Page page);

    // 保存疫情地图记录信息
    ResponseVo<Boolean> save(Maps maps);

    // 删除疫情地图记录信息
    ResponseVo<Boolean> delete(String id);

    // 获取所有疫情地图记录
    ResponseVo<List<Maps>> all();
}
