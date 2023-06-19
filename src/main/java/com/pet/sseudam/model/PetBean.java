package com.pet.sseudam.model;

import lombok.Data;
import org.apache.ibatis.type.Alias;


@Data
@Alias("pet")
public class PetBean {
    private int p_id;
    private int g_id;
    private String animal;
    private String birth;
    private String kind;
    private String breed;
    private Integer profile_num;
    private String feature;
    private int gender;
    private int neutering;
    private int state;

    // 페이징처리
    private int startRow;
    private int endRow;
    private int total;

    //펫사진정보
    private String profile_origin;
    private String profile_name;

}
