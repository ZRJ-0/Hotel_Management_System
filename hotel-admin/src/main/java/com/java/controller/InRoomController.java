package com.java.controller;

import com.github.pagehelper.PageInfo;
import com.java.pojo.InRoomInfo;
import com.java.service.InRoomService;
import com.java.utils.DateTool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class InRoomController {
    @Autowired
    private InRoomService inRoomService;

    /**
     * 获取入住信息
     *
     * @param model
     * @param pageNum
     * @param pageSize
     * @param customerName
     * @param roomNum
     * @param phone
     * @param idcard
     * @return
     */
    @RequestMapping("/getInRoomInfo.do")
    public String getInRoomInfo(Model model,
                                @RequestParam(value = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize,
                                @RequestParam(value = "customerName", required = false) String customerName,
                                @RequestParam(value = "roomNum", required = false) String roomNum,
                                @RequestParam(value = "phone", required = false) String phone,
                                @RequestParam(value = "idcard", required = false) String idcard) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("pageNum", pageNum);
        paramMap.put("pageSize", pageSize);
        paramMap.put("customerName", customerName);
        paramMap.put("roomNum", roomNum);
        paramMap.put("phone", phone);
        paramMap.put("idcard", idcard);
        List<Map<String, Object>> inRoomList = inRoomService.findInRoomInfo(paramMap, pageNum, pageSize);
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(inRoomList);
        model.addAttribute("pageInfo", pageInfo);
        return "bill/inroominfo.jsp";
    }

    /**
     * 通过vue的形式获取入住信息
     *
     * @param pageNum
     * @param pageSize
     * @param customerName
     * @param roomNum
     * @param phone
     * @param idcard
     * @return
     * @throws InterruptedException
     */
    @RequestMapping(value = "/getInRoomInfoByVue.do")       //  分页未能实现
    @ResponseBody
    public PageInfo<Map<String, Object>> getInRoomInfoByVue(
            @RequestParam(value = "pageNum", required = false, defaultValue = "1") Integer pageNum,
            @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize,
            @RequestParam(value = "customerName", required = false) String customerName,
            @RequestParam(value = "roomNum", required = false) String roomNum,
            @RequestParam(value = "phone", required = false) String phone,
            @RequestParam(value = "idcard", required = false) String idcard) throws InterruptedException {
        Thread.sleep(3000);
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("pageNum", pageNum);
        paramMap.put("pageSize", pageSize);
        paramMap.put("customerName", customerName);
        paramMap.put("roomNum", roomNum);
        paramMap.put("phone", phone);
        paramMap.put("idcard", idcard);
        List<Map<String, Object>> inRoomList = inRoomService.findInRoomInfo(paramMap, pageNum, pageSize);
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(inRoomList);
        return pageInfo;
    }

    /**
     * 找出空闲的房间信息   并将信息通过model返回给checkin.jsp中进行显示
     *
     * @param model
     * @return
     */
    @RequestMapping("/checkIn.do")
    public String checkIn(Model model) {
        List<Map<String, Object>> roomList = inRoomService.findEmptyRoom();
        model.addAttribute("roomList", roomList);
        return "bill/checkin.jsp";
    }

    /**
     * 找出空闲房间  并返回List集合和vue交互进行前端页面信息的展示
     *
     * @return
     */
    @RequestMapping("/getKXRoom.do")
    @ResponseBody
    public List<Map<String, Object>> getKXRoom() {
        return inRoomService.findEmptyRoom();
    }

    /**
     * 添加入住信息
     *
     * @param inRoomInfo
     * @return
     */
    @RequestMapping("/addInRoomInfo.do")
    @ResponseBody
    public boolean addInRoomInfo(InRoomInfo inRoomInfo) {
        return inRoomService.saveInRoomInfo(inRoomInfo);
    }

    /**
     * 根据房间状态获取房间信息  并返回给前台  显示可退房的信息
     *
     * @param status
     * @return
     */
    @RequestMapping("/getRoomsByStatus.do")
    @ResponseBody
    public List<Map<String, Object>> getRoomsByStatus(@RequestParam(value = "status", defaultValue = "1") String status) {
        return inRoomService.findRoomsByStatus(status);
    }

    /**
     * 根据房间id查看用户的入住信息
     * RequestParam中的outTime用于接收二次请求带来的时间值    从而计算出入住的总金额、优惠金额以及返回入住天数
     *
     * @param roomId
     * @return
     */
    @RequestMapping("/findOutRoomInfoByRoomId.do")
    @ResponseBody
    public Map<String, Object> findOutRoomInfoByRoomId(Long roomId,
                                                       @RequestParam(value = "outTime", required = false) String outTime) throws Exception {
        Map<String, Object> resultMap = inRoomService.findOutRoomInfoById(roomId);
        String inTime = (String) resultMap.get("create_date");
        inTime = inTime.replace("T", " ");
        // long days = DateTool.diffDays(inTime, new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
        if (outTime != null) {
            long days = DateTool.diffDays(inTime, outTime);
            resultMap.put("days", days);
            //  计算消费金额
            Float cost;
            String is_vip = (String) resultMap.get("is_vip");
            Float roomPrice = (Float) resultMap.get("room_price");
            Float orderMoney = 0F;
            if (resultMap.get("orderMoney") != null) {
                orderMoney = Float.parseFloat(String.valueOf(resultMap.get("orderMoney")));
            }
            if (is_vip == null) {       //  非vip用户
                cost = roomPrice * days + orderMoney;
                resultMap.put("vip", "非vip用户 无折扣");
            } else {
                Float rate = (Float) resultMap.get("vip_rate");
                cost = roomPrice * days * rate + orderMoney;
                resultMap.put("vip", "vip用户 折扣率为" + rate);
            }
            resultMap.put("cost", cost);
        }
        return resultMap;
    }

    // @RequestMapping("/TzOutRoom.do")
    // public String TzOutRoom(Model model,
    //                         @RequestParam(value = "roomId") String roomId,
    //                         @RequestParam(value = "roomNum") String roomNum) {
    //     model.addAttribute("roomId", roomId);
    //     model.addAttribute("roomNum", roomNum);
    //     return "bill/out.html";
    // }

    /**
     * 最终结账退房
     *
     * @param roomId
     * @param iriId
     * @param qita
     * @return
     * @throws Exception
     */
    @RequestMapping("/outRoom.do")
    @ResponseBody
    public boolean outRoom(Long roomId, Long iriId, Float qita) throws Exception {
        return inRoomService.outRoom(roomId, iriId, qita);
    }

    @RequestMapping("/findCost.do")
    @ResponseBody
    public List<Map<String, Object>> findCost(
            @RequestParam(value = "pageNum", required = false, defaultValue = "1") Integer pageNum,
            @RequestParam(value = "pageSize", required = false, defaultValue = "5") Integer pageSize,
            @RequestParam(value = "customerName", required = false) String customerName,
            @RequestParam(value = "roomNum", required = false) String roomNum,
            @RequestParam(value = "phone", required = false) String phone,
            @RequestParam(value = "idcard", required = false) String idcard) {
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("customerName", customerName);
        paramMap.put("roomNum", roomNum);
        paramMap.put("phone", phone);
        paramMap.put("idcard", idcard);
        return inRoomService.findCost(paramMap, pageNum, pageSize);
    }
}
