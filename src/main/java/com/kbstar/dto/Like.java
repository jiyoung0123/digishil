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
}
