package com.java.mapper;

import com.java.pojo.OneMenu;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface LoginMapper {

    //  登录
    @Select("select count(*) from system_user where username = #{0} and pwd = #{1}")
    int login(String username, String pwd);

    //  根据用户的username获取具体的权限
    List<OneMenu> getAuthorityByUsername(String username);

    //  获取授权信息
    List<OneMenu> getSQAuthority();
}
