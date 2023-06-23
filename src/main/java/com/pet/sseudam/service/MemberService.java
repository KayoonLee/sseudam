package com.pet.sseudam.service;

import com.pet.sseudam.model.*;

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

    Member checkMem(int m_id);
    int memProfileAdd(Member member);

    void myUpfilenum(Member member);

    Member checkFilenum(String email);


//    Member profileAfter(int m_id);

    int visitCheck(Visitor visitor);

    int visitInsert(Visitor visitor);

    List<CounselPaper> requestList(int m_id);

    List<FreeBean> mypostList(int m_id);

    List<ReFreeBean> myreplyList(int mId);

    List<FreeBean> mylikeList(int m_id);

    int deletemember(String email);
}
