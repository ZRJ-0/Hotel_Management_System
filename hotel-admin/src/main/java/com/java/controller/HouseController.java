package com.java.controller;

import com.github.pagehelper.PageInfo;
import com.java.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class HouseController {
    @Autowired
    private HouseService houseService;

    @RequestMapping("/getHouseManage.do")
    public String getHouseManage(Model model,
                                 @RequestParam(value = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                 @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        List<Map<String, Object>> roomTypeList = houseService.findRoomType(pageNum, pageSize);
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(roomTypeList);
        model.addAttribute("pageInfo", pageInfo);
        return "room/showRoomType.jsp";
    }

    @RequestMapping("/addRoom.do")
    public String addRoom() {

        return "redirect:/getHouseManage.do";
    }

    @RequestMapping("/getAllRoomType.do")
    @ResponseBody
    public List<Map<String, Object>> getAllRoomType(
            @RequestParam(value = "pageNum", required = false, defaultValue = "1") Integer pageNum,
            @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize) {
        return houseService.findRoomType(pageNum, pageSize);
    }

    @RequestMapping("/getRoomInfo.do")
    @ResponseBody
    public List<Map<String, Object>> getRoomInfo() {
        return houseService.findRoomsInfo();
    }
}
