package com.java.mapper;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface SystemUserMapper {

    //  用户是否存在
    @Select("select count(*) from system_user where username = #{0}")
    int isExistUser(String username);

    //  添加系统用户  同时返回主键
    int insertSystemUser(Map<String, Object> paramMap);

    //  添加权限信息
    int insertAuthority(Long userId, Long authorityId);

    //  查询所有系统用户信息
    @Select("select * from system_user")
    List<Map<String, Object>> selectAllSystemUser();

    //  修改用户状态
    @Update("update system_user set use_status = #{1} where id = #{0}")
    void updateStatus(Long userId, String flag);
}
