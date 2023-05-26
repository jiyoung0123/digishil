package com.kbstar.controller;

import com.kbstar.dto.Guest;
import com.kbstar.service.GuestService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

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

}