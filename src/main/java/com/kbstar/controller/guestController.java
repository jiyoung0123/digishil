package com.kbstar.controller;

import com.kbstar.dto.Guest;
import com.kbstar.service.GuestService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class guestController {
    @Autowired
    GuestService guestService;
    @Autowired
    private BCryptPasswordEncoder encoder;

    String dir = "guest/";

    @RequestMapping("/guestInfo")
    public String guestInfo(Model model, String id) throws Exception {
        Guest guest = null;
        guest = guestService.get(id);

        model.addAttribute("guest",guest);
        model.addAttribute("center",dir+"guestInfo");
        return "index";
    }
}
