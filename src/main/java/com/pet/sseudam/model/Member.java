package com.pet.sseudam.model;

import lombok.Data;
import org.apache.ibatis.type.Alias;


import java.net.Inet4Address;
import java.sql.Date;

@Data
@Alias("member")
public class Member {

    private int m_id;
    private String name;
    private String email;
    private String passwd;
    private String nick;
    private String birth;
    private String tel;
    private String identifier;
    private int state;
    private Date join_date;
    private String reset;
    private Integer profile_num;
    private int row_num;

    //사진정보
    private String profile_origin;
    private String profile_name;

    // 상담사 테이블
    private String career;
    private String license;

}



