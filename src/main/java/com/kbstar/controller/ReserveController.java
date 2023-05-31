package com.kbstar.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class ReserveController {

    String dir = "reserve/";
    @RequestMapping("/reserve")
    public String reserveImpl(Model model, String reserveCap, String roomId, String guestId, String roomPrice, String reserveDate) throws Exception {
        log.info("------------------------"+reserveCap);
        log.info("------------------------"+roomId);
        log.info("------------------------"+guestId);
        log.info("------------------------"+roomPrice);
        log.info("------------------------"+reserveDate);

        model.addAttribute("center",dir+"step1");
        return "index";

    }
}
