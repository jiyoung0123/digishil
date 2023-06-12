package com.kbstar.dto;


import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Chatroom {
    Integer chatRoomId;
    String hostId;
    String guestId;
}
