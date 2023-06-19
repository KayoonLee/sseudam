package com.pet.sseudam.model;

import lombok.Data;
import org.apache.ibatis.type.Alias;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;

@Data
@Alias("profile_board")
public class ProfileBean {
    private Integer profile_num;
    private String profile_origin;
    private String profile_name;
}