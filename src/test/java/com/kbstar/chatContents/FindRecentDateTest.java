package com.kbstar.chatContents;

import com.kbstar.service.ChatContentsService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class FindRecentDateTest {
    @Autowired
    ChatContentsService service;
    @Test
    void contextLoads() {
        try{
            service.findRecentDate(2);
        }catch(Exception e){
            log.info("Error");
            e.printStackTrace();
        }

    }
}
