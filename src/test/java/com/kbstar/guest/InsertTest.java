package com.kbstar.guest;


import com.kbstar.dto.Guest;
import com.kbstar.service.GuestService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;

@Slf4j
@SpringBootTest
class InsertTest {
    @Autowired
    GuestService guestService;

    @Test
    void contextLoads() {
        Guest obj = new Guest("id01", "pwd01", "james");
        try {
            guestService.register(obj);
            log.info("--------------------------------------등록정상");
        } catch (Exception e) {
            log.info("--------------------------------------등록에러..");
            if (e instanceof DuplicateKeyException) {
                log.info("ID가 중복 되었습니다.");
            } else {
                log.info("시스템 장애입니다");
            }
        }

    }}
