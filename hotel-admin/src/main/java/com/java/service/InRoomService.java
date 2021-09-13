package com.java.service;

import com.java.pojo.InRoomInfo;

import java.util.List;
import java.util.Map;

public interface InRoomService {

    List<Map<String, Object>> findInRoomInfo(Map<String, Object> paramMap, Integer pageNum, Integer pageSize);

    List<Map<String, Object>> findEmptyRoom();

    /**
     * 保存房间信息的接口方法
     *
     * @param info
     * @return
     */
    boolean saveInRoomInfo(InRoomInfo info);

    List<Map<String, Object>> findRoomsByStatus(String status);

    Map<String, Object> findOutRoomInfoById(Long roomId);

    boolean outRoom(Long roomId, Long iriId, Float qita) throws Exception;

    List<Map<String, Object>> findCost(Map<String, Object> paramMap, Integer pageNum, Integer pageSize);
}
