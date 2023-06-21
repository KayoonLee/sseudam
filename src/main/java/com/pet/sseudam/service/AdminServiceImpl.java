package com.pet.sseudam.service;

import com.pet.sseudam.dao.AdminDao;
import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.PetBean;
import com.pet.sseudam.model.ReportBean;
import com.pet.sseudam.model.AdminBean;
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

    //삭제, 복구 메소드
    @Override
    public int adminDelete(Member member) {
        return adminDao.adminDelete(member);
    }

// 세욱
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
    public int admin_state_change(Member member) { return adminDao.admin_state_change(member); }

    @Override
    public int admin_nick_change(Member member) {
        return adminDao.admin_nick_change(member);
    }

// 가윤
    // 일반회원 total
    @Override
    public Integer getTotalMember() {
        return adminDao.getTotalMember();
    }

    // 상담사 total
    @Override
    public Integer getTotalCounselor() {
        return adminDao.getTotalCounselor();
    }

    // 관리자 total
    @Override
    public Integer getTotalAdmin() { return adminDao.getTotalAdmin(); }

    // 강아지 리스트
    @Override
    public List<PetBean> dog_list(PetBean pet) {
        return adminDao.dog_list(pet);
    }

    // 강아지 상세페이지
    @Override
    public PetBean adminDogSelect(int p_id) {
        return adminDao.adminDogSelect(p_id);
    }

    // 강아지+사람 상세페이지
    @Override
    public Member adminAnimalSelect(/*int g_id, */int p_id) {
        return adminDao.adminAnimalSelect(/*g_id,*/p_id);
    }

    // 강아지 탈퇴/복구 상태값 변화
    @Override
    public int adminDogState(PetBean pet) { return adminDao.adminDogState(pet); }

    // 고양이 리스트
    @Override
    public List<PetBean> cat_list(PetBean pet) {
        return adminDao.cat_list(pet);
    }

    // 고양이 상세페이지
    @Override
    public PetBean adminCatSelect(int p_id) {
        return adminDao.adminCatSelect(p_id);
    }

    // 고양이+사람 상세페이지
    @Override
    public Member adminAnimalSelect_cat(int p_id) {
        return adminDao.adminAnimalSelect_cat(p_id);
    }

    // 고양이 탈퇴/복구 상태값 변화
    @Override
    public int adminCatState(PetBean pet) { return adminDao.adminCatState(pet); }

    // 관리자 로그인
    @Override
    public AdminBean adminCheck(String a_email) {
        return adminDao.adminCheck(a_email);
    }
}
