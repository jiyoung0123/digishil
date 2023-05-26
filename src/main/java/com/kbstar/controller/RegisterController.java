package com.kbstar.controller;


import com.kbstar.dto.Guest;
import com.kbstar.service.GuestService;
import com.kbstar.util.FileUploadUtil;
import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Map;

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

    @RestController
    @AllArgsConstructor
    @RequestMapping("/register")
    public class OAuthController {

        /**
         * 카카오 callback
         * [GET] /oauth/kakao/callback
         */
        @ResponseBody
        @GetMapping("/kakao")
        public void kakaoCallback(@RequestParam String code) {
            System.out.println(code);
        }
    }


}
