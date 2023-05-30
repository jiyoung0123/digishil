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
    public @ResponseBody String kakaoCallback(String code){   //data를 리턴해주는 컨트롤러 함수

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
//        headers2.add("Authorization", "KakaoAK"+oauthToken.get)
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
        System.out.println("카카오 아이디(번호):" + kakaoProfile.getId());
        System.out.println("카카오 이메일:" + kakaoProfile.getKakao_account().getEmail());

        System.out.println("디지실ID :"+ kakaoProfile.getKakao_account().getEmail());
        UUID gabagePassword = UUID.randomUUID();
        System.out.println("디지실 패스워드: "+ gabagePassword);
        System.out.println("------------------");


//        Guest guest = Guest.builder();
//        guestService.register(guest);

        return response2.getBody();
    }

//    @RestController
//    @AllArgsConstructor
//    @RequestMapping("/register")
//    public class OAuthController {
//
//        /**
//         * 카카오 callback
//         * [GET] /oauth/kakao/callback
//         */
//        @ResponseBody
//        @GetMapping("/kakao")
//        public void kakaoCallback(@RequestParam String code) {
//            System.out.println(code);
//        }
//    }

//    @Controller
//    public class kakaoController {
//
//        // 1번 카카오톡에 사용자 코드 받기(jsp의 a태그 href에 경로 있음)
//        @RequestMapping(value = "/kakaoLogin", method = RequestMethod.GET)
//        public ModelAndView kakaoLogin(@RequestParam(value = "code", required = false) String code) throws Throwable {
//            // 1번
//            System.out.println("code:" + code);
//            return null;
//            // return에 페이지를 해도 되고, 여기서는 코드가 넘어오는지만 확인할거기 때문에 따로 return 값을 두지는 않았음
//        }
//    }


}
