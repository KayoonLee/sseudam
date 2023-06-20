package com.pet.sseudam.dao;

import com.pet.sseudam.model.AdminBean;
import lombok.Data;
import org.apache.ibatis.annotations.Mapper;
//@Data
@Mapper
public interface AdminDao {
    AdminBean adminCheck(String a_email);

}
