package com.kbstar.chatContents;

import com.kbstar.dto.Chatcontents;
import com.kbstar.service.ChatContentsService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.Date;

@Slf4j
@SpringBootTest
public class ChatContentsInsertTest {
    @Autowired
    ChatContentsService service;
    @Test
    void contextLoads() {
        try{
            //당분간 그냥 chatRoom 1로만 insert 하자.

            //Chatcontents chatcontents = new Chatcontents(0, 1, "guest1", "최대길이 테스트를 해보겠습니다. 최대길이 테스트를 해보겠습니다. 최대길이 테스트를 해보겠습니다. 최대길이 테스트를 해보겠습니다. 최대길이 테스트를 해보겠습니다. 최대길이 테스트를 해보겠습니다. 최대길이 테스트를 해보겠습니다. 최대길이 테스트를 해보겠습니다. 최대길이 테스트를 해보겠습니다. 최대길이 테스트를 해보겠습니다. 최대길이 테스트를 해보겠습니다. 최대길이 테스트를 해보겠습니다. 최대길이 테스트를 해보겠습니다. 최대길이 테스트를 해보겠습니다. 최대길이 테스트를 해보겠습니다. 최대길이 테스트를 해보겠습니다. 최대길이 테스트를 해보겠습니다. 최대길이 테스트를 해보겠습니다. 최대길이 테스트를 해보겠습니다. 최대길이 테스트를 해보겠습니다. 최대길이 테스트를 해보겠습니다. 최대길이 테스트를 해보", new Date());

            Chatcontents chatcontents = new Chatcontents(0, 21, "guest1", "duty-free? ", new Date());

            service.register(chatcontents);
            service.get();
        }catch(Exception e){
            log.info("Error");
            e.printStackTrace();
        }

    }
}
