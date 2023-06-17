package com.pet.sseudam.service;

import com.pet.sseudam.dao.CounselorPageDao;
import com.pet.sseudam.model.Counselor;
import com.pet.sseudam.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

@Service
@Primary
public class CounselorPageServiceImpl implements CounselorPageService {
    @Autowired
    private CounselorPageDao cpd;

    @Override
    public int csUpdate(Counselor counselor) {
        return cpd.csUpdate(counselor);
    }

    @Override
    public Counselor counselChk(int c_id) {
        return cpd.counselChk(c_id);
    }
}
