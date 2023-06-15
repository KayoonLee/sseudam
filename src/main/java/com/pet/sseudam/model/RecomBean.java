package com.pet.sseudam.model;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("recom_board")
public class RecomBean {

    private int board_num;
    private int num;
    private int m_id;
}

