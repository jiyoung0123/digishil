package com.kbstar.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class likeListController {
    String dir = "likeList/";

    @RequestMapping("/likeList")
    public String likeList(Model model) {
        model.addAttribute("center",dir+"list");
        return "index";
    }
}
