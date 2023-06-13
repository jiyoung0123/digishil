package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Review {
    Integer reviewId;
    Integer roomId;
    Integer reserveId;
    String guestId;
    Double reviewRate;
    String reviewContents1;
    String reviewContents2;
    String reviewContents3;
    String reviewContents4;
    Integer reviewHidden;
    String guestId2;

    public Review(String guestId, Double reviewRate, String reviewContents1, String guestId2,  Integer reserveId, Integer roomId) {
        this.guestId = guestId;
        this.reviewRate = reviewRate;
        this.reviewContents1 = reviewContents1;
        this.guestId2 = guestId2;
        this.reserveId = reserveId;
        this.roomId = roomId;
    }
}
