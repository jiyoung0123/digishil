package com.kbstar.controller;


import com.kbstar.dto.ChatDetails;
import com.kbstar.dto.Chatroom;
import com.kbstar.dto.HostRoomReserveReview;
import com.kbstar.service.ChatContentsService;
import com.kbstar.service.ChatRoomService;
import com.kbstar.service.ReserveService;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
public class ChatController {
    @Autowired
    ChatRoomService chatRoomService;
    @Autowired
    ChatContentsService chatContentsService;
    @Autowired
    ReserveService reserveService;

    String dir = "chat/";
    String dirProfile = "profile/";




    @RequestMapping("/chat")
    public String chatroomOfGuest(Model model, String guestId) throws Exception {
        List<Chatroom> messengerListAll = chatRoomService.findGuestChatRoom(guestId);
        JSONArray jsonArray = new JSONArray();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        //(1) 전체 메신저리스트를 받는다.
        // (2) 내가 추가적으로 필요한 (1) 최신 date와 (2) 최신 컨텐츠를 추가한
        // 새로운 리스트를 만들어낸다.
        // (3) 각론 - 배열을 다루기 가장 쉬운 것은 forEach 나 for문
        // 관리 용의성을 위해서 (배열 길이 조절) for 문 선택
        //(4) 최종으로 웹에 던지는 것은 파싱 용의성을 위해 JSON Array(object 보단 뱅려)
        for(Chatroom e : messengerListAll) {
            JSONObject jsonObject = new JSONObject();
            Integer chatRoomId = e.getChatRoomId();

            jsonObject.put("chatRoomInfo", e);
            jsonObject.put("recent", chatContentsService.findRecentData(chatRoomId));
            jsonArray.add(jsonObject);
        }

        log.info("===============");
        log.info(jsonArray.toJSONString());
        log.info("===============");

        model.addAttribute("center", dir+"chatroomAll");
        model.addAttribute("mList", jsonArray);
        return "index";
    }

    //admin 단에서 hostId를 parameter 값으로 받는 경우
    @RequestMapping("/chatdetail")
    public String chatDetailHost(@RequestParam("chatRoomId")Integer chatRoomId,
                                 @RequestParam("hostId")String hostId,
                                       @RequestParam("guestId")String guestId,
                                       Model model) throws Exception{
        List<HostRoomReserveReview> reserveInfo = new ArrayList<>();
        reserveInfo = reserveService.getHostGuestReserve(hostId, guestId);
        //인덱스 -
        model.addAttribute("center", dir+"chatdetail");
        model.addAttribute("reserveInfo",reserveInfo);
        //DB 정보
        model.addAttribute("chatRoomId", chatRoomId);
        model.addAttribute("hostId", hostId);
        List<ChatDetails> chatDetailsList = chatContentsService.findChatDetailsHost(chatRoomId, hostId);
        model.addAttribute("chatDetailsList", chatDetailsList);
        return "index";
    }

}

































