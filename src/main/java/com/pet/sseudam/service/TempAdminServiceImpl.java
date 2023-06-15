package com.pet.sseudam.service;

import com.pet.sseudam.dao.TempAdminDao;
import com.pet.sseudam.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Primary
public class TempAdminServiceImpl implements TempAdminService {

    @Autowired
    private TempAdminDao admindao;

    @Override
    public List<Member> admin_list(Member member) {
        return admindao.admin_list(member);
    }

    @Override
    public Member adminSelect(Integer m_id) {
        return admindao.adminSelect(m_id);
    }
}
