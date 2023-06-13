package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Reserve {
    private int reserveId;
    private String guestId;
    private int roomId;
    private Date reserveCheckIn;
    private Date reserveCheckOut;
    private int reservePrice;
    private int reserveConfirm;
    private int reserveCal;
    private int reserveCap;
    private String reserveStatus;
    private int reservePayRate;
    private int reservePayAmount;
    private Date reservePayDate;
    private String reservePayType;
    private double reserveDiscount;
    private int reservePoint;
    private String reserveBank;
    private String reserveAccHolder;
    private int reserveAccount;
    private String reserveApi;
    private int reserveRefund;


    // reserveList를 불러오기 위한 항목 추가
    private String hostName;
    private String roomType;
    private String roomName;
    private String roomAddress;
    private String roomLoc;
    private String hostImage;
    private int roomWPrice;

//
    private Integer reserveReply;// 최준혁 추가
    private Date refundDate; // 서지영



    public Reserve(String guestId, int roomId, Date reserveCheckIn, Date reserveCheckOut, int reservePrice, int reserveCap) {
        this.guestId = guestId;
        this.roomId = roomId;
        this.reserveCheckIn = reserveCheckIn;
        this.reserveCheckOut = reserveCheckOut;
        this.reservePrice = reservePrice;
        this.reserveCap = reserveCap;
    }

    public Reserve(Date reserveCheckIn, Date reserveCheckOut) {
        this.reserveCheckIn = reserveCheckIn;
        this.reserveCheckOut = reserveCheckOut;
    }



}
