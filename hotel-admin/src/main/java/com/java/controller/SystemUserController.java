package com.java.controller;

import com.github.pagehelper.PageInfo;
import com.java.pojo.OneMenu;
import com.java.service.LoginService;
import com.java.service.SystemUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class SystemUserController {
    @Autowired
    private LoginService loginService;

    @Autowired
    private SystemUserService systemUserService;

    //  获取授权信息
    @RequestMapping("/toAddUser.do")
    public String toAddUser(Model model) {
        List<OneMenu> sqAuthorityList = loginService.getSQAuthority();
        model.addAttribute("sqAuthorityList", sqAuthorityList);
        return "user/addSystemUser.jsp";
    }

    @RequestMapping("/addSystemUser.do")
    @ResponseBody
    public boolean toAddSystemUser(String username, String pwd, String oneIds, String twoIds) {
        // System.out.println(username + "\n" + pwd + "\n" + oneIds + "\n" + twoIds);
        return systemUserService.saveSystemUser(username, pwd, oneIds, twoIds);
    }

    @RequestMapping("/getSystemUserByLimit.do")
    public String getSystemUserByLimit(Model model,
                                       @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum,
                                       @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize) {
        List<Map<String, Object>> systemUserList = systemUserService.findSystemUserByLimit(pageNum, pageSize);
        PageInfo<Map<String, Object>> pageInfo = new PageInfo<>(systemUserList);
        model.addAttribute("pageInfo", pageInfo);
        return "user/showSystemUser.jsp";
    }

    @RequestMapping("/updateSystemUserStatus.do")
    public String updateSystemUserStatus(Long userId, String flag) {
        systemUserService.updateSystemStatus(userId, flag);
        return "redirect:/getSystemUserByLimit.do";
    }
}
