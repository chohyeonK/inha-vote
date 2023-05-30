package com.example.inhavote.controller;

//import com.example.inhavote.DTO.CandidateDTO;
import com.example.inhavote.DTO.CreateVoteDTO;
import com.example.inhavote.DTO.RegisterVoteDTO;
import com.example.inhavote.Entity.*;
import com.example.inhavote.Service.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.example.inhavote.Entity.ManagerEntity;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
        model.addAttribute("managerid", createVoteDTO.getManager_id());
        return "manager/manager_CreateVote";
    }

    @GetMapping("/session")
    public String SessionCheck(HttpServletRequest request,@RequestParam String page,RedirectAttributes redirectAttributes){
        HttpSession session=request.getSession();
        session.setAttribute("page",page);
        String manager_id=(String)session.getAttribute("manager_id");
        //System.out.println(page);
        //System.out.println("session:"+session);
        System.out.println("manager_id:"+manager_id);
        //redirectAttributes.addAttribute("page",page);
        if(manager_id!=null){
            return "redirect:/"+page;
        }else {
            return "redirect:/Login";
        }
    }
    @GetMapping("/Result")
    public String Result(HttpServletRequest request,RedirectAttributes redirectAttributes) {
        HttpSession session=request.getSession();
        String manager_id=(String)session.getAttribute("manager_id");
        List<ManagerEntity> manager=managerService.findByManager_id(manager_id);
        if(manager_id!=null) {
            if(managerService.compareVoteDate(manager_id)){
                if(!managerService.existVote(manager_id)){
                    System.out.println("등록 안됨");
                    redirectAttributes.addFlashAttribute("err4",false);
                    //redirectAttributes.addFlashAttribute("page","/");
                    return "redirect:/error";
                }
               else {
                    System.out.println("날짜 안지남");
                    redirectAttributes.addFlashAttribute("end_date",manager.get(0).getEnddate());
                    redirectAttributes.addFlashAttribute("err2",false);
                    return "redirect:/error";
                }
            }
            /*결과 출력 함수*/
            return "manager/manager_ResultCertified";
        }
        else return "/error";
    }

    @GetMapping("/Register")
    public String Register(HttpServletRequest request,RedirectAttributes redirectAttributes,Model model) {
        HttpSession session=request.getSession();
        String manager_id=(String)session.getAttribute("manager_id");
        model.addAttribute("student_list", studentsService.findAll());
        if(manager_id!=null) {
            if (managerService.existVote(manager_id)){
                System.out.println("테이블 존재 어쩌구");
                redirectAttributes.addFlashAttribute("err3",false);
                return "redirect:/error";
            }
            return "manager/manager_Register";
        }
        else return "/error";
    }
    @GetMapping("/URL")
    public String URL(HttpServletRequest request,RedirectAttributes redirectAttributes) {
        HttpSession session=request.getSession();
        String manager_id=(String)session.getAttribute("manager_id");
        if(manager_id!=null) {
            return "manager/manager_URL";
        }
        else return "/error";
    }

    @GetMapping("/session_out")
    public String SessionOut(HttpServletRequest request){
        HttpSession session=request.getSession();
        session.invalidate();
        //String page=request.getHeader("Referer").split("\\?")[1];
        //System.out.println(page);
        return "redirect:/";
    }



    @PostMapping(value = "/Login/managerid_login")
    public String loginVote(HttpServletRequest request, @RequestParam String manager_id, @RequestParam String manager_name, RedirectAttributes redirectAttributes) {

        boolean login=managerService.findByManager_idAndManager_name(manager_id,manager_name);
        //System.out.println(manager_id+"  "+manager_name);
        //System.out.println(managerService.findByManager_idAndManager_name(manager_id,manager_name));
        HttpSession session=request.getSession();
        String page =(String)session.getAttribute("page");
        // System.out.println("login:"+session+"/page:"+page);
        if (login) {
            session.setAttribute("manager_id",manager_id);
            redirectAttributes.addFlashAttribute("manager_id", manager_id);
            //redirectAttributes.addFlashAttribute("student_list", studentsService.findAll());
            //System.out.println("manager_id:"+session.getAttribute("manager_id"));
            return "redirect:../"+page;

        } else if (!(login)) {
            redirectAttributes.addFlashAttribute("err", false);
            return "redirect:../Login";
        }
        return "redirect:../"+page;
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
        }else return "/error";
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