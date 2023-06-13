package com.kbstar.controller;

import com.kbstar.dto.Guest;
import com.kbstar.dto.Reserve;
import com.kbstar.service.GuestService;
import com.kbstar.service.ReserveService;
import com.kbstar.service.RoomService;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import static java.lang.Integer.parseInt;

@Controller
@Slf4j
public class ReserveController {
    @Autowired
    ReserveService reserveService;
    @Autowired
    RoomService roomService;
    @Autowired
    GuestService guestService;

    String dir = "reserve/";
    @RequestMapping("/reserve")
    public String reserveImpl(Model model, String reserveCap, String roomId, String guestId,
                              String roomPrice, String reserveDate, String reserveCheckIn, String reserveCheckOut) throws Exception {
        // 로그인 안 되어있을 시 로그인 하기
        if(guestId.equals("")){
            model.addAttribute("center","login");
            return "index";
        }
        else{
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        // 프론트에서 넘어온 날짜를 date 형태로 받기
        Date checkInDate = dateFormat.parse(reserveCheckIn);
        Date checkOutDate = dateFormat.parse(reserveCheckOut);

        // 숙'박' 일 수 계산
        long duration = checkOutDate.getTime() - checkInDate.getTime();
        long daysBetween = TimeUnit.MILLISECONDS.toDays(duration);
        int reservePrice = (int) daysBetween * parseInt(roomPrice);

        Reserve reserve = null;
        reserve = new Reserve(guestId,parseInt(roomId),checkInDate,checkOutDate,reservePrice,parseInt(reserveCap));
        reserveService.register(reserve);
        Object room = roomService.get(parseInt(roomId));

        Reserve reserve1  = reserveService.searchId(reserve);
        int reserveId = reserve1.getReserveId();

        model.addAttribute("reserveId",reserveId);
        model.addAttribute("room",room);
        model.addAttribute("days",daysBetween);
        model.addAttribute("reserve",reserve);
        model.addAttribute("center",dir+"step1");
        log.info("-----------------------------------------------reserveId:"+reserveId);
        return "index";
        }
    }
    @RequestMapping("/reservelist")
    public String reserveList(Model model, String guestId){
        List <Reserve> list = null;
        try {
            list = reserveService.getMyReserve(guestId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        Guest guest = null;
        try {
            guest = guestService.get(guestId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        model.addAttribute("getMyReserve", list);
        model.addAttribute("guest", guest);
        model.addAttribute("center","reserve/reserveList");
        log.info(list.toString());
        return "index";
    }

    @RequestMapping("/reserve/pastReserve")
    public String pastReserve(Model model){
        model.addAttribute("center","reserve/pastReserve");
        return "index";
    }

}
