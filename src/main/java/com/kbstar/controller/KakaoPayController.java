package com.kbstar.controller;

import com.kbstar.dto.Guest;
import com.kbstar.dto.KakaoApproveResponse;
import com.kbstar.dto.Reserve;
import com.kbstar.dto.Room;
import com.kbstar.service.GuestService;
import com.kbstar.service.KakaoPayService;
import com.kbstar.service.ReserveService;
import com.kbstar.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import static java.lang.Integer.parseInt;


@Controller
public class KakaoPayController {

    @Autowired
    ReserveService reserveService;
    @Autowired
    RoomService roomService;
    @Autowired
    GuestService guestService;

    private KakaoPayService kakaoPayService;

    public KakaoPayController(KakaoPayService kakaoPayService) {

        this.kakaoPayService = kakaoPayService;
    }

    @GetMapping("/payment/success")
    public String afterPayRequest(@RequestParam("pg_token") String pgToken, Model model) {
        KakaoApproveResponse kakaoApprove = kakaoPayService.ApproveResponse(pgToken);
        model.addAttribute("payResult", kakaoApprove);
        model.addAttribute("center", "paySuccess");
        return "index";
    }

    @RequestMapping("/kakaopay")
    public String kakaopay(Model model, int reserveId) throws ParseException {
        Reserve reserve = null;
        try {
            reserve = reserveService.get(reserveId);
        } catch (Exception e) {
            e.printStackTrace();
        }
       int roomId = reserve.getRoomId();
        Room room = null;
        try {
            room=roomService.get(roomId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        String guestId = reserve.getGuestId();
        Guest guest= null;
        try {
            guest=guestService.get(guestId);
        } catch (Exception e) {
            e.printStackTrace();
        }

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date reserveCheckIn=reserve.getReserveCheckIn();
        Date reserveChectOut=reserve.getReserveCheckOut();

        Date checkInDate = dateFormat.parse(String.valueOf(reserveCheckIn));
        Date checkOutDate = dateFormat.parse(String.valueOf(reserveChectOut));

        long duration = checkOutDate.getTime() - checkInDate.getTime();
        long daysBetween = TimeUnit.MILLISECONDS.toDays(duration);
//        int reservePrice = (int) daysBetween * parseInt(roomPrice);

//
//        long duration = checkOutDate.getTime() - checkInDate.getTime();
//        long daysBetween = TimeUnit.MILLISECONDS.toDays(duration);
//        int reservePrice = (int) daysBetween * parseInt(String.valueOf(room.getRoomPrice()));

        model.addAttribute("days",daysBetween);









//        --------------------------------------------------
        model.addAttribute("guest", guest);
        model.addAttribute("room", room);
        model.addAttribute("reserve", reserve);
        model.addAttribute("center", "kakaoPay");
        return "index";
    }
}
