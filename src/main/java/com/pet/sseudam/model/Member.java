//Member 테이블입니다


package com.pet.sseudam.model;


import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;


import java.sql.Date;
@Data
@Getter
@Setter

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
    private int profile_num;
    private int row_num;

    //사진정보
    private String profile_origin;
    private String profile_name;
}



