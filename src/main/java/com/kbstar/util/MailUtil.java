package com.kbstar.util;

import com.kbstar.dto.Guest;
import com.kbstar.service.GuestService;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletResponse;

@Component
@Configuration
public class MailUtil {

    @Autowired
    GuestService guestService;


    public void sendEmail(Guest guest) throws Exception{

        //Mail Server 설정
        String charSet="utf-8";
        String hostSMTP="smtp.mail.nate.com";
        String hostSMTPid="digishil"; //관리자 이메일 아이디
        String hostSMTPpw="qw12er34!!"; //관리자 이메일 비밀번호

        //보내는 사람
        String fromEmail="digishil@nate.com"; //보내는 사람 이메일
        String fromName="DIGISHIL"; //보내는 사람 이름

        String subject="[DIGISHIL] 임시 비밀번호 안내입니다."; //메일 제목
        String msg="";

        msg +="<div align='lift'";
        msg +="<h3>";
        msg += guest.getGuestId() + "님의 임시 비밀번호입니다. <br>로그인 후 비밀번호를 변경해 주세요</h3>";
        msg +="<p>임시 비밀번호:";
        msg += guest.getGuestPwd() + "</p></div>";

        //email전송
        String mailRecipient= guest.getGuestId(); //받는 사람 이메일 주소
        try {
            //객체 선언
            HtmlEmail mail = new HtmlEmail();
            mail.setDebug(true);
            mail.setCharset(charSet);
            mail.setSSLOnConnect(true);
            mail.setHostName(hostSMTP);
            mail.setSmtpPort(587);
            mail.setAuthentication(hostSMTPid, hostSMTPpw);
            mail.setStartTLSEnabled(true);
            mail.addTo(mailRecipient,charSet);
            mail.setFrom(fromEmail, fromName, charSet);
            mail.setSubject(subject);
            mail.setHtmlMsg(msg);
            mail.send();

        }catch(Exception e) {
            e.printStackTrace();
        }
    }
    public void findPw(HttpServletResponse response, Guest guest) {
        response.setContentType("text/html;charset=utf-8");

    }
}
