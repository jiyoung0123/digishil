package com.kbstar.dto;

import lombok.*;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class ChatRecentData {

    private String recentSender;
    private String recentDate;
    private String recentContents;

}
