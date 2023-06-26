package com.pet.sseudam.model;


import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.sql.Timestamp;

@Data
@Alias("note")
public class NoteBean {

    private int note_num;
    private int sender;
    private String receiver;
    private String subject;
    private String content;
    private Timestamp time;
    private int checking;

    private String nick;
    //사진정보
    private String profile_origin;
    private String profile_name;
    private Integer profile_num;
}

