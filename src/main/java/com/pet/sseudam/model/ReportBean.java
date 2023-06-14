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
}
