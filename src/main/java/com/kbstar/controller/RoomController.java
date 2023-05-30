package com.kbstar.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/room")
public class RoomController {
    String dir ="room/";

    @RequestMapping("/list")
    public String list(Model model) throws Exception {
        model.addAttribute("center",dir+"list");
        return "index";
    }
}
