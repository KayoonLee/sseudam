package com.pet.sseudam.service;

import com.pet.sseudam.dao.AdminDao;
import com.pet.sseudam.model.Counselor;
import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.PetBean;
import com.pet.sseudam.model.ReportBean;
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
    public PetBean petSelect(Integer m_id) {
        return adminDao.petSelect(m_id);
    }

    // 가윤
    @Override
    public List<PetBean> dog_list(PetBean pet) { return adminDao.dog_list(pet); }

    @Override
    public List<PetBean> cat_list(PetBean pet) { return adminDao.cat_list(pet); }

    @Override
    public List<ReportBean> admin_report_list() {
        return adminDao.admin_report_list();
    }

    @Override
    public ReportBean admin_report_view(ReportBean reportBoard) {
         return adminDao.admin_report_view(reportBoard);
    }

    @Override
    public List<Member> admin_counsel_list(Member member) {
        return adminDao.admin_counsel_list(member);
    }

    @Override
    public Member admin_counsel_select(Member member) {
        return adminDao.admin_counsel_select(member);
    }

    @Override
    public int admin_counsel_accept(Member member) {
        return adminDao.admin_counsel_accept(member);
    }

    @Override
    public int admin_counsel_decline(Member member) {
        return adminDao.admin_counsel_decline(member);
    }

    @Override
    public int admin_state_change(Member member) {
        return adminDao.admin_state_change(member);
    }

    @Override
    public int admin_nick_change(Member member) {
        return adminDao.admin_nick_change(member);
    }

}
