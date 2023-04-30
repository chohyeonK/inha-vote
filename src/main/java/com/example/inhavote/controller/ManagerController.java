package com.example.inhavote.controller;

import com.example.inhavote.DTO.ManagerDTO;
import com.example.inhavote.Service.ManagerService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.inhavote.Entity.ManagerEntity;
@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class ManagerController {
    private final ManagerService managerService;

    @PostMapping(value = "/CreateVote")
    public String createVote(ManagerDTO managerDTO, Model model) {
        System.out.println(managerDTO.toString());
        managerService.create(managerDTO);
        model.addAttribute("manager_id", managerDTO.getManager_id());
        return "manager/manager1_CreateVote";
    }


    @PostMapping(value = "/Register/managerid_login")
    public String loginVote(@RequestParam String manager_id,@RequestParam String manager_name) {
        System.out.println(manager_id+"  "+manager_name);
        return "redirect:/Register";
    }

    @PostMapping(value = "/Register/vote_resgister")
    public String registerVote(@RequestParam String vote_name){
        ManagerEntity manager = managerService.findByVote_id("vote_TD7HZB") ;
        System.out.println(vote_name);
        managerService.register(manager.getVoteid(),vote_name);
        return "redirect:/Register";
    }
}