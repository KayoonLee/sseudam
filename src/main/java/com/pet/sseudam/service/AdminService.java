package com.pet.sseudam.service;

import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.PetBean;

import java.util.*;

public interface AdminService {

// 진우
    List<Member> admin_list(Member member);
    Member adminSelect(Integer m_id);
    PetBean petSelect(Integer m_id);

// 가윤
    // 강아지 리스트
    List<PetBean> dog_list(PetBean pet);

    // 강아지 상세페이지
    PetBean adminDogSelect(int p_id);

    // 강아지+사람 상세페이지
    Member adminAnimalSelect(int p_id);

    // 고양이 리스트
    List<PetBean> cat_list(PetBean pet);

    // 고양이 상세페이지
    PetBean adminCatSelect(int p_id);


}
