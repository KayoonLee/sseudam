package com.pet.sseudam.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import java.sql.Date;
@Getter
@Setter
@Data

public class Member {
    private String m_id;
    private String name;
    private String email;
    private String passwd;
    private String nick;
    private String birth;
    private String gender;
    private String tel;
    private String identifier;
    private int state;
    private Date join_date;
    private String reset;
}