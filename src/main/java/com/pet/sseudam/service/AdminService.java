package com.pet.sseudam.service;

import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.PetBean;
import com.pet.sseudam.model.ReportBean;
import com.pet.sseudam.model.AdminBean;

import java.util.*;

public interface AdminService {

    // 관리자 로그인
    AdminBean adminCheck(String a_email);

// 진우
    List<Member> admin_list(Member member);

    Member adminSelect(Integer m_id);

    List<PetBean> petSelect(Integer m_id);

    int adminDelete(Member member);

// 세욱
    List<ReportBean> admin_report_list();

    ReportBean admin_report_view(ReportBean reportBoard);

    List<Member> admin_counsel_list(Member member);

    Member admin_counsel_select(Member member);

    int admin_counsel_accept(Member member);

    int admin_counsel_decline(Member member);

    int admin_state_change(Member member);

    int admin_nick_change(Member member);

// 가윤
    // 일반회원 total
    Integer getTotalMember();

    // 상담사 total
    Integer getTotalCounselor();

    // 관리자 total
    Integer getTotalAdmin();

    // 강아지 리스트
    List<PetBean> dog_list(PetBean pet);

    // 강아지 상세페이지
    PetBean adminDogSelect(int p_id);

    // 강아지+사람 상세페이지
    Member adminAnimalSelect(int p_id);

    // 강아지 탈퇴/복구 상태값 변화
    int adminDogState(PetBean pet);

    // 고양이 리스트
    List<PetBean> cat_list(PetBean pet);

    // 고양이 상세페이지
    PetBean adminCatSelect(int p_id);

    // 고양이+사람 상세페이지
    Member adminAnimalSelect_cat(int p_id);

    // 고양이 탈퇴/복구 상태값 변화
    int adminCatState(PetBean pet);


    int getVisitToday();

    int getVisitTotal();

    List<Integer> getVisitWeek();

    List<String> getVisitDays();
}
