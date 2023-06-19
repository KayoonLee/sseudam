package com.pet.sseudam.service;

import com.pet.sseudam.dao.CounselorDao;
import com.pet.sseudam.dao.MemberDao;
import com.pet.sseudam.model.Counselor;
import com.pet.sseudam.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Primary
public class CounselorServiceImpl implements CounselorService{
    @Autowired
    private CounselorDao cd;
    @Autowired
    private MemberDao md;


    @Override
    public void insert_counsel( Counselor counselor) {
        cd.insert_counsel(counselor);
    }

    @Override
    public int emailChk(String email) {
        int cnt=0;
        Member member = md.emailChk(email);
        if(member!=null) cnt = 1;
        return cnt;
    }

    @Override
    public int nickChk(String nick) {
        int cnt=0;
        Member member = md.nickChk(nick);
        if(member!=null) cnt = 1;
        return cnt;
    }

    @Override
    public int getNumber(Member member) {
        return md.getNumber(member);
    }

    @Override
    public int csUpdate(Counselor counselor) {
        return cd.csUpdate(counselor);
    }

    @Override
    public Counselor counselChk(int c_id) {
        return cd.counselChk(c_id);
    }




}
