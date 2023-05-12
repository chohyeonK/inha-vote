package com.example.inhavote.controller;

import com.example.inhavote.Entity.*;
import com.example.inhavote.Service.*;
import org.springframework.ui.Model;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class UserController {
    private final ManagerService managerService;
    private final StudentsService studentsService;

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

//    @GetMapping("/UserVote={student_id}")
//    public String UserVote(@PathVariable("student_id") String student_id, @RequestParam String manager_id, Model model){
//        System.out.println("uservote"+student_id);
//        StudentsEntity students = studentsService.findByStudent_id(student_id);
//        ManagerEntity manager = managerService.findByManager_id(manager_id);
//        model.addAttribute("vote_name",manager.getVotename());
//        model.addAttribute("start_date",manager.getStartdate());
//        model.addAttribute("end_date",manager.getEnddate());
//        return "user/user_vote";
//    }

    @GetMapping("/UserVote={manager_id}")
    public String UserVote(@PathVariable("manager_id") String manager_id, Model model){
        System.out.println("uservote"+manager_id);
        ManagerEntity manager = managerService.findByManager_id(manager_id);
        model.addAttribute("vote_name",manager.getVotename());
        model.addAttribute("start_date",manager.getStartdate());
        model.addAttribute("end_date",manager.getEnddate());
        return "user/user_vote";
    }

    @GetMapping("/UserResult={manager_id}")
    public String UserResult(@PathVariable("manager_id") String manager_id, Model model){
        System.out.println("userresult"+manager_id);
        ManagerEntity manager = managerService.findByManager_id(manager_id);
        model.addAttribute("end_date",manager.getEnddate());
        return "user/user_result";
    }
    @GetMapping("/UserEmail={manager_id}")
    public String UserEmail(@PathVariable("manager_id") String manager_id, Model model){
        System.out.println("useremail"+manager_id);
        ManagerEntity manager = managerService.findByManager_id(manager_id);
        return "user/user_email";
    }

}
