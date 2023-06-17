package com.pet.sseudam.service;

import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.ProfileBean;

public interface MemberService{

    void insert(Member member);

    Member userCheck(String email);

    int emailChk(String email);

    int nickChk(String nick);

    Member searchEmail(Member member);


    Member searchPwd(Member member);

    void updatePwd(Member findmember);

    int updateNewPw(Member member);

    int myUpdate(Member member);


    void csmyUpdate(Member member);

    int getMaxnum();

    int profileAdd(ProfileBean pfb);

    void fileView(int profile_num);


//    Member profileAfter(int m_id);
}
