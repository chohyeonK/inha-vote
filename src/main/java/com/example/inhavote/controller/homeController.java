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
    @GetMapping("/User1")
    public String User1() { return "user/user_1"; }
    @GetMapping("/User2")
    public String User2() { return "user/user_2"; }
    @GetMapping("/User3")
    public String User3() { return "user/user_3"; }
    @GetMapping("/User3_1")
    public String User3_1() { return "user/user_3_1"; }
    @GetMapping("/User5")
    public String User5() { return "user/user_5"; }
    @GetMapping("/Register")
    public String Register() { return "manager/manager_Register"; }
    @GetMapping("/URL")
    public String URL() { return "manager/manager_URL"; }
    @GetMapping("/Admin")
    public String Admin() { return "Admin"; }


}
