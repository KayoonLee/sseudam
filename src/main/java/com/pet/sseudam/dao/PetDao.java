package com.pet.sseudam.dao;

import com.pet.sseudam.model.PetBean;
import com.pet.sseudam.model.ProfileBean;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PetDao {

    // 동물리스트
    int getTotal(PetBean pet);
    List<PetBean> p_list(PetBean pet);
    PetBean p_select(int p_id);
    int p_update(PetBean pet);

    int p_insert(PetBean pet);

    int getMaxnum();

    int profileAdd(ProfileBean profileBoard);

    int profileDelete(int profileNum);

    int profileUpdate(ProfileBean profileBoard);

    String profileSelect(ProfileBean profileBoard);

}
