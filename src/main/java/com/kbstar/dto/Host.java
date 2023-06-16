package com.kbstar.dto;

import lombok.*;

import java.io.Serializable;
import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Host implements Serializable {
    private String hostId;
    private String hostName;
    private String hostPwd;
    private String hostImage;
    private String hostIntro;
    private Integer hostSuper;
    private String hostLang;
    private double hostRate;
    private double hostYear;
    private String hostJob;
    private Integer hostVerified;
    private Date hostRegDate;
    private Date hostDelDate;

    public Host(String hostId, String hostName, String hostPwd, Date hostRegDate) {
        this.hostId = hostId;
        this.hostName = hostName;
        this.hostPwd = hostPwd;
        this.hostRegDate = hostRegDate;
    }
}
