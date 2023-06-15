package com.pet.sseudam.model;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.apache.ibatis.type.Alias;

import java.sql.Date;
@Alias("counselor")
@Getter
@Setter
@Data
public class Counselor {
    private int c_id;
    private String career;
    private String license;
}
