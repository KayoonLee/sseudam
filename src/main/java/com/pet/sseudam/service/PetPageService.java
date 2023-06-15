package com.pet.sseudam.service;

//import com.pet.sseudam.model.*;
import com.pet.sseudam.model.PetBean;

import java.util.List;

public interface PetPageService {

    int getTotal(PetBean pet);

    List<PetBean> p_list(PetBean pet) throws Exception;
    // 동물 리스트

    void setStartRow(int startRow);

    void setEndRow(int endRow);

    PetBean p_select(Integer p_id);

    int p_update(PetBean pet);

    int p_insert(PetBean pet);
}
