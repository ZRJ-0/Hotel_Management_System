package com.java.service;

import com.java.pojo.OneMenu;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface LoginService {

    boolean login(String username, String pwd, HttpSession session);

    List<OneMenu> getSQAuthority();
}
