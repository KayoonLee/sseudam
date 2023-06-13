package com.pet.sseudam.service;

import com.pet.sseudam.dao.MemberDao;
import com.pet.sseudam.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

@Service
@Primary
public class MemberServiceImpl implements MemberService{
    @Autowired
    private MemberDao md;
    @Override
    public void insert(Member member){
        md.insert(member);
    }

    @Override
    public Member userCheck(String email){
        return md.userCheck(email);
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
        if(member!=null) cnt=1;
        return cnt;
    }

    ;
}
