package com.pet.sseudam.model;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data
@Alias("image_board")
public class ImgBean {

    private int file_num;
    private int file_serial;
    private String file_origin;
    private String file_name;

}
