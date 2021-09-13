package com.java.service;

import java.util.List;
import java.util.Map;

public interface SystemUserService {

    boolean saveSystemUser(String username, String pwd, String oneIds, String twoIds);

    List<Map<String, Object>> findSystemUserByLimit(Integer pageNum, Integer pageSize);

    void updateSystemStatus(Long userId, String flag);
}
