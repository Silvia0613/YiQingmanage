package com.yjq.programmer.controller.admin;

import com.yjq.programmer.domain.Clue;
import com.yjq.programmer.domain.Page;
import com.yjq.programmer.service.IClueService;
import com.yjq.programmer.service.IUserService;
import com.yjq.programmer.vo.ResponseVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;


@Controller("AdminClueController")
@RequestMapping("/admin/clue")
public class ClueController {

    @Resource
    private IClueService clueService;

    @Resource
    private IUserService userService;

    /**
     * 线索列表页面
     * @param model
     * @return
     */
    @RequestMapping(value="/index",method = RequestMethod.GET)
    public ModelAndView index(ModelAndView model){
        model.addObject("firstMenu", "clue");
        model.addObject("secondMenu", "clue-index");
        model.addObject("userList", userService.all().getData());
        model.addObject("Page", clueService.getPage(new Page(), "").getData());
        model.setViewName("admin/clue/index");
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
    public List<Clue> list(String name, Page page){
        return clueService.list(name, page).getData();
    }

    /**
     * 封装分页数据
     * @return
     */
    @RequestMapping(value="/page",method = RequestMethod.POST)
    @ResponseBody
    public Page page(Page page, String name){
        return clueService.getPage(page, name).getData();
    }

    /**
     * 保存线索信息
     * @param clue
     * @return
     */
    @RequestMapping(value="/save",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> save(Clue clue){
        return clueService.save(clue);
    }

    /**
     * 删除线索信息
     * @param id
     * @return
     */
    @RequestMapping(value="/delete",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> delete(String id){
        return clueService.delete(id);
    }

}
