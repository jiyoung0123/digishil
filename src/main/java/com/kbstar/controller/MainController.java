package com.kbstar.controller;


import com.kbstar.dto.KakaoApproveResponse;
import com.kbstar.service.GuestService;
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

    @RequestMapping("/pay")
    public String pay(Model model){
        model.addAttribute("center","pay");
        return "index";
    }

    @RequestMapping("/kakaopay")
    public String kakaopay(Model model){
        model.addAttribute("center","kakaoPay");
        return "index";
    }

    @RequestMapping("/paysuccess")
    public String paysuccess(Model model){
        model.addAttribute("center","paySuccess");
        return "index";
    }

}
