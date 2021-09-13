package com.java.mapper;

import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface HouseMapper {

    /**
     * 查询所有客房类型信息
     *
     * @return
     */
    @Select("select * from room_type")
    List<Map<String, Object>> selectRoomType();

    /**
     * 获取房间信息
     *
     * @return
     */
    @Select("select rm.id roomId, rm.room_num, rm.room_status, rt.room_price, rt.room_type_name\n" +
            " from rooms rm inner join room_type rt on rm.room_type_id = rt.id")
    List<Map<String, Object>> selectRoomsInfo();
}
