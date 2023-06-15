package com.pet.sseudam.dao;

import com.pet.sseudam.model.PetBean;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
public interface PetDao {

    // 동물리스트
    int getTotal(PetBean pet);
    List<PetBean> p_list(PetBean pet);
    PetBean p_select(Integer p_id);
    int p_update(PetBean pet);

    int p_insert(PetBean pet);
}
