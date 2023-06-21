package com.pet.sseudam.model;

import lombok.Data;
import org.apache.ibatis.type.Alias;

@Data // Lombok을 사용했기 때문에 @Getter @Setter 사용할 필요x
@Alias("admin")
public class AdminBean {

    private String a_email;
    private String passwd;
    private String name;
    private int profile_num;

}
