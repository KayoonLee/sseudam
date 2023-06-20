package com.pet.sseudam.dao;

import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.PetBean;
import org.apache.ibatis.annotations.Mapper;
import java.util.*;

@Mapper
public interface AdminDao {
    /* 진우님 멤버 */
    List<Member> admin_list(Member member);
    Member adminSelect(Integer m_id);
    List<PetBean> petSelect(Integer m_id);
    int adminDelete(Member member);            //회원탈퇴

    // 가윤
    List<PetBean> dog_list(PetBean pet);

    List<PetBean> cat_list(PetBean pet);
}
