package com.kbstar.util;

import lombok.extern.slf4j.Slf4j;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

@Slf4j
public class PapagoDetectLangs {
    //파파고 언어 감지 api header 설정 : 패킷의 header 부분에 대한 선언을 하고 보내는 main 메소드
    public static void main(String[] args) {
        String clientId = "AqyIhsy3PAjs8bV_00Lc"; //애플리케이션 클라이언트 아이디값";
        String clientSecret = "oy_cRjj0Id"; //애플리케이션 클라이언트 시크릿값";

        String query;
        try {
            //실질적인 test query
            query = URLEncoder.encode("amigo", "UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("인코딩 실패", e);
        }
        String apiURL = "https://openapi.naver.com/v1/papago/detectLangs";

        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        //(1) post URL method - 해당 apiURL로 헤더 정보를 보내면 responseBody가 나온다.
        String responseBody = post(query);

        log.info(responseBody);
    }

    //(1) post URL method : 실질적인 request 객체. -> apiURL과 main에서 선언한 requestHeaders 그리고
    //실질적으로 감지하고자하는 query text가 파라미터값으로 들어가서 post 메소드로 올라간다.
    public static String post(String text){
        String clientId = "AqyIhsy3PAjs8bV_00Lc"; //애플리케이션 클라이언트 아이디값";
        String clientSecret = "oy_cRjj0Id"; //애플리케이션 클라이언트 시크릿값";
        String apiURL = "https://openapi.naver.com/v1/papago/detectLangs";
        Map<String, String> requestHeaders = new HashMap<>();
        requestHeaders.put("X-Naver-Client-Id", clientId);
        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
        HttpURLConnection con = connect(apiURL);
        String postParams =  "query="  + text; //원본언어: 한국어 (ko) -> 목적언어: 영어 (en)
        try {
            con.setRequestMethod("POST");
            for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
                con.setRequestProperty(header.getKey(), header.getValue());
            }

            con.setDoOutput(true);
            try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
                wr.write(postParams.getBytes());
                wr.flush();
            }

            int responseCode = con.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 응답
                return readBody(con.getInputStream());
            } else {  // 에러 응답
                return readBody(con.getErrorStream());
            }
        } catch (IOException e) {
            throw new RuntimeException("API 요청과 응답 실패", e);
        } finally {
            con.disconnect();
        }
    }
    //(2) apiURL 이 connection 되었는지를 확인하는 메소드
    private static HttpURLConnection connect(String apiUrl){
        try {
            URL url = new URL(apiUrl);
            return (HttpURLConnection)url.openConnection();
        } catch (MalformedURLException e) {
            throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
        } catch (IOException e) {
            throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
        }
    }
    //API - response Body
    private static String readBody(InputStream body){
        InputStreamReader streamReader = new InputStreamReader(body);

        try (BufferedReader lineReader = new BufferedReader(streamReader)) {
            StringBuilder responseBody = new StringBuilder();

            String line;
            while ((line = lineReader.readLine()) != null) {
                responseBody.append(line);
            }

            return responseBody.toString();
        } catch (IOException e) {
            throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
        }
    }
}
