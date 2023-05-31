package com.kbstar.controller;

import lombok.extern.slf4j.Slf4j;
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

    String dir = "reserve/";
    @RequestMapping("/reserve")
    public String reserveImpl(Model model, String reserveCap, String roomId, String guestId,
                              String roomPrice, String reserveDate, String reserveCheckIn, String reserveCheckOut) throws Exception {
        log.info("------------------------"+reserveCap);
        log.info("------------------------"+roomId);
        log.info("------------------------"+guestId);
        log.info("------------------------"+roomPrice);
        log.info("------------------------"+reserveDate);
        log.info("------------------------"+reserveCheckIn);
        log.info("------------------------"+reserveCheckOut);

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date checkInDate = dateFormat.parse(reserveCheckIn);
        Date checkOutDate = dateFormat.parse(reserveCheckOut);

        long duration = checkOutDate.getTime() - checkInDate.getTime();
        long daysBetween = TimeUnit.MILLISECONDS.toDays(duration);
        int reservePrice = (int) daysBetween * parseInt(roomPrice);

        log.info("------------------------ 가격    : " + reservePrice);
        log.info("------------------------ 경과 일수: " + daysBetween);
        log.info("------------------------ 체크인  : " + checkInDate);
        log.info("------------------------ 체크아웃 : " + checkOutDate);

        model.addAttribute("center",dir+"step1");
        return "index";

    }
}
