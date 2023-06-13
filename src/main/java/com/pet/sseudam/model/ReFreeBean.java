package com.pet.sseudam.model;

import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.util.Date;

@Data
@Alias("re_fboard")
public class ReFreeBean {

    private int board_renum;
    private int num;
    private int m_id;
    private String re_content;
    private int file_num;
    private Date re_reg_date;
    private int ref;
    private int re_seq;
    private int re_lev;
    private int re_state;
}
