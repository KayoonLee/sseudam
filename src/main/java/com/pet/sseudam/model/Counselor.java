package com.pet.sseudam.model;

import lombok.Data;
import org.apache.ibatis.type.Alias;

import java.sql.Date;

@Data
@Alias("counselor")
public class Counselor {

    private int c_id;
    private String career;
    private String license;

}