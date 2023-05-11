package com.example.inhavote.controller;

//import com.example.inhavote.DTO.CandidateDTO;
import com.example.inhavote.DTO.ManagerDTO;
import com.example.inhavote.Entity.*;
import com.example.inhavote.Service.*;
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
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class ManagerController {
    private final ManagerService managerService;
    private final StudentsService studentsService;

    @PostMapping(value = "/CreateVote")
    public String createVote(ManagerDTO managerDTO, Model model) {
        System.out.println(managerDTO.toString());
        managerService.create_vote(managerDTO);
        model.addAttribute("manager_id", managerDTO.getManager_id());
        return "manager/manager_CreateVote";
    }


    @PostMapping(value = "/Login/managerid_login")
    public String loginVote(@RequestParam String manager_id,@RequestParam String manager_name,Model model) {
        boolean login=managerService.findByManager_idAndManager_name(manager_id,manager_name);
        String return_page="";
        System.out.println(manager_id+"  "+manager_name);
        //System.out.println(managerService.findByManager_idAndManager_name(manager_id,manager_name));

        if (login) {
          model.addAttribute("manager_id", manager_id);

            model.addAttribute("student_list", studentsService.findAll());
            return_page= "manager/manager_Register";
        } else if (!(login)) {
            model.addAttribute("err", false);
            return_page= "manager/manager_Login";
        }

        return return_page;
    }

    @PostMapping(value = "/Register/vote_register")
    public String registerVote(@RequestParam MultipartFile img,Model model, @RequestParam String manager_id, @RequestParam String vote_name, @RequestParam String student_major, @RequestParam int student_grade, @RequestParam String start_date, @RequestParam String end_date) throws ParseException {
        ManagerEntity manager = managerService.findByManager_id(manager_id) ;
        SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date m_start_date,m_end_date;
        m_start_date=formatter.parse(start_date+" 09:00:00");
        m_end_date=formatter.parse(end_date+" 18:00:00");
        System.out.println(manager_id+"/"+vote_name+" 전공:"+student_major+" 학년:"+student_grade);
        managerService.register_vote(manager.getVoteid(),vote_name,student_grade,student_major,m_start_date,m_end_date);
        managerService.imgUpload(img);

        studentsService.create_user(student_major,student_grade,manager.getVoteid());
        model.addAttribute("manager_id", manager_id);

        //model .addAttribute("err",managerService.imgUpload(file));
        return "manager/manager_URL";
    }

    @GetMapping("/Register/search")
    public List<StudentsEntity> searchName(@RequestParam String student_name){
        System.out.println(student_name);
        List<StudentsEntity> result = studentsService.findByStudent_name(student_name);

        return result;

    }

}