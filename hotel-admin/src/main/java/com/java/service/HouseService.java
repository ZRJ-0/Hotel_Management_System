package com.java.service;

import java.util.List;
import java.util.Map;

public interface HouseService {

    /**
     * 获取客房类型信息
     *
     * @param pageNum
     * @param pageSize
     * @return
     */
    List<Map<String, Object>> findRoomType(Integer pageNum, Integer pageSize);

    /**
     * 获取房间信息
     *
     * @return
     */
    List<Map<String, Object>> findRoomsInfo();
}
