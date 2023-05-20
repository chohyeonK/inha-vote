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
    @GetMapping("/Result")
    public String Result() { return "manager/manager_Result"; }
    @GetMapping("/UserVote")
    public String Vote() { return "user/user_vote"; }
    @GetMapping("/UserResult")
    public String userResult() { return "user/user_result"; }
    @GetMapping("/UserHome")
    public String UserHome() { return "user/user_home"; }
    @GetMapping("/UserInfo")
    public String UserInfo() { return "user/user_info"; }
    @GetMapping("/UserEmail")
    public String UserEmail() { return "user/user_email"; }
    @GetMapping("/Register")
    public String Register() { return "manager/manager_Register"; }
    @GetMapping("/URL")
    public String URL() { return "manager/manager_URL"; }
    @GetMapping("/Admin")
    public String Admin() { return "Admin"; }


}
