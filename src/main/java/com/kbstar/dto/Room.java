package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Room {
    private int roomId;
    private String hostId;
    private int roomPrice;
    private String roomName;
    private String roomAddress;
    private String roomLoc;
    private String roomInfo;
    private String roomIntro;
    private int roomClean;
    private int roomPet;
    private int roomWPrice;
    private int roomCap;
    private String roomType;
    private double roomLat;
    private double roomLng;
    private String roomImage1;
    private String roomImage2;
    private String roomImage3;
    private String roomImage4;
    private String roomImage5;
    private String roomImage6;
    private int roomLikes;

    // roomList를 불러오기 위한 항목 추가
    private String hostImage;
    private String hostName;
    private String hostIntro;
    private int likeId;
    private String guestId;
}
