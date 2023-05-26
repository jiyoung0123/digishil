package com.kbstar.controller;

import com.kbstar.dto.Guest;
import com.kbstar.service.GuestService;
import com.kbstar.util.MailUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@Slf4j
// 일반적인 컨트롤러는 화면jsp파일을 return 해 주니, ajax 요청은 이걸 이용하자-@RestController
@RestController
public class AjaxImplController {

    @Autowired
    GuestService guestService;

    @RequestMapping("/checkId")
    public Object checkid(String guestId) throws Exception {
        int result = 0;
        Guest guest = null;
        guest = guestService.get(guestId);
        if(guest != null){
            result=1;
        }
        return result;
    }

    @GetMapping(value = "/findPwd",produces = {MediaType.APPLICATION_JSON_VALUE})
    public @ResponseBody String findPw(String guestId, Guest guest) throws Exception {
        log.info("--------------------------"+guestId);
        BCryptPasswordEncoder encoder= new BCryptPasswordEncoder();
        String result = null;

        //회원정보 불러오기
        Guest vo1 = guestService.searchPwd(guestId);
        System.out.println(vo1);

        //가입된 이메일이 존재한다면 이메일 전송
        if(vo1!=null) {

            //임시 비밀번호 생성(UUID이용)
            String tempPw= UUID.randomUUID().toString().replace("-", "");//-를 제거
            tempPw = tempPw.substring(0,10);//tempPw를 앞에서부터 10자리 잘라줌

            vo1.setGuestPwd(tempPw);//임시 비밀번호 담기

            MailUtil mail=new MailUtil(); //메일 전송하기
            mail.sendEmail(vo1);

            guestService.updatePwd(vo1);

            String securePwd = encoder.encode(vo1.getGuestPwd());
            vo1.setGuestPwd(securePwd);

            String securePw = encoder.encode(vo1.getGuestPwd());//회원 비밀번호를 암호화하면 vo객체에 다시 저장
            vo1.setGuestPwd(securePw);

            result="true";


        }else {
            result="false";
        }
        return result;
    }

}