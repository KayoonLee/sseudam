package com.pet.sseudam.service;

import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.ProfileBean;

import java.util.List;

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




    int getMaxnum();

    int profileAdd(ProfileBean pfb);

    void fileView(int profile_num);

    int csMyUpdate(Member member);

    int myPwUpdate(Member member);

    int csMyPwUpdate(Member member);

    int myPicUpdate(Member member);

    List<Member> counselorList(Member member);


//    Member profileAfter(int m_id);
}
