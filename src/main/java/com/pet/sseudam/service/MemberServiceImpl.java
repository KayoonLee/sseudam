package com.pet.sseudam.service;

import com.pet.sseudam.dao.MemberDao;
import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.Visitor;
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

    @Override
    public Member searchEmail(Member member) {
        return md.searchEmail(member);
    }

    @Override
    public Member searchPwd(Member member) {
        return md.searchPwd(member);
    }

    @Override
    public void updatePwd(Member findmember) {
        md.updatePwd(findmember);
    }

    @Override
    public int updateNewPw(Member member) {
        return md.updateNewPw(member);
    }

    @Override
    public int visitCheck(Visitor visitor) {
        return md.visitCheck(visitor);
    }

    @Override
    public int visitInsert(Visitor visitor) {
        return md.visitInsert(visitor);
    }


}



