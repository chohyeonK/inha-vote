package com.example.inhavote.controller;

import com.example.inhavote.DTO.ManagerDTO;
import com.example.inhavote.Service.ManagerService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/CreateVote")
public class ManagerController {
    private final ManagerService managerService;

    @PostMapping(value = "/managerid_create")
    public String createVote(ManagerDTO managerDTO){
        System.out.println(managerDTO.toString());
        managerService.create(managerDTO);
        return "redirect:/CreateVote";
    }

}
