package com.yjq.programmer.service.impl;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.PageHelper;
import com.yjq.programmer.bean.CodeMsg;
import com.yjq.programmer.dao.MapsMapper;
import com.yjq.programmer.domain.*;
import com.yjq.programmer.service.IMapsService;
import com.yjq.programmer.util.CommonUtil;
import com.yjq.programmer.util.UuidUtil;
import com.yjq.programmer.util.ValidateEntityUtil;
import com.yjq.programmer.vo.ResponseVo;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;


@Service
@Transactional
public class MapsServiceImpl implements IMapsService {

    @Resource
    private MapsMapper mapsMapper;

    final static String AK = "3tmfIS3gu3iSwpibAgXvIrvFx28mklvm";

    final static String ADDRESS_URL = "http://api.map.baidu.com/geocoding/v3/?output=json";

    /**
     * 封装分页数据
     * @param page
     * @param name
     * @return
     */
    @Override
    public ResponseVo<Page> getPage(Page page, String name) {
        MapsExample mapsExample = new MapsExample();
        mapsExample.createCriteria().andLocationLike('%' + name + '%');
        page.setTotalCount(mapsMapper.countByExample(mapsExample));
        return ResponseVo.success(page);
    }

    /**
     * 获取疫情地图列表数据
     * @param name
     * @param page
     * @return
     */
    @Override
    public ResponseVo<List<Maps>> list(String name, Page page) {
        MapsExample mapsExample = new MapsExample();
        if(!CommonUtil.isEmpty(name)){
            // 进行了搜索
            mapsExample.createCriteria().andLocationLike('%' + name + '%');
        }
        mapsExample.setOrderByClause("create_time desc");
        PageHelper.startPage(page.getPage(), page.getRows());
        List<Maps> mapsList = mapsMapper.selectByExample(mapsExample);
        return ResponseVo.success(mapsList);
    }

    /**
     * 保存疫情地图记录信息
     * @param maps
     * @return
     */
    @Override
    public ResponseVo<Boolean> save(Maps maps) {
        if(maps == null){
            return ResponseVo.errorByMsg(CodeMsg.DATA_ERROR);
        }
        // 进行统一表单验证
        CodeMsg validate = ValidateEntityUtil.validate(maps);
        if (!validate.getCode().equals(CodeMsg.SUCCESS.getCode())) {
            return ResponseVo.errorByMsg(validate);
        }
        String url = ADDRESS_URL + "&ak=" + AK + "&address="+ maps.getLocation();
        HttpClient client = HttpClients.createDefault(); // 创建默认http连接
        HttpPost post = new HttpPost(url);// 创建一个post请求
        ReturnResultLocation returnResultLocation = new ReturnResultLocation();
        try {
            // 用http连接去执行get请求并且获得http响应
            HttpResponse response = client.execute(post);
            // 从response中取到响实体
            HttpEntity entity = response.getEntity();
            // 把响应实体转成文本
            String html = EntityUtils.toString(entity);
            returnResultLocation = JSON.parseObject(html, ReturnResultLocation.class);
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseVo.errorByMsg(CodeMsg.LOCATION_GET_ERROR);
        }
        if(returnResultLocation == null || returnResultLocation.getStatus() == 1){
            return ResponseVo.errorByMsg(CodeMsg.LOCATION_NOT_EXIST);
        }
        maps.setLat(returnResultLocation.getResult().getLocation().getLat());
        maps.setLng(returnResultLocation.getResult().getLocation().getLng());
        if(CommonUtil.isEmpty(maps.getId())){
            // 添加操作
            // 判断位置是否重复
            if(isLocationExist(maps, "")){
                return ResponseVo.errorByMsg(CodeMsg.LOCATION_EXIST);
            }
            maps.setId(UuidUtil.getShortUuid());
            maps.setCreateTime(new Date());
            if(mapsMapper.insertSelective(maps) == 0){
                return ResponseVo.errorByMsg(CodeMsg.MAP_ADD_ERROR);
            }
        }else {
            // 修改操作
            // 判断位置是否重复
            if(isLocationExist(maps, maps.getId())){
                return ResponseVo.errorByMsg(CodeMsg.LOCATION_EXIST);
            }
            if(mapsMapper.updateByPrimaryKeySelective(maps) == 0){
                return ResponseVo.errorByMsg(CodeMsg.MAP_EDIT_ERROR);
            }
        }
        return ResponseVo.success(true);
    }

    /**
     * 删除疫情地图记录信息
     * @param id
     * @return
     */
    @Override
    public ResponseVo<Boolean> delete(String id) {
        if(CommonUtil.isEmpty(id)){
            return ResponseVo.errorByMsg(CodeMsg.DATA_ERROR);
        }
        // 删除疫情地图记录信息
        if(mapsMapper.deleteByPrimaryKey(id) == 0){
            return ResponseVo.errorByMsg(CodeMsg.MAP_DELETE_ERROR);
        }
        return ResponseVo.success(true);
    }

    /**
     * 获取所有疫情地图记录
     * @return
     */
    @Override
    public ResponseVo<List<Maps>> all() {
        List<Maps> mapsList = mapsMapper.selectByExample(new MapsExample());
        return ResponseVo.success(mapsList);
    }

    /**
     * 判断疫情发生位置是否重复
     * @param maps
     * @param id
     * @return
     */
    public Boolean isLocationExist(Maps maps, String id) {
        MapsExample mapsExample = new MapsExample();
        mapsExample.createCriteria().andLocationEqualTo(maps.getLocation());
        List<Maps> selectedMapsList = mapsMapper.selectByExample(mapsExample);
        if(selectedMapsList != null && selectedMapsList.size() > 0) {
            if(selectedMapsList.size() > 1){
                return true; //出现重名
            }
            if(!selectedMapsList.get(0).getId().equals(id)) {
                return true; //出现重名
            }
        }
        return false;//没有重名
    }

}
