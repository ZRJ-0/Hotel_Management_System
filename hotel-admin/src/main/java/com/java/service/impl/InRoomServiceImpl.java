package com.java.service.impl;

import com.github.pagehelper.PageHelper;
import com.java.mapper.InRoomMapper;
import com.java.pojo.InRoomInfo;
import com.java.service.InRoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class InRoomServiceImpl implements InRoomService {
    @Autowired
    private InRoomMapper inRoomMapper;

    @Override
    public List<Map<String, Object>> findInRoomInfo(Map<String, Object> paramMap, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return inRoomMapper.selectInRoomInfo(paramMap);
    }

    @Override
    public List<Map<String, Object>> findEmptyRoom() {
        return inRoomMapper.selectEmptyRoom();
    }


    @Override
    @Transactional(readOnly = false)
    public boolean saveInRoomInfo(InRoomInfo info) {
        int flag1 = inRoomMapper.InsertInRoomInfo(info);
        int flag2 = inRoomMapper.updateRoomStatus(info.getRoomId(), "1");
        //  两条sql语句同时执行成功才算成功
        return flag1 >= 1 && flag2 >= 1;
    }

    @Override
    public List<Map<String, Object>> findRoomsByStatus(String status) {
        return inRoomMapper.getRoomsByStatus(status);
    }

    @Override
    public Map<String, Object> findOutRoomInfoById(Long roomId) {
        return inRoomMapper.selectOutRoomInfoById(roomId);
    }


    @Override
    @Transactional(readOnly = false)
    public boolean outRoom(Long roomId, Long iriId, Float qita) throws Exception {
        //  修改入住信息状态
        int flag1 = inRoomMapper.updateIRIStatus(iriId);
        //  修改订单信息状态
        int flag2 = 1;
        if (qita > 0) {
            flag2 = inRoomMapper.updateOrderStatus(iriId);
        }
        int flag3 = inRoomMapper.updateRoomStatus(roomId, "2");
        if (flag1 <= 0 || flag2 <= 0 || flag3 <= 0) {
            throw new Exception();
        }
        return true;
    }

    @Override
    public List<Map<String, Object>> findCost(Map<String, Object> paramMap, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return inRoomMapper.selectCost(paramMap);
    }
}
