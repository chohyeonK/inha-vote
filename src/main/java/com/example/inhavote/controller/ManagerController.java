package com.example.inhavote.controller;

//import com.example.inhavote.DTO.CandidateDTO;
import com.example.inhavote.DTO.CreateVoteDTO;
import com.example.inhavote.DTO.RegisterVoteDTO;
import com.example.inhavote.Entity.*;
import com.example.inhavote.Service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.example.inhavote.Entity.ManagerEntity;
import org.springframework.web.multipart.MultipartFile;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class ManagerController {
    private final ManagerService managerService;
    private final StudentsService studentsService;
    private final CandidateService candidateService;

    @PostMapping(value = "/CreateVote")
    public String createVote(CreateVoteDTO createVoteDTO, Model model) {
        //System.out.println(createVoteDTO.toString());
        managerService.create_vote(createVoteDTO);
        model.addAttribute("manager_id", createVoteDTO.getManager_id());
        return "manager/manager_CreateVote";
    }


    @PostMapping(value = "/Login/managerid_login")
    public String loginVote(@RequestParam String manager_id,@RequestParam String manager_name,Model model) {
        boolean login=managerService.findByManager_idAndManager_name(manager_id,manager_name);
        String return_page="";
        //System.out.println(manager_id+"  "+manager_name);
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

    @PostMapping(value = "/Login/result_login")
    public String loginResult(@RequestParam String manager_id,@RequestParam String manager_name,Model model) {
        boolean login=managerService.findByManager_idAndManager_name(manager_id,manager_name);
        List<ManagerEntity> manager = managerService.findByManager_id(manager_id);
        List<CandidateEntity> candidates = candidateService.findByVote_id(manager.get(0).getVoteid());
        StudentsEntity student = studentsService.findByStudent_id(candidates.get(0).getStudentid());
        Date end_date = manager.get(0).getEnddate();
        Date today = new Date();
        boolean compareDate = today.before(end_date);
        String return_page="";
        //System.out.println(manager_id+"  "+manager_name);
        //System.out.println(managerService.findByManager_idAndManager_name(manager_id,manager_name));

        if (login) {
            if (!(compareDate)) {
                model.addAttribute("manager_id", manager_id);
                model.addAttribute("vote_name", manager.get(0).getVotename());
                model.addAttribute("end_date", manager.get(0).getEnddate());
                model.addAttribute("vote_id", candidates.get(0).getVoteid());
                model.addAttribute("vote_counter", candidates.get(0).getVotecounter());
                model.addAttribute("student_name", student.getStudentname());
                model.addAttribute("candidate_promise", candidates.get(0).getCandidatepromise());
                return_page = "manager/manager_ResultCertified";
            } else if (compareDate) {
                model.addAttribute("err2", false);
                model.addAttribute("end_date", manager.get(0).getEnddate());
                return_page= "manager/manager_Result";
            }

        } else if (!(login)) {
            model.addAttribute("err1", false);
            return_page= "manager/manager_Result";
        }

        return return_page;
    }

    @PostMapping(value = "/Register/vote_register")
    @ResponseBody
    public String registerVote(@RequestBody RegisterVoteDTO registerVoteDTO, Model model){
        System.out.println(registerVoteDTO.toString());
        String manager_id=registerVoteDTO.getManager_id();
        List<ManagerEntity> manager = managerService.findByManager_id(manager_id) ;
        String vote_id=manager.get(0).getVoteid();
        managerService.register_vote(vote_id,registerVoteDTO);
        candidateService.register_candidate(registerVoteDTO.getCandidates(),vote_id);
        studentsService.create_user(registerVoteDTO.getStudent_major(),registerVoteDTO.getStudent_grade(),vote_id);


        return manager_id;
    }

    @GetMapping("/Register/search")
    @ResponseBody // 문자열을 반환할 경우 @ResponseBody 어노테이션을 추가합니다.
    public List<StudentsEntity> getString(@RequestParam("param1") String param1) {
        System.out.println(param1);
        List<StudentsEntity> result = studentsService.findByStudent(param1);
        return result;
    }

    @GetMapping("/manager/manager_URL={data}")
    public String setManagerid(@PathVariable("data") String manager_id,Model model){
        System.out.println(manager_id);
        model.addAttribute("manager_id", manager_id);
        return "manager/manager_URL";

    }

}