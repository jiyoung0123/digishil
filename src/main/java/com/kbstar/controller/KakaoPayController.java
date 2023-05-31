package com.kbstar.controller;


import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

@Slf4j
@Controller
public class KakaoPayController {


    @RequestMapping("/success")
    public String success(Model model){
        model.addAttribute("center","success");
        return "index";
    }

    @RequestMapping("/pay/kakaopay")
    @ResponseBody
    public String kakaoPay() {
        try {
            URL 주소 = new URL("https://kapi.kakao.com/v1/payment/ready");
            try {
                HttpURLConnection 서버연결 = (HttpURLConnection) 주소.openConnection();
                서버연결.setRequestMethod("POST");
                서버연결.setRequestProperty("Authorization", "KakaoAK 82d23bc5d3ba7c6d4dcf3e5df33ee2dd");
                서버연결.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
                서버연결.setDoOutput(true);

                String 파라미터 =
                        "cid=TC0ONETIME&partner_order_id=partner_order_id&partner_user_id=partner_user_id&item_name=초코파이&quantity=1&total_amount=2200&tax_free_amount=0&approval_url=http://127.0.0.1/success&fail_url=http://127.0.0.1/fail&cancel_url=http://127.0.0.1/cancel";
                OutputStream 주는애 = 서버연결.getOutputStream();
                DataOutputStream 데이터주는애 = new DataOutputStream(주는애);
                데이터주는애.writeBytes(파라미터);
                데이터주는애.flush();
                데이터주는애.close();

                int 결과 = 서버연결.getResponseCode();

                InputStream 받는애;
                if(결과==200){
                    받는애=서버연결.getInputStream();
                }else{
                    받는애=서버연결.getErrorStream();
                }
                log.info(결과+"");
                InputStreamReader 읽는애 = new InputStreamReader(받는애);
                BufferedReader 형변환하는애 = new BufferedReader(읽는애);
                return 형변환하는애.readLine();
            } catch (IOException e) {
               e.printStackTrace();
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
        return  "{\"result\":\"NO\"}";
    }
}
