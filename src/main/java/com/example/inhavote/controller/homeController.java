package com.example.inhavote.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.boot.web.servlet.error.ErrorAttributes;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

@Controller
public class homeController implements ErrorController {

    @GetMapping("/")
    public String Home() {
        return "manager/manager_Home";
    }
    @GetMapping("/CreateVote")
    public String CreateVote()
    {
        return "manager/manager_CreateVote";
    }
    @GetMapping("/Login")
    public String Login()
    {
        return "manager/manager_Login";
    }

   /* @GetMapping("/UserVote")
    public String Vote() { return "user/user_vote"; }
    @GetMapping("/UserResult")
    public String userResult() { return "user/user_result"; }
    @GetMapping("/UserHome")
    public String UserHome() { return "user/user_home"; }
    @GetMapping("/UserInfo")
    public String UserInfo() { return "user/user_info"; }
    @GetMapping("/UserEmail")
    public String UserEmail() { return "user/user_email"; }*/

    @GetMapping("/Admin")
    public String Admin() { return "Admin"; }


    @GetMapping("/error")
    public String error(Model model,HttpServletRequest request) {
        HttpSession session = request.getSession();

        String manager_id = (String) session.getAttribute("manager_id");
        model.addAttribute("manager_id",manager_id);
        return "err";
    }
    @GetMapping("/error_u")
    public String error_user() {

        return "u_err";
    }
}
