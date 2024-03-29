package com.example.inhavote.controller;

//import com.example.inhavote.DTO.CandidateDTO;
import com.example.inhavote.DTO.CreateVoteDTO;
import com.example.inhavote.DTO.RegisterVoteDTO;
import com.example.inhavote.Entity.*;
import com.example.inhavote.Service.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.example.inhavote.Entity.ManagerEntity;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/")
public class ManagerController {
    private final ManagerService managerService;
    private final StudentsService studentsService;
    private final CandidateService candidateService;
    private final UserService userService;

    @PostMapping(value = "/CreateVote")
    public String createVote(HttpServletRequest request,CreateVoteDTO createVoteDTO, RedirectAttributes redirectAttributes) {
        //System.out.println(createVoteDTO.toString());
        HttpSession session=request.getSession();
        String manager_id=(String)session.getAttribute("manager_id");

        if(manager_id!=null) {
            redirectAttributes.addFlashAttribute("err",false);
        }
        else if(manager_id==null){
            managerService.create_vote(createVoteDTO);
            session.setAttribute("manager_id",createVoteDTO.getManager_id());
            redirectAttributes.addFlashAttribute("managerid", createVoteDTO.getManager_id());
        }
        return "redirect:/CreateVote";
    }

    @GetMapping("/session")
    public String SessionCheck(HttpServletRequest request,@RequestParam String page,RedirectAttributes redirectAttributes){
        HttpSession session=request.getSession();
        session.setAttribute("page",page);
        String manager_id=(String)session.getAttribute("manager_id");

        //System.out.println("manager_id:"+manager_id);
        if(manager_id!=null){
            return "redirect:/"+page;
        }else {
            return "redirect:/Login";
        }
    }
    @GetMapping("/Result")
    public String Result(HttpServletRequest request,Model model,RedirectAttributes redirectAttributes) {
        HttpSession session=request.getSession();
        String manager_id=(String)session.getAttribute("manager_id");
        List<ManagerEntity> manager=managerService.findByManager_id(manager_id);

        if(manager_id!=null) {
            String err_m=managerService.compareVoteDate(manager_id);
            //System.out.println(err_m);
            if(!err_m.equals("success")){
                redirectAttributes.addFlashAttribute("end_date",manager.get(0).getEnddate());
                redirectAttributes.addFlashAttribute(err_m,false);
                return "redirect:/error";
            }
            else {
                CandidateEntity elected = candidateService.findElectedByVote_id(manager.get(0).getVoteid());
                StudentsEntity student = studentsService.findByStudent_id(elected.getStudentid());

                /*결과 출력 함수*/
                model.addAttribute("manager_id", manager_id);
                model.addAttribute("imgPath", elected.getImgpath());
                model.addAttribute("vote_name", manager.get(0).getVotename());
                model.addAttribute("vote_counter", elected.getVotecounter());
                model.addAttribute("vote_rate", candidateService.getVoteRateByVoteidAndVoteCounter(manager.get(0).getVoteid(), elected.getVotecounter()));
                model.addAttribute("total_vote_count", candidateService.getTotalVoteCountByVoteid(manager.get(0).getVoteid()));
                model.addAttribute("student_name", student.getStudentname());
                model.addAttribute("end_date", manager.get(0).getLastenddate());
                //
                model.addAttribute("user_vote_rate_byGrade1", userService.getUserVoteRateByVote_idAndStudentGrade(manager.get(0).getVoteid(), 1));
                model.addAttribute("user_vote_rate_byGrade2", userService.getUserVoteRateByVote_idAndStudentGrade(manager.get(0).getVoteid(), 2));
                model.addAttribute("user_vote_rate_byGrade3", userService.getUserVoteRateByVote_idAndStudentGrade(manager.get(0).getVoteid(), 3));
                model.addAttribute("user_vote_rate_byGrade4", userService.getUserVoteRateByVote_idAndStudentGrade(manager.get(0).getVoteid(), 4));
                model.addAttribute("user_vote_rate_byMajorA", userService.getUserVoteRateByVote_idAndStudentMajor(manager.get(0).getVoteid(), "소프트웨어융합공학과"));
                model.addAttribute("user_vote_rate_byMajorB", userService.getUserVoteRateByVote_idAndStudentMajor(manager.get(0).getVoteid(), "메카트로닉스공학과"));
                model.addAttribute("user_vote_rate_byMajorC", userService.getUserVoteRateByVote_idAndStudentMajor(manager.get(0).getVoteid(), "산업경영학과"));
                model.addAttribute("user_vote_rate_byMajorD", userService.getUserVoteRateByVote_idAndStudentMajor(manager.get(0).getVoteid(), "금융투자학과"));
                return "manager/manager_Result";
            }
        }
        else return "redirect:/error";
    }

    @GetMapping("/Register")
    public String Register(HttpServletRequest request,RedirectAttributes redirectAttributes,Model model) {
        HttpSession session=request.getSession();
        String manager_id=(String)session.getAttribute("manager_id");
        model.addAttribute("student_list", studentsService.findAll());
        if(manager_id!=null) {
            if (managerService.existVote(manager_id)){
                //System.out.println("테이블 존재 어쩌구");
                redirectAttributes.addFlashAttribute("err3",false);
                return "redirect:/error";
            }
            return "manager/manager_Register";
        }
        else return "redirect:/error";
    }
    @GetMapping("/URL")
    public String URL(HttpServletRequest request,RedirectAttributes redirectAttributes) {
        HttpSession session=request.getSession();
        String manager_id=(String)session.getAttribute("manager_id");
        if(manager_id!=null) {
            return "manager/manager_URL";
        }
        else return "redirect:/error";
    }

    @GetMapping("/session_out")
    public String SessionOut(HttpServletRequest request) throws IOException {
        HttpSession session=request.getSession();
        session.invalidate();
        String page=request.getHeader("Referer");
        return "redirect:/";
    }



    @PostMapping(value = "/Login/managerid_login")
    public String loginVote(HttpServletRequest request, @RequestParam String manager_id, @RequestParam String manager_name, RedirectAttributes redirectAttributes) {

        boolean login=managerService.findByManager_idAndManager_name(manager_id,manager_name);

        HttpSession session=request.getSession();
        String page =(String)session.getAttribute("page");
        if (login) {
            session.setAttribute("manager_id",manager_id);
            redirectAttributes.addFlashAttribute("manager_id", manager_id);
            redirectAttributes.addFlashAttribute("student_list", studentsService.findAll());
            //System.out.println("manager_id:"+session.getAttribute("manager_id"));
            if(page==null) return "redirect:/";
            else return "redirect:../"+page;

        } else {
            redirectAttributes.addFlashAttribute("err", false);
           return "redirect:../Login";
        }
    }


    @PostMapping(value = "/Register/vote_register",consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE})
    @ResponseBody
    public String registerVote(HttpSession session,@RequestPart(value="dataArr") RegisterVoteDTO registerVoteDTO, @RequestParam("imgArr") List<MultipartFile> imgArr){
        String session_confirm=(String)session.getAttribute("manager_id");
        if(session_confirm!=null){
            //System.out.println(registerVoteDTO.toString());
            String manager_id=registerVoteDTO.getManager_id();
            List<ManagerEntity> manager = managerService.findByManager_id(manager_id) ;
            String vote_id=manager.get(0).getVoteid();
            managerService.register_vote(vote_id,registerVoteDTO);
            candidateService.register_candidate(registerVoteDTO.getCandidates(),vote_id);
            studentsService.create_user(registerVoteDTO.getStudent_major(),registerVoteDTO.getStudent_grade(),vote_id);

            for(int i=0;i<registerVoteDTO.getCandidates().size();i++){
                candidateService.imgUpload(imgArr.get(i), registerVoteDTO.getCandidates().get(i).getStudentid(),vote_id);
            }

            return manager_id;
        }else return "redirect:/error";
    }

    @GetMapping("/Register/search")
    @ResponseBody // 문자열을 반환할 경우 @ResponseBody 어노테이션을 추가합니다.
    public List<StudentsEntity> getString(@RequestParam("param1") String param1) {
        //System.out.println(param1);
        List<StudentsEntity> result = studentsService.findByStudent(param1);
        return result;
    }

    @GetMapping("/manager/manager_URL={data}")
    public String setManagerid(@PathVariable("data") String manager_id,RedirectAttributes redirectAttributes){
        //System.out.println(manager_id);
        redirectAttributes.addFlashAttribute("manager_id", manager_id);
        return "redirect:/URL";

    }

}