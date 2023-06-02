package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Reserve;
import com.kbstar.dto.Room;
import com.kbstar.service.ReserveService;
import com.kbstar.service.RoomService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/room")
public class RoomController {
    @Autowired
    RoomService roomService;
    String dir ="room/";

    @RequestMapping("/list")
    public String list(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model) throws Exception {
        PageInfo<Room> p = null;
        try {
            p = new PageInfo<>(roomService.getPage(pageNo), 5); // 5:하단 네비게이션 개수
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("target","room");
        model.addAttribute("roomList",p);
        model.addAttribute("center",dir+"list");
        return "index";
    }

    @RequestMapping("/detail")
    public String detail(Model model, Integer id) throws Exception {
        Room room = null;
        room = roomService.get(id);

        model.addAttribute("roomDetail",room);
        model.addAttribute("center",dir+"detail");
        return "index";
    }

}
