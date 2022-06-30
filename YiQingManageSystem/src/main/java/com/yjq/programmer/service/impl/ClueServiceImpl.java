package com.yjq.programmer.service.impl;

import com.github.pagehelper.PageHelper;
import com.yjq.programmer.bean.CodeMsg;
import com.yjq.programmer.constant.RuntimeConstant;
import com.yjq.programmer.dao.ClueMapper;
import com.yjq.programmer.dao.UserMapper;
import com.yjq.programmer.domain.*;
import com.yjq.programmer.service.IClueService;
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
 * @create 2022-02-16 15:31
 */
@Service
@Transactional
public class ClueServiceImpl implements IClueService {

    @Resource
    private ClueMapper clueMapper;

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
        ClueExample clueExample = new ClueExample();
        clueExample.createCriteria().andContentLike('%'+name+'%');
        page.setTotalCount(clueMapper.countByExample(clueExample));
        return ResponseVo.success(page);
    }

    /**
     * 获取线索列表数据
     * @param name
     * @param page
     * @return
     */
    @Override
    public ResponseVo<List<Clue>> list(String name, Page page) {
        ClueExample clueExample = new ClueExample();
        if(!CommonUtil.isEmpty(name)){
            // 进行了搜索
            clueExample.createCriteria().andContentLike('%' + name + '%');
        }
        clueExample.setOrderByClause("create_time desc");
        PageHelper.startPage(page.getPage(), page.getRows());
        List<Clue> clueList = clueMapper.selectByExample(clueExample);
        for(Clue clue : clueList){
            User user = userMapper.selectByPrimaryKey(clue.getUserId());
            clue.setUser(user);
        }
        return ResponseVo.success(clueList);
    }

    /**
     * 保存线索信息
     * @param clue
     * @return
     */
    @Override
    public ResponseVo<Boolean> save(Clue clue) {
        if(clue == null){
            return ResponseVo.errorByMsg(CodeMsg.DATA_ERROR);
        }
        // 进行统一表单验证
        CodeMsg validate = ValidateEntityUtil.validate(clue);
        if (!validate.getCode().equals(CodeMsg.SUCCESS.getCode())) {
            return ResponseVo.errorByMsg(validate);
        }
        if(CommonUtil.isEmpty(clue.getId())){
            // 添加操作
            clue.setId(UuidUtil.getShortUuid());
            clue.setCreateTime(new Date());
            if(clueMapper.insertSelective(clue) == 0){
                return ResponseVo.errorByMsg(CodeMsg.CLUE_ADD_ERROR);
            }
        }else {
            // 修改操作
            if(clueMapper.updateByPrimaryKeySelective(clue) == 0){
                return ResponseVo.errorByMsg(CodeMsg.CLUE_EDIT_ERROR);
            }
        }
        return ResponseVo.success(true);
    }

    /**
     * 删除线索信息
     * @param id
     * @return
     */
    @Override
    public ResponseVo<Boolean> delete(String id) {
        if(CommonUtil.isEmpty(id)){
            return ResponseVo.errorByMsg(CodeMsg.DATA_ERROR);
        }
        // 删除线索信息
        if(clueMapper.deleteByPrimaryKey(id) == 0){
            return ResponseVo.errorByMsg(CodeMsg.CLUE_DELETE_ERROR);
        }
        return ResponseVo.success(true);
    }

    /**
     * 前台保存线索上报操作
     * @param clue
     * @param request
     * @return
     */
    @Override
    public ResponseVo<Boolean> webSaveClue(Clue clue, HttpServletRequest request) {
        if(clue == null){
            return ResponseVo.errorByMsg(CodeMsg.DATA_ERROR);
        }
        // 进行统一表单验证
        CodeMsg validate = ValidateEntityUtil.validate(clue);
        if (!validate.getCode().equals(CodeMsg.SUCCESS.getCode())) {
            return ResponseVo.errorByMsg(validate);
        }
        User user = (User) request.getSession().getAttribute(RuntimeConstant.HOME_USER);
        if(user == null) {
            return ResponseVo.errorByMsg(CodeMsg.USER_SESSION_EXPIRED);
        }
        if(CommonUtil.isEmpty(clue.getId())){
            // 添加操作
            clue.setUserId(user.getId());
            clue.setId(UuidUtil.getShortUuid());
            clue.setCreateTime(new Date());
            if(clueMapper.insertSelective(clue) == 0){
                return ResponseVo.errorByMsg(CodeMsg.CLUE_ADD_ERROR);
            }
        } else {
            // 修改操作
            if(clueMapper.updateByPrimaryKeySelective(clue) == 0){
                return ResponseVo.errorByMsg(CodeMsg.CLUE_EDIT_ERROR);
            }
        }
        return  ResponseVo.successByMsg(true, "线索上报成功！");
    }

    /**
     * 获取线索的总数
     * @return
     */
    @Override
    public ResponseVo<Integer> getClueTotal() {
        Integer total = clueMapper.countByExample(new ClueExample());
        return ResponseVo.success(total);
    }

    /**
     * 根据用户id获取线索信息
     * @param request
     * @return
     */
    @Override
    public ResponseVo<List<Clue>> getClueByUserId(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute(RuntimeConstant.HOME_USER);
        if(user == null){
            return ResponseVo.errorByMsg(CodeMsg.USER_SESSION_EXPIRED);
        }
        ClueExample clueExample = new ClueExample();
        clueExample.createCriteria().andUserIdEqualTo(user.getId());
        clueExample.setOrderByClause("create_time desc");
        List<Clue> clueList = clueMapper.selectByExample(clueExample);
        return ResponseVo.success(clueList);
    }

    /**
     * 根据id获取线索信息
     * @param id
     * @return
     */
    @Override
    public ResponseVo<Clue> getClueById(String id) {
        if(CommonUtil.isEmpty(id)){
            return ResponseVo.success(new Clue());
        }
        Clue clue = clueMapper.selectByPrimaryKey(id);
        return ResponseVo.success(clue);
    }

}
