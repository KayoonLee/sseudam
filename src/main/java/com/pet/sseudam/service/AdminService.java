package com.pet.sseudam.service;

import com.pet.sseudam.model.Counselor;
import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.PetBean;
import com.pet.sseudam.model.ReportBean;

import java.util.*;

public interface AdminService {

    /* 진우님이 적으신 것 */
    List<Member> admin_list(Member member);
    Member adminSelect(Integer m_id);
    PetBean petSelect(Integer m_id);

    List<PetBean> dog_list(PetBean pet);
    List<PetBean> cat_list(PetBean pet);

    List<ReportBean> admin_report_list();

    ReportBean admin_report_view(ReportBean reportBoard);

    List<Member> admin_counsel_list(Member member);

    Counselor admin_counsel_select(Counselor counselor);

    int admin_counsel_accept(Member member);

    int admin_counsel_decline(Member member);

}
