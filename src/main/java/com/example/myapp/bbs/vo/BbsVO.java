package com.example.myapp.bbs.vo;

import lombok.Data;

@Data
public class BbsVO {

    private Integer bbsId;
    private String bbsContent;
    private String bbsTitle;
    private String bbsDate;
    private String bbsName;
    private Integer bbsAvailable;
}
