package com.example.inhavote.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class UserController {
    @GetMapping("/User1/{manager_id}")
    public String User1(@PathVariable("manager_id") String manager_id){
        System.out.println("user"+manager_id);
        return "user/user_1";
    }
}
