package com.yjq.programmer.controller.admin;

import com.yjq.programmer.domain.GoodApply;
import com.yjq.programmer.domain.Page;
import com.yjq.programmer.service.IGoodApplyService;
import com.yjq.programmer.service.IUserService;
import com.yjq.programmer.vo.ResponseVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;


@Controller("AdminGoodApplyController")
@RequestMapping("/admin/good-apply")
public class GoodApplyController {

    @Resource
    private IGoodApplyService goodApplyService;

    @Resource
    private IUserService userService;

    /**
     * 物资申请列表页面
     * @param model
     * @return
     */
    @RequestMapping(value="/index",method = RequestMethod.GET)
    public ModelAndView index(ModelAndView model){
        model.addObject("firstMenu", "good-apply");
        model.addObject("secondMenu", "good-apply-index");
        model.addObject("Page", goodApplyService.getPage(new Page(), "").getData());
        model.addObject("userList", userService.all().getData());
        model.setViewName("admin/good-apply/index");
        return model;
    }

    /**
     * 线索列表数据获取
     * @param name
     * @param page
     * @return
     */
    @RequestMapping(value="/list",method = RequestMethod.POST)
    @ResponseBody
    public List<GoodApply> list(String name, Page page){
        return goodApplyService.list(name, page).getData();
    }

    /**
     * 封装分页数据
     * @return
     */
    @RequestMapping(value="/page",method = RequestMethod.POST)
    @ResponseBody
    public Page page(Page page, String name){
        return goodApplyService.getPage(page, name).getData();
    }

    /**
     * 保存物资申请信息
     * @param goodApply
     * @return
     */
    @RequestMapping(value="/save",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> save(GoodApply goodApply){
        return goodApplyService.save(goodApply);
    }


    /**
     * 审核物资申请
     * @param goodApply
     * @return
     */
    @RequestMapping(value="/audit",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> audit(GoodApply goodApply){
        return goodApplyService.audit(goodApply);
    }

    /**
     * 删除物资申请信息
     * @param id
     * @return
     */
    @RequestMapping(value="/delete",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> delete(String id){
        return goodApplyService.delete(id);
    }
}
