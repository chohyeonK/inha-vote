package com.example.inhavote.controller;

import com.example.inhavote.Entity.ManagerEntity;
import com.example.inhavote.Service.ManagerService;
import org.springframework.ui.Model;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class UserController {
    private final ManagerService managerService;

    @GetMapping("/UserHome={manager_id}")
    public String UserHome(@PathVariable("manager_id") String manager_id, Model model){
        System.out.println("user"+manager_id);
        ManagerEntity manager = managerService.findByManager_id(manager_id) ;
        model.addAttribute("vote_name",manager.getVotename());
        model.addAttribute("start_date",manager.getStartdate());
        model.addAttribute("end_date",manager.getEnddate());
        return "user/user_home";
    }
    @GetMapping("/UserInfo={manager_id}")
    public String UserInfo(@PathVariable("manager_id") String manager_id, Model model){
        System.out.println("user"+manager_id);
        ManagerEntity manager = managerService.findByManager_id(manager_id) ;
        model.addAttribute("vote_name",manager.getVotename());
        model.addAttribute("start_date",manager.getStartdate());
        model.addAttribute("end_date",manager.getEnddate());
        return "user/user_info";
    }

}
