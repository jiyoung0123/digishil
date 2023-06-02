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
    private int reserveApi;
    private int reserveRefund;

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
