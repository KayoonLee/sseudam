package com.pet.sseudam.model;

import lombok.Data;
import org.apache.ibatis.type.Alias;
@Data
@Alias("admin")
public class AdminBean {
    private String a_email;
    private String passwd;
    private String name;
    private int profile_num;
}
