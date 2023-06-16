package com.kbstar.dto;

import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Like {
    private int likeId;
    private int roomId;
    private String guestId;

    public Like(int roomId, String guestId) {
        this.roomId = roomId;
        this.guestId = guestId;
    }

    // join을 위함
    private String hostId;
    private int roomPrice;
    private String roomName;
    private String roomAddress1;
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
    private String hostImage;
    private String hostName;
    private String hostIntro;
}
