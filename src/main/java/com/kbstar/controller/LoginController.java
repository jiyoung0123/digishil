package com.kbstar.controller;

import com.kbstar.dto.Guest;
import com.kbstar.service.GuestService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@Slf4j
public class LoginController {

    @Autowired
    GuestService guestService;
    @Autowired
    private BCryptPasswordEncoder encoder;
    @RequestMapping("/loginImpl")
    public String loginimpl(Model model, String guestId, String guestPwd, HttpSession session) throws Exception {
        Guest guest = null;
        String nextPage = "loginfail";
        try {
            guest = guestService.get(guestId);
            if(guest != null && encoder.matches(guestPwd,guest.getGuestPwd())){
                nextPage = "center";
                session.setMaxInactiveInterval(1000000);
                session.setAttribute("loginGuest",guest);
            }
        } catch (Exception e) {
            throw new Exception("시스템 장애 잠시 후 다시 로그인 하세요.");
        }
        model.addAttribute("center",nextPage);
        return "index";
    }

}
