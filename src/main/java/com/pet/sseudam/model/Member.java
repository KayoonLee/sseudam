package com.pet.sseudam.model;

import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.util.Date;

@Data
@Alias("Member")
public class Member {
    private int m_id;
    private String name;
    private String email;
    private String passwd;
    private String nick;
    private String birth;
    private String tel;
    private int identifier;
    private int state;
    private Date join_date;
    private String reset;

}
