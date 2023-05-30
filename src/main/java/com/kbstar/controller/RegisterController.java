package com.kbstar.controller;


import ch.qos.logback.core.net.SyslogOutputStream;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kbstar.dto.Guest;
import com.kbstar.dto.KakaoProfile;
import com.kbstar.dto.OAuthToken;
import com.kbstar.service.GuestService;
import com.kbstar.util.FileUploadUtil;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

@Controller
@Slf4j
public class RegisterController {
    @Value("${kakaoKey}")
    private String cosKey;

    @Value("${uploadimgdir}")
    String imgdir;

    @Autowired
    private BCryptPasswordEncoder encoder;

    @Autowired
    GuestService guestService;


    @RequestMapping("/registerImpl")
    public String registerImpl(Model model, Guest guest, HttpSession session) throws Exception {
        try {
            guest.setGuestPwd(encoder.encode(guest.getGuestPwd()));
            guestService.register(guest);
            session.setAttribute("loginGuest", guest);
        } catch (Exception e) {
            e.printStackTrace();
            throw new Exception("가입 오류");
        }
        model.addAttribute("guest", guest);
        model.addAttribute("center", "registerDetail");
        return "index";
    }

    @RequestMapping("/registerDetailImpl")
    public String registerDetailImpl(@RequestParam("file") MultipartFile file, Model model, Guest guest) throws Exception {
        String guestImage = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
        log.info("------------------------------------------------------------------" + guestImage);
        guest.setGuestImage(guestImage);
        guestService.modify(guest);
        FileUploadUtil.saveFile(file,imgdir);
        return "redirect:/login";
    }

    @GetMapping("/auth/kakao/callback")
    public String kakaoCallback(String code, HttpSession session, Model model) throws Exception {   //data를 리턴해주는 컨트롤러 함수

        //Post 방식으로 key=value 데이터를 요청(카카오쪽으로)

        //HttpHeader 오브젝트 생성
        RestTemplate rt = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();

        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        MultiValueMap<String, String>params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", "9b7c02c3cdf81109f8023cd5a12156ee");
        params.add("redirect_uri", "http://127.0.0.1/auth/kakao/callback");
        params.add("code",code);

        //HttpHeader와 HttpBody를 하나의 오브젝트에 담기
        HttpEntity<MultiValueMap<String, String>>kakaoTokenRequest=
                new HttpEntity<>(params, headers);

        //Http 요청하기 - Post 방식으로 - 그리고 response 변수의 응답 받음.
        ResponseEntity<String>response = rt.exchange(
                "https://kauth.kakao.com/oauth/token",
                HttpMethod.POST,
                kakaoTokenRequest,
                String.class
        );

        //Gson, Json Simple, ObjectMapper
        ObjectMapper objectMapper = new ObjectMapper();
        OAuthToken oauthToken = null;
        try {
            oauthToken = objectMapper.readValue(response.getBody(), OAuthToken.class);
        } catch(JsonMappingException e){
            e.printStackTrace();
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        System.out.println("카카오 엑세스 토큰:"+oauthToken.getAccess_token());

        RestTemplate rt2 = new RestTemplate();

        //HttpHeader 오브젝트 생성
        HttpHeaders headers2 = new HttpHeaders();
        headers2.add("Authorization", "Bearer "+oauthToken.getAccess_token());
        headers2.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        //HttpHeader와 HttpBody를 하나의 오브젝트에 담기
        HttpEntity<MultiValueMap<String, String>>kakaoProfileRequest2=
                new HttpEntity<>(headers2);

        //Http 요청하기 - Post 방식으로 - 그리고 response 변수의 응답 받음.
        ResponseEntity<String> response2 = rt2.exchange(
                "https://kapi.kakao.com/v2/user/me",
                HttpMethod.POST,
                kakaoProfileRequest2,
                String.class
        );
        System.out.println(response2.getBody());

        ObjectMapper objectMapper2 = new ObjectMapper();
        KakaoProfile kakaoProfile = null;
        try {
            kakaoProfile = objectMapper2.readValue(response2.getBody(), KakaoProfile.class);
        } catch(JsonMappingException e){
            e.printStackTrace();
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        Guest guest = new Guest();
        guest.setGuestId(kakaoProfile.getKakao_account().getEmail());
        guest.setGuestPwd(cosKey);
        guest.setGuestName(kakaoProfile.getProperties().getNickname());
        System.out.println(guest);

        Guest guestIdCheck = null;
        guestIdCheck = guestService.get(kakaoProfile.getKakao_account().getEmail());
        if(guestIdCheck == null){
            guestService.register(guest);
            session.setAttribute("loginGuest",guest);
            model.addAttribute("center","center");
        }else{
            session.setAttribute("loginGuest",guest);
            model.addAttribute("center","center");
        }
        return "redirect:/";
    }

}
