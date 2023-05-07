package com.example.inhavote.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class homeController {

    @GetMapping("/")
    public String Home() {
        return "manager/manager_Home";
    }
    @GetMapping("/CreateVote")
    public String CreateVote()
    {
        return "manager/manager_CreateVote";
    }
    @GetMapping("/Login")
    public String Login()
    {
        return "manager/manager_Login";
    }
    @GetMapping("/Help")
    public String Help() { return "manager/manager_Help"; }
    @GetMapping("/Vote")
    public String Vote() { return "vote/vote"; }
    @GetMapping("/UserHome")
    public String UserHome() { return "user/user_home"; }
    @GetMapping("/UserInfo")
    public String UserInfo() { return "user/user_info"; }
    @GetMapping("/UserInfo/list")
    public String UserInfo_list() { return "user/user_info_list"; }
    @GetMapping("/UserInfo/list/candidate")
    public String UserInfo_list_candidate() { return "user/user_info_candidate"; }
    @GetMapping("/UserEmail")
    public String UserEmail() { return "user/user_email"; }
    @GetMapping("/Register")
    public String Register() { return "manager/manager1_Register"; }
    @GetMapping("/URL")
    public String URL() { return "manager/manager_URL"; }
    @GetMapping("/Admin")
    public String Admin() { return "Admin"; }


}
