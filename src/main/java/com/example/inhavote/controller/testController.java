package com.example.inhavote.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class testController {

    @GetMapping("/")
    public String Home() {
        return "manager1_Home";
    }
    @GetMapping("/CreateVote")
    public String CreateVote()
    {
        return "manager1_CreateVote";
    }
    @GetMapping("/Register")
    public String Register()
    {
        return "manager1_Register";
    }
    @GetMapping("/Directions")
    public String Directions()
    {
        return "manager1_Directions";
    }
}
