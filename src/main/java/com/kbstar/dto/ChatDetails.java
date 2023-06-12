package com.kbstar.dto;

import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class ChatDetails {
    private String hostId;
    private String guestId;
    private String chatSender;
    private String chatContents;
    private Date chatDate;
    private Integer chatContentsId;
}
