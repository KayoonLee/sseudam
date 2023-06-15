package com.pet.sseudam.model;

import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.util.Date;

@Data
@Alias("fboard")
public class FreeBean {

    private int board_num;
    private int num;
    private String subject;
    private int category;
    private int m_id;
    private String content;
    private String hashtag;
    private int file_num;
    private int readcount;
    private Date reg_date;
    private int state;

    // page
    private int startRow;
    private int endRow;
    // 검색
    private String search;
    private String keyword;
    // 정렬
    private String sort;
    // 추천수
    private String recom;
}

