package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Guest {
    private String guestId;
    private String guestPwd;
    private String guestName;
    private String guestIntro;
    private String guestLang;
    private int guestCoupon;
    private String guestImage;
    private double guestRate;
    private Date guestRegDate;
    private Date guestDelDate;
}
