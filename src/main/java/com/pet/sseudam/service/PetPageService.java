package com.pet.sseudam.service;

//import com.pet.sseudam.model.*;
import com.pet.sseudam.model.PetBean;
import com.pet.sseudam.model.ProfileBean;

import java.util.List;

public interface PetPageService {

    int getTotal(PetBean pet);

    List<PetBean> p_list(PetBean pet) throws Exception;
    // 동물 리스트

    void setStartRow(int startRow);

    void setEndRow(int endRow);

    PetBean p_select(int p_id);

    int p_update(PetBean pet);

    int p_insert(PetBean pet);


    int getMaxnum();

    int profileDelete(int profileNum);

    int profileAdd(ProfileBean profileBoard);


    int profileUpdate(ProfileBean profileBoard);

    String profileSelect(ProfileBean profileBoard);

    int profileInsert(PetBean pet);

    int p_modify(PetBean pet);
}
