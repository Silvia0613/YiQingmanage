package com.yjq.programmer.controller.admin;

import com.yjq.programmer.domain.Maps;
import com.yjq.programmer.domain.Page;
import com.yjq.programmer.service.IMapsService;
import com.yjq.programmer.vo.ResponseVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;


@Controller("AdminMapsController")
@RequestMapping("/admin/maps")
public class MapsController {

    @Resource
    private IMapsService mapsService;

    /**
     * 疫情地图列表页面
     * @param model
     * @return
     */
    @RequestMapping(value="/index",method = RequestMethod.GET)
    public ModelAndView index(ModelAndView model){
        model.addObject("firstMenu", "maps");
        model.addObject("secondMenu", "maps-index");
        model.addObject("Page", mapsService.getPage(new Page(), "").getData());
        model.setViewName("admin/maps/index");
        return model;
    }

    /**
     * 疫情地图列表数据获取
     * @param name
     * @param page
     * @return
     */
    @RequestMapping(value="/list",method = RequestMethod.POST)
    @ResponseBody
    public List<Maps> list(String name, Page page){
        return mapsService.list(name, page).getData();
    }

    /**
     * 封装分页数据
     * @return
     */
    @RequestMapping(value="/page",method = RequestMethod.POST)
    @ResponseBody
    public Page page(Page page, String name){
        return mapsService.getPage(page, name).getData();
    }

    /**
     * 保存疫情地图记录信息
     * @param maps
     * @return
     */
    @RequestMapping(value="/save",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> save(Maps maps){
        return mapsService.save(maps);
    }

    /**
     * 删除疫情地图记录信息
     * @param id
     * @return
     */
    @RequestMapping(value="/delete",method = RequestMethod.POST)
    @ResponseBody
    public ResponseVo<Boolean> delete(String id){
        return mapsService.delete(id);
    }

}
