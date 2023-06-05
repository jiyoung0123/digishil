package com.kbstar.reserve;


import com.kbstar.dto.Reserve;
import com.kbstar.service.ReserveService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
class SelectIdTest {
    @Autowired
    ReserveService reserveService;
    @Test
    void contextLoads() {
        try {
            reserveService.getMyReserve("taebin100@hanmail.net");
        } catch (Exception e) {
            log.info("★★★★★★★★★★★★★★★ERROR★★★★★★★★★★★★★★★");
            e.printStackTrace();
        }
    }
}
