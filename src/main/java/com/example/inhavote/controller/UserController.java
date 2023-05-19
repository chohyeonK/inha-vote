package com.example.inhavote.controller;

import com.example.inhavote.DTO.StudentVoteDTO;
import com.example.inhavote.Entity.*;
import com.example.inhavote.RandomCode;
import com.example.inhavote.Repository.UserRepository;
import com.example.inhavote.Service.*;
import org.springframework.ui.Model;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Objects;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class UserController {
    private final ManagerService managerService;
    private final StudentsService studentsService;

    private final UserService userService;

    private final EmailService emailService;

//    public MainController(EmailService emailService) {
//        this.emailService = emailService;
//    }

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

    @PostMapping("/sendAuth")
    @ResponseBody
    public boolean sendAuth(@RequestBody StudentVoteDTO studentDTO){
        try {
            String studentId = studentDTO.getStudentId();
            String studentEmail = studentDTO.getStudentEmail();
            String voteId = studentDTO.getVoteId();
            String authCode = RandomCode.randomCode();

            // 이름, 학번, vote_id로 투표자 확인
//            StudentsEntity 이름 비교?
            UserEntity voteStudent = userService.authUser(studentId, voteId, authCode);

            // 아니라면 확인되지 않은 사용자 문구 안내
            if (voteStudent == null) {
                return false;
            }

            // 맞다면 이메일 인증 번호 발송함
            emailService.sendMail(studentEmail, authCode);

            return true;
        } catch (Exception e) {
            return false;
        }
    }

    @PostMapping("/confirmCode")
    @ResponseBody
    public boolean confirmCode(@RequestBody StudentVoteDTO studentDTO){
        String studentId = studentDTO.getStudentId();
        String voteId = studentDTO.getVoteId();
        String code = studentDTO.getConfirmCode();

        UserEntity voteStudent = userService.findByStudent_idAndVote_id(studentId, voteId);
        if (voteStudent == null) {
            return false;
        }

        // 저장된 인증번호와 입력한 인증번호 비교
        if (Objects.equals(voteStudent.getEmailconfirm(), code)) {
            userService.authCode(voteStudent);
            return true;
        } else {
            return false;
        }
    }

}
