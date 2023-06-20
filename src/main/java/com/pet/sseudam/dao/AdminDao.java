package com.pet.sseudam.dao;

import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.PetBean;
import org.apache.ibatis.annotations.Mapper;

import java.util.*;

@Mapper
public interface AdminDao {

// 진우
    // 회원목록
    List<Member> admin_list(Member member);

    // 일반회원 선택
    Member adminSelect(Integer m_id);

    // 일반회원 선택 + 동물 출력
    List<PetBean> petSelect(Integer m_id);

    // 일반회원 탈퇴
    int adminDelete(Member member); 
    
    // 일반회원 조회 작업중...

// 가윤
    // 일반회원 수 total
    Integer getTotalMember();

    // 상담사 수 total
    Integer getTotalCounselor();

    // 강아지 리스트
    List<PetBean> dog_list(PetBean pet);

    // 강아지 상세페이지
    PetBean adminDogSelect(int p_id);

    // 강아지+사람 상세페이지
    Member adminAnimalSelect(/*int g_id,*/int p_id);

    // 고양이 리스트
    List<PetBean> cat_list(PetBean pet);

    // 고양이 상세페이지
    PetBean adminCatSelect(int p_id);

    // 고양이+사람 상세페이지
    Member adminAnimalSelect_cat(int p_id);

}
