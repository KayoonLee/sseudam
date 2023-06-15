package com.pet.sseudam.service;

import com.pet.sseudam.model.Member;

import java.util.List;

public interface TempAdminService {
    List<Member> admin_list(Member member);

    Member adminSelect(Integer m_id);
}
