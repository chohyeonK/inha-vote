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

}
