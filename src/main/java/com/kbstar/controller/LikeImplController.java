package com.kbstar.controller;

import com.kbstar.dto.Like;
import com.kbstar.service.LikeService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
public class LikeImplController {

    @Autowired
    LikeService likeService;

    @RequestMapping("/likeAdd")
    public String likeAdd(Like like, String guestId, int roomId) throws Exception{
        Like getLike = null;
        try{

            getLike = likeService.getLike(like);
            if(getLike == null){
                likeService.register(like);
                return "true";
            }
            if(guestId == ""){
                return "login";
            }if(getLike != null){
                likeService.remove(getLike.getLikeId());
                return "delete";
            }
        }catch(Exception e){
            e.printStackTrace();
            return "false";
        }
        return "false";
    }

}
