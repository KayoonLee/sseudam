package com.pet.sseudam.model;

import lombok.Data;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import java.sql.Date;
import java.sql.Timestamp;

@Data
@Alias("visitor")
public class Visitor {

    private int id;
    private String session_id;
    private String ip_addr;
    private Timestamp visit_time;

    // 모델 넘기기용도
    private Date visit_date;
    private int visitor_count;

}