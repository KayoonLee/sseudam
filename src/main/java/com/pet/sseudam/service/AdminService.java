package com.pet.sseudam.service;

import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.PetBean;

import java.util.*;

public interface AdminService {

    /* 진우님이 적으신 것 */
    List<Member> admin_list(Member member);
    Member adminSelect(Integer m_id);
    List<PetBean> petSelect(Integer m_id);
    int adminDelete(Member member);
    List<PetBean> dog_list(PetBean pet);

    List<PetBean> cat_list(PetBean pet);
}
