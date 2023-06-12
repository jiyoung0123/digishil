package com.kbstar.reserve;

import com.kbstar.service.ReserveService;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class FindReserveIdTest {
    @Autowired
    ReserveService service;
    @Test
    void contextLoads() {
        try{
            //insertTest시 hostID를 자주 바꿔줄 것. -unique 값임.
           service.findByReserveId(15);
        }catch(Exception e){
            log.info("Error");
            e.printStackTrace();
        }

    }
}
