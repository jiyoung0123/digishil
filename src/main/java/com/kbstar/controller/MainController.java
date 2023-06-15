package com.kbstar.controller;


import com.kbstar.dto.KakaoApproveResponse;
import com.kbstar.dto.Reserve;
import com.kbstar.service.GuestService;
import com.kbstar.service.ReserveService;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.List;


@Slf4j

@Controller
public class MainController {


    Logger logger = LoggerFactory.getLogger(this.getClass().getSimpleName());



    @RequestMapping("/")
    public String main(Model model) throws Exception {
        return "index";
    }

    @RequestMapping("/register")
    public String register(Model model){
        model.addAttribute("center","register");
        return "index";
    }



    @RequestMapping("/registerDetail")
    public String registerDetail(Model model){
        model.addAttribute("center","registerDetail");
        return "index";
    }

    @RequestMapping("/login")
    public String login(Model model){
        model.addAttribute("center","login");
        return "index";
    }
    @RequestMapping("/logouts")
    public String logout(Model model, HttpSession session){
        if(session != null){
            session.invalidate();
        }
        return "redirect:/";
    }

    @RequestMapping("/searchList")
    public String searchList(Model model){
        model.addAttribute("center", "searchList");
        return "index";
    }





}
