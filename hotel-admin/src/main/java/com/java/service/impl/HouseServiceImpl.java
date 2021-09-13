package com.java.service.impl;

import com.github.pagehelper.PageHelper;
import com.java.mapper.HouseMapper;
import com.java.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class HouseServiceImpl implements HouseService {
    @Autowired
    private HouseMapper houseMapper;

    @Override
    public List<Map<String, Object>> findRoomType(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return houseMapper.selectRoomType();
    }

    @Override
    public List<Map<String, Object>> findRoomsInfo() {
        return houseMapper.selectRoomsInfo();
    }
}
