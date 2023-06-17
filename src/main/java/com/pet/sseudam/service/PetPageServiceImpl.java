package com.pet.sseudam.service;

import com.pet.sseudam.dao.PetDao;
import com.pet.sseudam.model.PetBean;
import com.pet.sseudam.model.ProfileBean;
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
    public PetBean p_select(int p_id) {
        System.out.println("펫상세페이지서비스"+p_id);
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


    // 프로필사진 관련
    // 프로필사진은 하나기 때문에 list로 만들 필요없고, p_id로 조인해서 가져오기 때문에 추가, 삭제만 있으면됨
    @Override
    public int profileDelete(int profileNum) {
        return dao.profileDelete(profileNum);
    }

    @Override
    public int profileAdd(ProfileBean profileBean) {
        return dao.profileAdd(profileBean);
    }


    @Override
    public int profileUpdate(ProfileBean profileBoard) {
        return dao.profileUpdate(profileBoard);
    }

    @Override
    public String profileSelect(ProfileBean profileBoard) {
        return dao.profileSelect(profileBoard);
    }


}
