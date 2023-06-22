package com.pet.sseudam.service;

import com.pet.sseudam.dao.CounselorDao;
import com.pet.sseudam.dao.PetDao;
import com.pet.sseudam.model.PetBean;
import com.pet.sseudam.model.ProfileBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Primary
public class PetPageServiceImpl implements PetPageService{

    @Autowired
    private PetDao dao;

    @Override
    public int getTotal(PetBean pet) {
        return dao.getTotal(pet);
    }

    @Override
    public List<PetBean> p_list(PetBean pet) throws Exception {
        return dao.p_list(pet);
    }

    @Override
    public void setStartRow(int startRow) {

    }

    @Override
    public void setEndRow(int endRow) {

    }

    @Override
    public PetBean p_select(int p_id) {
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

    @Override
    public int getMaxnum() {
        return dao.getMaxnum();
    }

    @Override
    public int profileDelete(int profileNum) {
        return dao.profileDelete(profileNum);
    }

    @Override
    public int profileAdd(ProfileBean profileBoard) {
        return dao.profileAdd(profileBoard);
    }

    @Override
    public int profileUpdate(ProfileBean profileBoard) {
        return dao.profileUpdate(profileBoard);
    }

    @Override
    public String profileSelect(ProfileBean profileBoard) {
        return dao.profileSelect(profileBoard);
    }

    @Override
    public int profileInsert(PetBean pet) {
        return dao.profileInsert(pet);
    }

    @Override
    public int p_modify(PetBean pet) {
        return dao.p_modify(pet);
    }
}
