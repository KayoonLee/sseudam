package com.pet.sseudam.model;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("profile_board")
public class ProfileBean {
    private int profile_num;
    private String profile_origin;
    private String profile_name;
}