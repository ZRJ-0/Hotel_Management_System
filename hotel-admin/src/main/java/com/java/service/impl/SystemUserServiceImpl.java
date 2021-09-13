package com.java.service.impl;

import com.github.pagehelper.PageHelper;
import com.java.mapper.SystemUserMapper;
import com.java.service.SystemUserService;
import com.java.utils.MD5Tool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class SystemUserServiceImpl implements SystemUserService {
    @Autowired
    private SystemUserMapper systemUserMapper;

    @Override
    public boolean saveSystemUser(String username, String pwd, String oneIds, String twoIds) {
        //  往System_user表中添加数据  获取生成的主键值
        Map<String, Object> paramMap = new HashMap<>();
        paramMap.put("username", username);
        paramMap.put("pwd", MD5Tool.encodeMD5Hex(pwd));
        if (systemUserMapper.isExistUser(username) >= 1) {
            return false;
        }
        int flag = systemUserMapper.insertSystemUser(paramMap);
        if (flag <= 0) {
            return false;
        }
        long userId = Long.parseLong(paramMap.get("userId") + "");
        String id = oneIds + twoIds;
        String[] authority_id = id.replaceAll("(.,)\\1+", "$1").split("\\,");
        for (String aid : authority_id) {
            int flag2 = systemUserMapper.insertAuthority(userId, Long.parseLong(aid));
            if (flag2 <= 0) {
                return false;
            }
        }
        return true;
    }

    @Override
    public List<Map<String, Object>> findSystemUserByLimit(Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        return systemUserMapper.selectAllSystemUser();
    }

    @Override
    public void updateSystemStatus(Long userId, String flag) {
        systemUserMapper.updateStatus(userId, flag);
    }
}
