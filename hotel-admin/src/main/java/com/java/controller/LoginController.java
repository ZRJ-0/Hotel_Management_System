package com.java.controller;

import com.java.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class LoginController {
    @Autowired
    LoginService loginService;

    @RequestMapping("/login.do")
    public String login(String username, String pwd, HttpSession session) {
        boolean flag = loginService.login(username, pwd, session);
        return flag ? "index.jsp" : "login.jsp";
    }
}
