package com.pet.sseudam.service;

import com.pet.sseudam.dao.PetDao;
import com.pet.sseudam.model.PetBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.List;
@Primary
@Service
public class PetPageServiceImpl implements PetPageService{

    @Autowired
    private PetDao dao;

    @Override
    public List<PetBean> p_list(PetBean pet) throws Exception {
        return dao.p_list(pet);
    }

    @Override
    public int getTotal(PetBean pet) {
        return dao.getTotal(pet);
    }

    @Override
    public void setStartRow(int startRow) {

    }

    @Override
    public void setEndRow(int endRow) {

    }

    @Override
    public PetBean p_select(Integer p_id) {
        return dao.p_select(p_id);
    }

    @Override
    public int p_update(PetBean pet) {
        return dao.p_update(pet);
    }

    @Override
    public int p_insert(PetBean pet) {
        return dao.p_insert(pet);
    }


}
