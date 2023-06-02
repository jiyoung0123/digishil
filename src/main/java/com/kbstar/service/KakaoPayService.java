package com.kbstar.service;

import com.kbstar.dto.KakaoApproveResponse;
import com.kbstar.dto.KakaoCancelResponse;
import com.kbstar.dto.KakaoReadyResponse;
import com.kbstar.dto.Reserve;
import com.kbstar.mapper.ReserveMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

@Slf4j
@Service
@RequiredArgsConstructor
@Transactional
public class KakaoPayService {

    static final String cid = "TC0ONETIME"; // 가맹점 테스트 코드
    static final String admin_Key = "82d23bc5d3ba7c6d4dcf3e5df33ee2dd"; // 공개 조심! 본인 애플리케이션의 어드민 키를 넣어주세요
    private KakaoReadyResponse kakaoReady;


    private KakaoApproveResponse approveResponse;

    public KakaoPayService(KakaoApproveResponse approveResponse) {
        this.approveResponse = approveResponse;
    }


    /**
     * reserveId를 받아오기 위해 kakao 형식에 사용 안 하는 키값에 강제로 넣음 주의!!
     */
    public KakaoReadyResponse kakaoPayReady(Reserve reserve) {
        log.info("bbbbbbbbbbbbbbbbbbbbbbbbb  : kakaoPayReady 도착");
        log.info(reserve.getReserveId()+"");

        // 카카오페이 요청 양식
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("cid", cid);
        parameters.add("partner_order_id", reserve.getReserveId()+"");
        parameters.add("partner_user_id", "가맹점 회원 ID");
        parameters.add("item_name", String.valueOf(reserve.getRoomId()));
        parameters.add("quantity", "3");
        parameters.add("total_amount", String.valueOf(reserve.getReservePrice()));
        parameters.add("vat_amount", "0");
        parameters.add("tax_free_amount", "0");
        parameters.add("approval_url", "http://127.0.0.1/payment/success"); // 성공 시 redirect url
        parameters.add("cancel_url", "http://127.0.0.1/payment/cancel"); // 취소 시 redirect url
        parameters.add("fail_url", "http://127.0.0.1/payment/fail"); // 실패 시 redirect url

        // 파라미터, 헤더
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());

        // 외부에 보낼 url
        RestTemplate restTemplate = new RestTemplate();

        log.info("bbbbbbbbbbbbbbbbbbbbbbbbb  : kakaoPayReady 끝");
        kakaoReady = restTemplate.postForObject(
                "https://kapi.kakao.com/v1/payment/ready",
                requestEntity,
                KakaoReadyResponse.class);
        kakaoReady.setReserveId(reserve.getReserveId());
        log.info("************************ kakaoReady :"+kakaoReady);
        return kakaoReady;
    }

    /**
     * 결제 완료 승인
     */
    public KakaoApproveResponse ApproveResponse(String pgToken) {
        log.info("ddddddddddddddddddddddddddddddddddddddddddddddddd  : ApproveResponse 도착");
        // 카카오 요청
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("cid", cid);
        parameters.add("tid", kakaoReady.getTid());
        parameters.add("partner_order_id",kakaoReady.getReserveId()+"");
        parameters.add("partner_user_id", "가맹점 회원 ID");
        parameters.add("pg_token", pgToken);
        log.info(String.valueOf(kakaoReady));

        // 파라미터, 헤더
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());

        // 외부에 보낼 url
        RestTemplate restTemplate = new RestTemplate();

        KakaoApproveResponse approveResponse = restTemplate.postForObject(
                "https://kapi.kakao.com/v1/payment/approve",
                requestEntity,
                KakaoApproveResponse.class);

        log.info("dddddddddddddddddddddddddddddddddddddddddddddddddddd  : ApproveResponse 끝");
        return approveResponse;
    }

    public KakaoCancelResponse kakaoCancel() {
        // 카카오페이 요청
        MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
        parameters.add("cid", cid);
        parameters.add("tid", "tid 넣어주기");
        parameters.add("cancel_amount", "300000");
        parameters.add("cancel_tax_free_amount", "0");
        parameters.add("cancel_vat_amount", "0");

        // 파라미터, 헤더
        HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());

        // 외부에 보낼 url
        RestTemplate restTemplate = new RestTemplate();

        KakaoCancelResponse cancelResponse = restTemplate.postForObject(
                "https://kapi.kakao.com/v1/payment/cancel",
                requestEntity,
                KakaoCancelResponse.class);

        return cancelResponse;
    }

    /**
     * 카카오 요구 헤더값
     */
    private HttpHeaders getHeaders() {
        HttpHeaders httpHeaders = new HttpHeaders();

        String auth = "KakaoAK "+admin_Key;
        httpHeaders.set("Authorization", auth);
        httpHeaders.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
        return httpHeaders;
    }

    @Autowired
    ReserveMapper reserveMapper;
    public void reserveComplete(Reserve reserve) throws Exception {
        reserveMapper.update(reserve);
    }
}