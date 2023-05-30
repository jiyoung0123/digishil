package com.kbstar.controller;

import com.kbstar.dto.Room;
import com.kbstar.service.RoomService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/room")
public class RoomController {
    @Autowired
    RoomService roomService;
    String dir ="room/";

    @RequestMapping("/list")
    public String list(Model model) throws Exception {
        List<Room> list = null;
        list = roomService.get();

        model.addAttribute("roomList", list);
        model.addAttribute("center",dir+"list");
        return "index";
    }
}
