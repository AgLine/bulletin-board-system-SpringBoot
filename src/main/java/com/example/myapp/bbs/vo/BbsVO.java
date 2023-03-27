package com.example.myapp.bbs.vo;

import lombok.Data;

@Data
public class BbsVO {

    private Integer bbsID;
    private String bbsContent;
    private String bbsTitle;
    private String bbsDate;
    private Integer bbsAvailable;
}
