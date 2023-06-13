package com.kbstar.controller;

import com.kbstar.dto.Like;
import com.kbstar.service.LikeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Slf4j
public class LikeController {
    @Autowired
    LikeService likeService;
    String dir = "like/";

    @RequestMapping("/likeList")
    public String likeList(Model model) {
        model.addAttribute("center",dir+"list");
        return "index";
    }
}
