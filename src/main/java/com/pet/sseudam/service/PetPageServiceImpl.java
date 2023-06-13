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
}
