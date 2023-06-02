package com.kbstar.controller;

import com.kbstar.dto.Reserve;
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
import java.util.concurrent.TimeUnit;

import static java.lang.Integer.parseInt;

@Controller
@Slf4j
public class ReserveController {
    @Autowired
    ReserveService reserveService;
    @Autowired
    RoomService roomService;

    String dir = "reserve/";
    @RequestMapping("/reserve")
    public String reserveImpl(Model model, String reserveCap, String roomId, String guestId,
                              String roomPrice, String reserveDate, String reserveCheckIn, String reserveCheckOut) throws Exception {
        if(guestId.equals("")){
            model.addAttribute("center","login");
            return "index";
        }
        else{
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date checkInDate = dateFormat.parse(reserveCheckIn);
        Date checkOutDate = dateFormat.parse(reserveCheckOut);

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
        model.addAttribute("center","reserve/reserveList");
        return "index";
    }

}
