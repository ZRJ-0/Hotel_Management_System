package com.java.service.impl;

import com.java.mapper.LoginMapper;
import com.java.pojo.OneMenu;
import com.java.service.LoginService;
import com.java.utils.MD5Tool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class LoginServiceImpl implements LoginService {
    @Autowired
    private LoginMapper loginMapper;

    @Transactional(readOnly = false)    //  readOnly=true表明所注解的方法或类只是读取数据。  readOnly=false表明所注解的方法或类是增加，删除，修改数据。
    public boolean login(String username, String pwd, HttpSession session) {
        //  将明文密码进行MD5加密后   再调用mapper层
        pwd = MD5Tool.encodeMD5Hex(pwd);
        int flag = loginMapper.login(username, pwd);
        if (flag >= 1) {
            List<OneMenu> oneMenuList = loginMapper.getAuthorityByUsername(username);
            session.setAttribute("oneMenuList", oneMenuList);
            session.setAttribute("username", username);
            return true;
        }
        return false;
    }

    @Override
    public List<OneMenu> getSQAuthority() {
        return loginMapper.getSQAuthority();
    }
}
