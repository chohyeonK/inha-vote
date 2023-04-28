package com.example.inhavote.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class homeController {

    @GetMapping("/")
    public String Home() {
        return "manager/manager1_Home";
    }
    @GetMapping("/CreateVote")
    public String CreateVote()
    {
        return "manager/manager1_CreateVote";
    }
    @GetMapping("/Register")
    public String Register()
    {
        return "manager/manager1_Register";
    }
    @GetMapping("/Help")
    public String Help() { return "manager/manager1_Help"; }
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
    @GetMapping("/Register2")
    public String Register2() { return "manager/manager1_Register2"; }
    @GetMapping("/Register3")
    public String Register3() { return "manager/manager1_Register3"; }
    @GetMapping("/Admin")
    public String Admin() { return "manager/manager2_Admin"; }

}
