package com.pet.sseudam.dao;

import com.pet.sseudam.model.Counselor;
import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.PetBean;
import com.pet.sseudam.model.ReportBean;
import org.apache.ibatis.annotations.Mapper;
import java.util.*;

@Mapper
public interface AdminDao {
    /* 진우님 멤버 */
    List<Member> admin_list(Member member);
    Member adminSelect(Integer m_id);
    PetBean petSelect(Integer m_id);

    // 가윤
    List<PetBean> dog_list(PetBean pet);
    List<PetBean> cat_list(PetBean pet);

    List<ReportBean> admin_report_list();

    ReportBean admin_report_view(ReportBean reportBoard);

    List<Member> admin_counsel_list(Member member);

    Counselor admin_counsel_select(Counselor counselor);

    int admin_counsel_accept(Member member);

    int admin_counsel_decline(Member member);

}
