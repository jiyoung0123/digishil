package com.kbstar.controller;

import com.kbstar.dto.KakaoCancelResponse;
import com.kbstar.dto.KakaoReadyResponse;
import com.kbstar.dto.Reserve;
import com.kbstar.service.KakaoPayService;
import com.kbstar.service.ReserveService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
@Slf4j
@RestController
@RequestMapping("/payment")
@RequiredArgsConstructor
public class KakaoPayRestController {

    private final KakaoPayService kakaoPayService;

    @Autowired
    ReserveService reserveService;

    /**
     * 결제요청
     */
    @RequestMapping("/ready")
    public KakaoReadyResponse readyToKakaoPay(@RequestParam("reserveId") int reserveId) {
        log.info("aaaaaaaaaaaaaaaaaaa  : readyToKakaoPay 도착");
        Reserve reserve = null;
        try {
            reserve = reserveService.get(reserveId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        log.info("aaaaaaaaaaaaaaaaaaa  : readyToKakaoPay 끝");
        return kakaoPayService.kakaoPayReady(reserve);
    }

    /**
     * 결제 성공 kakaController에서 처리
     */
//    @GetMapping("/success")
//    public ResponseEntity afterPayRequest(@RequestParam("pg_token") String pgToken, Model model) {
//        KakaoApproveResponse kakaoApprove = kakaoPayService.ApproveResponse(pgToken);
//        return new ResponseEntity<>(kakaoApprove, HttpStatus.OK);
//    }


    /**
     * 결제 진행 중 취소
     */
    @GetMapping("/cancel")
    public void cancel() {

        try {
            throw new Exception ("PAY_CANCEL");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 결제 실패
     */
    @GetMapping("/fail")
    public void fail() {
        try {
            throw new Exception ("PAY_FAIL");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}