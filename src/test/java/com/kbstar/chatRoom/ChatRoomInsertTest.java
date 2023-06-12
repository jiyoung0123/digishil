package com.kbstar.chatRoom;

import com.kbstar.dto.Chatroom;
import com.kbstar.service.ChatRoomService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class ChatRoomInsertTest {
    @Autowired
    ChatRoomService service;
    @Test
    void contextLoads() {
        try{
            Chatroom chatroom= new Chatroom(0, "host7", "guest1");
            service.register(chatroom);
            service.get();
        }catch(Exception e){
            log.info("Error");
            e.printStackTrace();
        }

    }
}
