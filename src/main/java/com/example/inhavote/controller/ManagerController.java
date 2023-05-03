package com.example.inhavote.controller;

import com.example.inhavote.DTO.CandidateDTO;
import com.example.inhavote.DTO.ManagerDTO;
import com.example.inhavote.Service.ManagerService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.converter.json.GsonBuilderUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.inhavote.Entity.ManagerEntity;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

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
    public String loginVote(@RequestParam String manager_id,@RequestParam String manager_name,Model model) {
        boolean login=managerService.findByManager_idAndManager_name(manager_id,manager_name);
        String return_page="";
        System.out.println(manager_id+"  "+manager_name);
        //System.out.println(managerService.findByManager_idAndManager_name(manager_id,manager_name));

        if (login) {
            model.addAttribute("manager_id", manager_id);
            return_page= "manager/manager1_Register2";
        } else if (!(login)) {
            model.addAttribute("err", false);
            return_page= "manager/manager1_Register";
        }

        return return_page;
    }

    @PostMapping(value = "/Register2/vote_resgister")
    public String registerVote(Model model, @RequestParam("manager_id") String manager_id, @RequestParam String vote_name, @RequestParam String student_major, @RequestParam int student_grade, @RequestParam String start_date, @RequestParam String end_date) throws ParseException {
        ManagerEntity manager = managerService.findByManager_id(manager_id) ;
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd");
        Date m_start_date,m_end_date;
        m_start_date=formatter.parse(start_date);
        m_end_date=formatter.parse(end_date);
        System.out.println(manager_id+"/"+vote_name+" 전공:"+student_major+" 학년:"+student_grade);
        managerService.register(manager.getVoteid(),vote_name,student_grade,student_major,m_start_date,m_end_date);
        model.addAttribute("manager_id", manager_id);
        return "manager/manager1_Register3";
    }


}