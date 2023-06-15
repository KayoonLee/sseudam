package com.pet.sseudam.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;
import java.util.Date;

@Getter
@Setter
@Data
@Alias("pet")
public class PetBean {
    private Integer p_id;
    private int g_id;
    private String animal;
    private Date birth;
    private String kind;
    private String breed;
    private String profile;
    private String feature;
    private int gender;
    private int neutering;
    private int state;

    // 페이징처리
    private int startRow;
    private int endRow;
    private int total;
}