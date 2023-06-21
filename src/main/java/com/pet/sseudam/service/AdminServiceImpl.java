package com.pet.sseudam.service;

import com.pet.sseudam.dao.AdminDao;
import com.pet.sseudam.model.AdminBean;
import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.PetBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
@Primary
// Primary 가 어떤 클래스 파일을 먼저 가져올지 정하는 것.
// AdminService는 Interface이므로, AdminServiceImpl 자바 클래스를 Primary로 정함.
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminDao adminDao;
    // 진우님
    @Override
    public List<Member> admin_list(Member member) {
        return adminDao.admin_list(member);
    }

    @Override
    public Member adminSelect(Integer m_id) {
        return adminDao.adminSelect(m_id);
    }

    @Override
    public List<PetBean> petSelect(Integer m_id) {
        return adminDao.petSelect(m_id);
    }

    // 가윤
    @Override
    public List<PetBean> dog_list(PetBean pet) { return adminDao.dog_list(pet); }

    @Override
    public List<PetBean> cat_list(PetBean pet) { return adminDao.cat_list(pet); }

    @Override
    public AdminBean adminCheck(String a_email) {
        return adminDao.adminCheck(a_email);
    }

    @Override
    public void adminDelete(Member member) {
        adminDao.adminDelete(member);
    }

}