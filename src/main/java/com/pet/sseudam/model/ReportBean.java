package com.pet.sseudam.model;

import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.util.Date;

@Data
@Alias("report_board")
public class ReportBean {

    private int board_num;
    private int num;
    private int m_id;
    private String report_issue;
    private String report_content;
    private Date report_date;

    //관리자 신고테이블용
    private String subject;
    private String nick;
    private String profile_name;
    private String profile_origin;
    private int state;

    //정렬용
    private int row_num;
}