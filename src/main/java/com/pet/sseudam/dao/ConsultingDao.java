package com.pet.sseudam.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ConsultingDao {
    public String find_counselor();
}
