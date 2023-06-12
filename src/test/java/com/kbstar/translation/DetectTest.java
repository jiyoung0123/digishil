package com.kbstar.translation;

import com.kbstar.util.PapagoDetectLangs;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@Slf4j
@SpringBootTest
public class DetectTest {

    @Test
    void contextLoads() {
        try{
            PapagoDetectLangs translationDetector = new PapagoDetectLangs();
            String responseBodyDE = translationDetector.post("Guten Tag!");
            String responseBodyES = translationDetector.post("Hola! amgio!");
            String responseBodyJA = translationDetector.post("こんにちは");
            String responseBodyFR = translationDetector.post("merci");
            String responseBodyCN = translationDetector.post(" 你明天怎么去?");
            String responseBodyKR = translationDetector.post("좋은 아침입니다.");
            String responseBodyEN = translationDetector.post("Great innovation");
            log.info("============언어 감지 결과 테스트 시작==========");
            log.info("==========={langCode : 코드}=========");
            log.info(responseBodyDE);
            log.info(responseBodyES);
            log.info(responseBodyJA);
            log.info(responseBodyFR);
            log.info(responseBodyCN);
            log.info(responseBodyKR);
            log.info(responseBodyEN);
            log.info("============언어 감지 결과 테스트 끝=========");
//            한국어(ko)
//            일본어(ja)
//            중국어 간체(zh-CN)
//            중국어 번체(zh-TW)
//            힌디어(hi)
//            영어(en)
//            스페인어(es)
//            프랑스어(fr)
//            독일어(de)
//            포르투갈어(pt)
//            베트남어(vi)
//            인도네시아어(id)
//            페르시아어(fa)
//            아랍어(ar)
//            미얀마어(mm)
//            태국어(th)
//            러시아어(ru)
//            이탈리아어(it)

        }catch(Exception e){
            log.info("Error");
            e.printStackTrace();
        }

    }
}
