package com.example.inhavote.controller;

import com.example.inhavote.DTO.CandidateStudentDTO;
import com.example.inhavote.DTO.ResponseDTO;
import com.example.inhavote.DTO.StudentVoteDTO;
import com.example.inhavote.DTO.VoteDTO;
import com.example.inhavote.Entity.*;
import com.example.inhavote.RandomCode;
import com.example.inhavote.Service.*;
import com.fasterxml.jackson.core.JsonProcessingException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.ui.Model;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Collections;
import java.util.List;
import java.util.Objects;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class UserController {
    private final ManagerService managerService;
    private final StudentsService studentsService;
    private final CandidateService candidateService;

    private final UserService userService;

    private final EmailService emailService;

//    public MainController(EmailService emailService) {
//        this.emailService = emailService;
//    }

    @GetMapping("/UserHome={manager_id}")
    public String UserHome(@PathVariable("manager_id") String manager_id, Model model){
        //System.out.println("user"+manager_id);
        List<ManagerEntity> manager = managerService.findByManager_id(manager_id);

        model.addAttribute("vote_list",manager);
        model.addAttribute("start_date",manager.get(0).getStartdate());
        model.addAttribute("end_date",manager.get(0).getEnddate());
        model.addAttribute("manager_id", manager_id);
        return "user/user_home";
    }
    @GetMapping("/UserInfo={manager_id}")
    public String UserInfo_home(@PathVariable("manager_id") String manager_id, Model model){
        //System.out.println("user"+manager_id);
        List<ManagerEntity> manager = managerService.findByManager_id(manager_id);
        model.addAttribute("manager_id",manager_id);
        model.addAttribute("vote_list",manager);
        model.addAttribute("vote_id",manager.get(0).getVoteid());
        model.addAttribute("start_date",manager.get(0).getStartdate());
        model.addAttribute("end_date",manager.get(0).getEnddate());

        return "user/user_info_home";
    }
    @GetMapping("/UserInfo_list={manager_id}")
    public String UserInfo_list(@PathVariable("manager_id") String manager_id,@RequestParam("vote_id")String vote_id, Model model) throws JsonProcessingException {
        //System.out.println("manager_id=" + manager_id + "vote_id=" + vote_id);

        String name=managerService.findByVote_id(vote_id).getVotename();
        List<StudentsEntity> candidate_list=candidateService.candidate_List(vote_id);
        List<CandidateStudentDTO> cadidate_student = candidateService.findCandidateStudent(vote_id);


        model.addAttribute("manager_id",manager_id);
        model.addAttribute("vote_id",vote_id);
        model.addAttribute("vote_name",name);
        model.addAttribute("cadidate_student",cadidate_student);

        return "user/user_info_list";
    }
    @GetMapping("/UserInfo_candidate")
    public String UserInfo_candidate(@RequestParam("vote_id") String vote_id, @RequestParam("student_id") String student_id, @RequestParam("candiNum") String candiNum, Model model){
        StudentsEntity candidate = studentsService.findByStudent_id(student_id);
        CandidateEntity candidate_info = candidateService.findByStudentidAndVoteid(student_id, vote_id);

        model.addAttribute("candidate", candidate);
        model.addAttribute("candiNum", candiNum);
        model.addAttribute("candidate_info",candidate_info);


        return "user/user_info_candidate";
    }
    @GetMapping("/UserResult={manager_id}")
    public String UserResult(@PathVariable("manager_id") String manager_id, Model model){
        System.out.println("userresult"+manager_id);
        List<ManagerEntity> manager = managerService.findByManager_id(manager_id);
        CandidateEntity elected = candidateService.findElectedByVote_id(manager.get(0).getVoteid());
        StudentsEntity student = studentsService.findByStudent_id(elected.getStudentid());

        model.addAttribute("manager_id", manager_id);
        model.addAttribute("vote_counter", elected.getVotecounter());
        model.addAttribute("vote_rate", candidateService.getVoteRateByVoteidAndVoteCounter(manager.get(0).getVoteid(), elected.getVotecounter()));
        model.addAttribute("total_vote_count", candidateService.getTotalVoteCountByVoteid(manager.get(0).getVoteid()));
        model.addAttribute("student_name", student.getStudentname());
        model.addAttribute("end_date", manager.get(0).getEnddate());
        model.addAttribute("user_vote_rate", userService.getUserVoteRateByVote_id(manager.get(0).getVoteid()));
        return "user/user_result";
    }
    @GetMapping("/UserEmail={manager_id}")
    public String UserEmail(@PathVariable("manager_id") String manager_id,Model model){

        List<ManagerEntity> manager = managerService.findByManager_id(manager_id);
        model.addAttribute("vote_id", manager.get(0).getVoteid());
        return "user/user_email";
    }

    @PostMapping("/sendAuth")
    @ResponseBody
    public ResponseDTO sendAuth(@RequestBody StudentVoteDTO studentDTO){
        ResponseDTO res = new ResponseDTO(); // 결과 JSON 생성

        try {
            String studentId = studentDTO.getStudentId();
            String studentEmail = studentDTO.getStudentEmail();
            String voteId = studentDTO.getVoteId();
            String authCode = RandomCode.randomCode();

            // 투표 대상 확인
            UserEntity voter = userService.voterConfirm(studentId, voteId);

            // 투표 대상 아니라면 110 return
            if (voter == null) {
                res.setResCode(110);
                res.setResMessage("투표권이 없습니다. 계정을 다시 확인해주세요.");

                return res;
            } else { // 투표 대상 맞다면 투표 여부 확인
                if (voter.isVoteconfirm()) { // 기 투표자라면 130 return
                    res.setResCode(130);
                    res.setResMessage("이미 투표를 완료하였습니다.");

                    return res;
                } else { // 미 투표자라면 이메일 인증 번호 발송 후 120 return
                    userService.saveAuthCode(voter, authCode);
                    emailService.sendMail(studentEmail, authCode);

                    res.setResCode(120);
                    res.setResMessage("인증 이메일이 발송되었습니다. 메일을 확인해주세요.");

                    return res;
                }
            }
        } catch (Exception e) {
            res.setResCode(140);
            res.setResMessage("관리자에게 문의해주세요.");
            return res;
        }
    }

    @PostMapping("/confirmCode")
    @ResponseBody
    public ResponseDTO confirmCode(HttpServletRequest request, @RequestBody StudentVoteDTO studentDTO){
        ResponseDTO res = new ResponseDTO(); // 결과 JSON 생성
        HttpSession session = request.getSession();
        //System.out.println("투표세션"+session);

        try {
            String studentId = studentDTO.getStudentId();
            String voteId = studentDTO.getVoteId();
            String code = studentDTO.getConfirmCode();

            // 투표 대상 확인
            UserEntity voter = userService.findByStudent_idAndVote_id(studentId, voteId);

            // 투표 대상 아니라면 110 return
            if (voter == null) {
                res.setResCode(110);
                res.setResMessage("투표권이 없습니다. 계정을 다시 확인해주세요.");

                return res;
            } else { // 투표 대상 맞다면 저장된 인증번호와 입력한 인증번호 비교
                if (Objects.equals(voter.getEmailconfirm(), code)) {
                    session.setAttribute("voter",voter);
                    //System.out.println("투표 세션 저장"+session.getAttribute("voter"));
                    userService.authCode(voter);

                    res.setResCode(120);
                    res.setResMessage("인증되었습니다. 투표 페이지로 이동합니다.");
                    return res;
                } else { // 인증번호가 맞지 않음
                    res.setResCode(140);
                    res.setResMessage("인증번호가 맞지 않습니다. 다시 확인해주세요.");
                    return res;
                }
            }
        } catch (Exception e) {
            res.setResCode(140);
            res.setResMessage("관리자에게 문의해주세요.");
            return res;
        }
    }

    @GetMapping("/UserVote")
    public String UserVote(HttpServletRequest request,@RequestParam("manager_id") String manager_id, @RequestParam("vote_id") String vote_id,  @RequestParam("student_id") String student_id, Model model){
        HttpSession session=request.getSession();
        UserEntity voter = (UserEntity) session.getAttribute("voter");
        String name = managerService.findByVote_id(vote_id).getVotename();
        List<ManagerEntity> manager = managerService.findByManager_id(manager_id);
        List<CandidateStudentDTO> cadidate_student = candidateService.findCandidateStudent(vote_id);

        if(voter!=null&&voter.getEmailconfirm().equals("T")){

            model.addAttribute("start_date",manager.get(0).getStartdate());
            model.addAttribute("end_date",manager.get(0).getEnddate());
            model.addAttribute("vote_student_id", student_id);
            model.addAttribute("manager_id",manager_id);
            model.addAttribute("vote_id",vote_id);
            model.addAttribute("vote_name",name);
            model.addAttribute("candidate_student", cadidate_student);

            return "user/user_vote";
        }
        else return "/error";

    }

    @PostMapping("/onVote")
    @ResponseBody
    public boolean onVote(@RequestBody VoteDTO VoteDTO){
        try {
            String studentId = VoteDTO.getStudent_id();
            String voteId = VoteDTO.getVote_id();
            String voteNumber = VoteDTO.getVote_number();

            boolean voteActive = candidateService.voteCounter(studentId, voteId, voteNumber);

            if (voteActive) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

}
