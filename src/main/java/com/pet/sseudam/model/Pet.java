package com.pet.sseudam.model;

import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.util.Date;

@Data
@Alias("Pet")
public class Pet {
    private int p_id;
    private int g_id;
    private String animal;
    private String birth;
    private String kind;
    private String breed;
    private String profile;
    private String feature;
    private int gender;
    private int neutering;
    private int state;

}
