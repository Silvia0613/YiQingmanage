package com.yjq.programmer.service.impl;

import com.github.pagehelper.PageHelper;
import com.yjq.programmer.bean.CodeMsg;
import com.yjq.programmer.constant.RuntimeConstant;
import com.yjq.programmer.dao.GoodApplyMapper;
import com.yjq.programmer.dao.UserMapper;
import com.yjq.programmer.domain.*;
import com.yjq.programmer.enums.GoodApplyStateEnum;
import com.yjq.programmer.service.IGoodApplyService;
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

/**
 * @author 杨杨吖
 * @QQ 823208782
 * @WX yjqi12345678
 * @create 2022-02-20 11:26
 */
@Service
@Transactional
public class GoodApplyServiceImpl implements IGoodApplyService {

    @Resource
    private GoodApplyMapper goodApplyMapper;

    @Resource
    private UserMapper userMapper;

    /**
     * 封装分页数据
     * @param page
     * @param name
     * @return
     */
    @Override
    public ResponseVo<Page> getPage(Page page, String name) {
        GoodApplyExample goodApplyExample = new GoodApplyExample();
        goodApplyExample.createCriteria().andNameLike('%'+name+'%');
        page.setTotalCount(goodApplyMapper.countByExample(goodApplyExample));
        return ResponseVo.success(page);
    }

    /**
     * 获取物资申请列表数据
     * @param name
     * @param page
     * @return
     */
    @Override
    public ResponseVo<List<GoodApply>> list(String name, Page page) {
        GoodApplyExample goodApplyExample = new GoodApplyExample();
        if(!CommonUtil.isEmpty(name)){
            // 进行了搜索
            goodApplyExample.createCriteria().andNameLike('%' + name + '%');
        }
        goodApplyExample.setOrderByClause("create_time desc");
        PageHelper.startPage(page.getPage(), page.getRows());
        List<GoodApply> goodApplyList = goodApplyMapper.selectByExample(goodApplyExample);
        for(GoodApply goodApply : goodApplyList){
            User user = userMapper.selectByPrimaryKey(goodApply.getUserId());
            goodApply.setUser(user);
        }
        return ResponseVo.success(goodApplyList);
    }

    /**
     * 保存物资申请信息
     * @param goodApply
     * @return
     */
    @Override
    public ResponseVo<Boolean> save(GoodApply goodApply) {
        if(goodApply == null){
            return ResponseVo.errorByMsg(CodeMsg.DATA_ERROR);
        }
        // 进行统一表单验证
        CodeMsg validate = ValidateEntityUtil.validate(goodApply);
        if (!validate.getCode().equals(CodeMsg.SUCCESS.getCode())) {
            return ResponseVo.errorByMsg(validate);
        }
        if(CommonUtil.isEmpty(goodApply.getId())){
            // 添加操作
            goodApply.setId(UuidUtil.getShortUuid());
            goodApply.setCreateTime(new Date());
            goodApply.setState(GoodApplyStateEnum.WAIT.getCode());
            if(goodApplyMapper.insertSelective(goodApply) == 0){
                return ResponseVo.errorByMsg(CodeMsg.GOOD_APPLY_ADD_ERROR);
            }
        }else {
            // 修改操作
            if(goodApplyMapper.updateByPrimaryKeySelective(goodApply) == 0){
                return ResponseVo.errorByMsg(CodeMsg.GOOD_APPLY_EDIT_ERROR);
            }
        }
        return ResponseVo.success(true);
    }

    /**
     * 审核物资信息
     * @param goodApply
     * @return
     */
    @Override
    public ResponseVo<Boolean> audit(GoodApply goodApply) {
        if(goodApply == null || CommonUtil.isEmpty(goodApply.getId())){
            return ResponseVo.errorByMsg(CodeMsg.DATA_ERROR);
        }
        GoodApply existGoodApply = goodApplyMapper.selectByPrimaryKey(goodApply.getId());
        existGoodApply.setState(goodApply.getState());
        existGoodApply.setReply(goodApply.getReply());
        if(goodApplyMapper.updateByPrimaryKeySelective(goodApply) == 0){
            return ResponseVo.errorByMsg(CodeMsg.GOOD_APPLY_AUDIT_ERROR);
        }
        return ResponseVo.success(true);
    }

    /**
     * 删除物资申请信息
     * @param id
     * @return
     */
    @Override
    public ResponseVo<Boolean> delete(String id) {
        if(CommonUtil.isEmpty(id)){
            return ResponseVo.errorByMsg(CodeMsg.DATA_ERROR);
        }
        // 删除物资申请信息
        if(goodApplyMapper.deleteByPrimaryKey(id) == 0){
            return ResponseVo.errorByMsg(CodeMsg.GOOD_APPLY_DELETE_ERROR);
        }
        return ResponseVo.success(true);
    }

    /**
     * 前台保存物资申请操作
     * @param goodApply
     * @param request
     * @return
     */
    @Override
    public ResponseVo<Boolean> webSaveGoodApply(GoodApply goodApply, HttpServletRequest request) {
        if(goodApply == null){
            return ResponseVo.errorByMsg(CodeMsg.DATA_ERROR);
        }
        // 进行统一表单验证
        CodeMsg validate = ValidateEntityUtil.validate(goodApply);
        if (!validate.getCode().equals(CodeMsg.SUCCESS.getCode())) {
            return ResponseVo.errorByMsg(validate);
        }
        User user = (User) request.getSession().getAttribute(RuntimeConstant.HOME_USER);
        if(user == null) {
            return ResponseVo.errorByMsg(CodeMsg.USER_SESSION_EXPIRED);
        }
        if(CommonUtil.isEmpty(goodApply.getId())){
            // 添加操作
            goodApply.setId(UuidUtil.getShortUuid());
            goodApply.setUserId(user.getId());
            goodApply.setCreateTime(new Date());
            goodApply.setState(GoodApplyStateEnum.WAIT.getCode());
            if(goodApplyMapper.insertSelective(goodApply) == 0){
                return ResponseVo.errorByMsg(CodeMsg.GOOD_APPLY_ADD_ERROR);
            }
        } else {
            goodApply.setState(GoodApplyStateEnum.WAIT.getCode());
            if(goodApplyMapper.updateByPrimaryKeySelective(goodApply) == 0){
                return ResponseVo.errorByMsg(CodeMsg.GOOD_APPLY_EDIT_ERROR);
            }
        }

        return ResponseVo.successByMsg(true, "物资申请成功！");
    }

    /**
     * 获取物资申请的总数
     * @return
     */
    @Override
    public ResponseVo<Integer> getGoodApplyTotal() {
        Integer total = goodApplyMapper.countByExample(new GoodApplyExample());
        return ResponseVo.success(total);
    }

    /**
     * 根据用户id获取物资申请信息
     * @param request
     * @return
     */
    @Override
    public ResponseVo<List<GoodApply>> getGoodApplyByUserId(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute(RuntimeConstant.HOME_USER);
        if(user == null){
            return ResponseVo.errorByMsg(CodeMsg.USER_SESSION_EXPIRED);
        }
        GoodApplyExample goodApplyExample = new GoodApplyExample();
        goodApplyExample.createCriteria().andUserIdEqualTo(user.getId());
        goodApplyExample.setOrderByClause("create_time desc");
        List<GoodApply> goodApplyList = goodApplyMapper.selectByExample(goodApplyExample);
        return ResponseVo.success(goodApplyList);
    }

    /**
     * 根据id获取物资申请信息
     * @param id
     * @return
     */
    @Override
    public ResponseVo<GoodApply> getGoodApplyById(String id) {
        if(CommonUtil.isEmpty(id)){
            return ResponseVo.success(new GoodApply());
        }
        GoodApply goodApply = goodApplyMapper.selectByPrimaryKey(id);
        return ResponseVo.success(goodApply);
    }
}
