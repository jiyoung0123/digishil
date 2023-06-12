package com.kbstar.translation;

import com.kbstar.util.PapagoTranslation;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class TranslateTest {

    @Test
    void contextLoads() {
        try{
            PapagoTranslation translation = new PapagoTranslation();
            String responseBody = translation.post("en", "something particular in mind!");
            log.info(responseBody);

        }catch(Exception e){
            log.info("Error");
            e.printStackTrace();
        }

    }
}
