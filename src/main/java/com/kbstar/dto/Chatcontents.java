package com.kbstar.dto;


import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Chatcontents {
    Integer chatContentsId;
    Integer chatRoomId;
    String chatSender;
    String chatContents;
    Date chatDate;


}
