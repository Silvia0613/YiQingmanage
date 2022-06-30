package com.yjq.programmer.controller.home;

import com.yjq.programmer.domain.Clue;
import com.yjq.programmer.service.IClueService;
import com.yjq.programmer.vo.ResponseVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;


@Controller("HomeClueController")
@RequestMapping("/home/clue")
public class ClueController {

    @Resource
    private IClueService clueService;

    /**
     * 线索上报页面
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(value="/index",method = RequestMethod.GET)
    public ModelAndView index(ModelAndView model, String id){
        model.addObject("clue", clueService.getClueById(id).getData());
        model.addObject("url", "clue");
        model.setViewName("home/clue/index");
        return model;
    }

    /**
     * 前台保存线索上报数据
     * @param clue
     * @param request
     * @return
     */
    @RequestMapping(value="/save",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> saveClue(Clue clue, HttpServletRequest request){
        return clueService.webSaveClue(clue, request);
    }

    /**
     * 前台删除线索信息
     * @param id
     * @return
     */
    @RequestMapping(value="/delete",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> delete(String id){
        return clueService.delete(id);
    }
}
