package com.kbstar.controller;

import com.kbstar.dto.*;
import com.kbstar.service.GuestService;
import com.kbstar.service.KakaoPayService;
import com.kbstar.service.ReserveService;
import com.kbstar.service.RoomService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import static java.lang.Integer.parseInt;

@Slf4j
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

    //  public String afterPayRequest(@RequestParam("pg_token") String pgToken, Model model,@RequestParam("reserveId") Integer reserveId) {
    @RequestMapping ("/payment/success")
    public String afterPayRequest(@RequestParam("pg_token") String pgToken, Model model, KakaoReadyResponse kakaoReady) throws Exception {
        log.info("cccccccccccccccccccccccccccccccccccc  : afterPayRequest 도착");
        KakaoApproveResponse kakaoApprove = kakaoPayService.ApproveResponse(pgToken);
        log.info("KakaoApprove 확인해보기!!!!!!!!!!!!!!!!!!!!!!!!"+kakaoApprove.toString());
        log.info("----------------------------------------kakaoReady :"+kakaoReady);
        int reserveId = Integer.parseInt(kakaoApprove.getPartner_order_id());

        Reserve reserve = null;
        try {
            reserve = reserveService.get(reserveId);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        String reservePayType = kakaoApprove.getPayment_method_type();
        String reserveApi=kakaoApprove.getTid();
        log.info(reserveApi);
        reserve.setReservePayType(reservePayType);
        reserve.setReserveApi(reserveApi);
        log.info("=================reserveApi매칭========================="+reserve.getReserveApi());
        try {
            kakaoPayService.reserveComplete(reserve);
            int reserveId2 = reserve.getReserveId();

            // 변경된 reserve 정보를 데이터베이스에서 다시 조회
            Reserve completeReserve = reserveService.get(reserveId2);
            model.addAttribute("reserve", completeReserve);
            log.info(String.valueOf(completeReserve));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
//        ======================================================
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
        Date reserveCheckIn = reserve.getReserveCheckIn();
        Date reserveCheckOut = reserve.getReserveCheckOut();
        String checkInDateStr = dateFormat.format(reserveCheckIn);
        String checkOutDateStr = dateFormat.format(reserveCheckOut);
        Date checkInDate = dateFormat.parse(checkInDateStr);
        Date checkOutDate = dateFormat.parse(checkOutDateStr);
        long duration = checkOutDate.getTime() - checkInDate.getTime();
        long daysBetween = TimeUnit.MILLISECONDS.toDays(duration);

        model.addAttribute("days",daysBetween);
        model.addAttribute("guest", guest);
        model.addAttribute("room", room);

        model.addAttribute("payResult", kakaoApprove);
        model.addAttribute("center", "paySuccess");
        log.info("cccccccccccccccccccccccccccccccccccc  : afterPayRequest 끝");
        return "index";
    }

    @RequestMapping("/kakaopay")
    public String kakaopay(Model model, int reserveId) throws Exception {
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
        Date reserveCheckIn = reserve.getReserveCheckIn();
        Date reserveCheckOut = reserve.getReserveCheckOut();
        String checkInDateStr = dateFormat.format(reserveCheckIn);
        String checkOutDateStr = dateFormat.format(reserveCheckOut);
        Date checkInDate = dateFormat.parse(checkInDateStr);
        Date checkOutDate = dateFormat.parse(checkOutDateStr);
        long duration = checkOutDate.getTime() - checkInDate.getTime();
        long daysBetween = TimeUnit.MILLISECONDS.toDays(duration);

        log.info(String.valueOf(checkInDateStr));
        log.info(String.valueOf(checkOutDateStr));
        log.info(String.valueOf(daysBetween));

        HostRoomReserveReview hostInfo = new HostRoomReserveReview();
        hostInfo = reserveService.findByReserveId(15);
        String hostId = hostInfo.getHostId();
        String chatSender = hostInfo.getGuestId();

//        List<HostRoomReserveReview> hostInfo = new ArrayList<>();
//        hostInfo = reserveService.findByReserveId(reserveId);

        model.addAttribute("hostId", hostId);
        model.addAttribute("chatSender",chatSender);
        model.addAttribute("days",daysBetween);
        model.addAttribute("guest", guest);
        model.addAttribute("room", room);
        model.addAttribute("reserve", reserve);
        model.addAttribute("center", "kakaoPay");
        return "index";
    }


    /**
     * 환불
     */
    @RequestMapping("/payment/refund")
    public String refund(@RequestParam("reserveId") int reserveId, Model model ) {
        log.info("================================aaaaaaaaaaaaaaaaaaa  : refund 도착");
        Reserve reserve = null;
        try {
            reserve = reserveService.get(reserveId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        log.info("refund 도착---------------------" + String.valueOf(reserve));
        KakaoCancelResponse kakaoCancelResponse = kakaoPayService.kakaoCancel(reserve);
        try {
            kakaoPayService.refundComplete(reserve);
            int reserveId2 = reserve.getReserveId();

            // 변경된 reserve 정보를 데이터베이스에서 다시 조회
            Reserve refundReserve = reserveService.get(reserveId2);
            model.addAttribute("reserve", refundReserve);
            log.info("===============================확인요망!!"+String.valueOf(refundReserve));
            String guestId = refundReserve.getGuestId();
            Guest guest= null;
            try {
                guest=guestService.get(guestId);
            } catch (Exception e) {
                e.printStackTrace();
            }
            model.addAttribute("guest", guest);
             } catch (Exception e) {
            throw new RuntimeException(e);
        }
        int roomId = reserve.getRoomId();
        Room room = null;
        try {
            room=roomService.get(roomId);
        } catch (Exception e) {
            e.printStackTrace();
        }
//        return new ResponseEntity<>(kakaoCancelResponse, HttpStatus.OK);
        model.addAttribute("room", room);
        model.addAttribute("center","refundSuccess");
        model.addAttribute("kakaoCancelResponse",kakaoCancelResponse);

        return  "index";
    }
}
