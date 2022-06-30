package com.yjq.programmer.controller.home;

import com.yjq.programmer.domain.GoodApply;
import com.yjq.programmer.service.IGoodApplyService;
import com.yjq.programmer.vo.ResponseVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


@Controller("HomeGoodApplyController")
@RequestMapping("/home/good-apply")
public class GoodApplyController {

    @Resource
    private IGoodApplyService goodApplyService;

    /**
     * 物资申请页面
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(value="/index",method = RequestMethod.GET)
    public ModelAndView index(ModelAndView model, String id){
        model.addObject("url", "good-apply");
        model.addObject("goodApply", goodApplyService.getGoodApplyById(id).getData());
        model.setViewName("home/good-apply/index");
        return model;
    }

    /**
     * 前台保存物资申请数据
     * @param goodApply
     * @param request
     * @return
     */
    @RequestMapping(value="/save",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> saveGoodApply(GoodApply goodApply, HttpServletRequest request){
        return goodApplyService.webSaveGoodApply(goodApply, request);
    }

    /**
     * 前台删除物资申请信息
     * @param id
     * @return
     */
    @RequestMapping(value="/delete",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> delete(String id){
        return goodApplyService.delete(id);
    }
}
