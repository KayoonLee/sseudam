package com.pet.sseudam.model;

import lombok.Data;
import org.apache.ibatis.type.Alias;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@Alias("CounselRecord")
public class CounselRecord {
    private int record_num; //상담기록번호
    private int paper_num;  //상담예약번호
    private int p_id;   //동물번호
    private int m_id;   //회원번호
    private int c_id;   //상담사번호

    private Date consulting_date;   //상담날짜
    private String subject; //상담제목
    private String topic;   //상담주제
    private String content; //상담기록
    private String condition;   //상담현황
    private String etc; //특이사항

}
