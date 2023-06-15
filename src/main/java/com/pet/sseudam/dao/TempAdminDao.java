package com.pet.sseudam.dao;

import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.PetBean;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface TempAdminDao {
    List<Member> admin_list(Member member);

    Member adminSelect(Integer m_id);

    PetBean petSelect(Integer m_id);
}
