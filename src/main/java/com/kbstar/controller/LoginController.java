package com.kbstar.controller;

import com.kbstar.dto.Guest;
import com.kbstar.service.GuestService;
import com.kbstar.util.MailUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.UUID;

@Controller
@Slf4j
public class LoginController {

    @Autowired
    GuestService guestService;
    @Autowired
    private BCryptPasswordEncoder encoder;
    @RequestMapping("/loginImpl")
    public String loginImpl(Model model, String guestId, String guestPwd, HttpSession session) {
        Guest guest = null;
        try {
            guest = guestService.get(guestId);
            if(guest != null && encoder.matches(guestPwd,guest.getGuestPwd())){
                session.setMaxInactiveInterval(1000000);
                session.setAttribute("loginGuest",guest);
                model.addAttribute("center","center");
            }if(guest == null || !encoder.matches(guestPwd,guest.getGuestPwd())){
                model.addAttribute("msg","아이디 혹은 비밀번호를 확인하세요.");
                model.addAttribute("center","login");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "index";
    }



}
