package com.pet.sseudam.model;

import lombok.Data;

import java.util.Date;

@Data
public class CounselPaper {
    private int paper_num;
    private int p_id;
    private int m_id;
    private int c_id;
    private Date application_date;
    private String purpose;
    private String reason;
    private int exp_num;
    private Date request_time;
    private int confirmed;
    private String type;
    private String wish_list;
}
