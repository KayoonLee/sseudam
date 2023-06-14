package com.pet.sseudam.service;

import com.pet.sseudam.model.Member;

public interface MemberService{

    void insert(Member member);

    Member userCheck(String email);

    int emailChk(String email);

    int nickChk(String nick);

    Member searchEmail(Member member);


    Member searchPwd(Member member);
}
