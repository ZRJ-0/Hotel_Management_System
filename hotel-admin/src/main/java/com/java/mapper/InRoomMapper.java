package com.java.mapper;

import com.java.pojo.InRoomInfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface InRoomMapper {

    List<Map<String, Object>> selectInRoomInfo(Map<String, Object> paramMap);

    List<Map<String, Object>> selectEmptyRoom();

    /**
     * 添加入住信息
     *
     * @param info
     * @return
     */
    @Insert("Insert into in_room_info values(null, #{customerName}, #{gender}, #{isVip}, #{idcard}, " +
            "#{phone}, #{money}, #{createDate}, #{roomId}, 1, 0)")
    int InsertInRoomInfo(InRoomInfo info);

    /**
     * 添加入住信息完成之后   修改房间状态为已入住（status: 1）
     *
     * @param roomId
     * @param status: 0 空闲，1已入住，2打扫
     * @return
     */
    @Update("update rooms set room_status = #{1} where id = #{0}")
    int updateRoomStatus(Long roomId, String status);

    /**
     * 根据房间状态获取房间信息
     *
     * @param status
     * @return
     */
    @Select("select * from rooms where room_status = #{0}")
    List<Map<String, Object>> getRoomsByStatus(String status);


    /**
     * 根据房间主键获取退房客人的信息
     *
     * @param roomId
     * @return
     */
    Map<String, Object> selectOutRoomInfoById(Long roomId);

    /**
     * 修改入住信息表中的状态：未退房  ----> 已退房
     *
     * @param iriId
     * @return
     */
    @Update("update in_room_info set out_room_status = '1' where id = #{0}")
    int updateIRIStatus(Long iriId);

    /**
     * 修改订单表中订单结算状态
     *
     * @param iriId
     * @return
     */
    @Update("update orders set order_status = '1' where iri_id = #{0}")
    int updateOrderStatus(Long iriId);

    /**
     * 查询所有消费记录
     *
     * @param paramMap
     * @return
     */
    List<Map<String, Object>> selectCost(Map<String, Object> paramMap);
}
