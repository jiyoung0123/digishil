package com.kbstar.controller;

import com.kbstar.dto.KakaoApproveResponse;
import com.kbstar.service.KakaoPayService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class kakaController {

    private KakaoPayService kakaoPayService;

    public kakaController(KakaoPayService kakaoPayService) {
        this.kakaoPayService = kakaoPayService;
    }

    @GetMapping("/payment/success")
    public String afterPayRequest(@RequestParam("pg_token") String pgToken, Model model) {
        KakaoApproveResponse kakaoApprove = kakaoPayService.ApproveResponse(pgToken);
        model.addAttribute("payResult", kakaoApprove);
        model.addAttribute("center", "paySuccess");
        return "index";
    }
}
