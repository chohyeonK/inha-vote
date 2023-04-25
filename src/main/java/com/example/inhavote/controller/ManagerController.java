package com.example.inhavote.controller;

import com.example.inhavote.DTO.ManagerDTO;
import com.example.inhavote.Service.ManagerService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/CreateVote")
public class ManagerController {
    private final ManagerService managerService;

    @PostMapping(value = "/managerid_create")
    public String createVote(ManagerDTO managerDTO, Model model){
        System.out.println(managerDTO.toString());
        managerService.create(managerDTO);
        model.addAttribute("manager_id",managerDTO.getManager_id());
        return "manager/manager1_CreateVote";
    }


}
/*    @PostMapping(value = "/Register/managerid_find")
    public String findVote(ManagerDTO managerDTO){
        System.out.println("로그인");
        return "redirect:/Register";
    }*/
