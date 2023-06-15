package com.kbstar.controller;

import com.github.pagehelper.PageInfo;
import com.kbstar.dto.Guest;
import com.kbstar.dto.Like;
import com.kbstar.dto.Room;
import com.kbstar.service.LikeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@Slf4j
public class LikeController {
    @Autowired
    LikeService likeService;
    String dir = "like/";

    @RequestMapping("/likeList")
    public String likeList(@RequestParam(required = false, defaultValue = "1") int pageNo, Model model, HttpServletRequest request) throws Exception{
        PageInfo<Like> p = null;
        String guestId = null;

        try {
            HttpSession session = request.getSession(false); // false를 전달하여 새로운 세션을 생성하지 않도록 설정
            Guest loginGuest = (Guest) session.getAttribute("loginGuest");
                // 로그인 정보를 사용하여 원하는 작업 수행
            guestId = loginGuest.getGuestId();
            p = new PageInfo<>(likeService.likeList(pageNo, guestId), 5); // 5:하단 네비게이션 개수
        } catch (Exception e) {
            e.printStackTrace();
        }

        model.addAttribute("target","room");
        model.addAttribute("roomList",p);
        model.addAttribute("center",dir+"list");
        return "index";
    }
}
