package com.pet.sseudam.dao;

import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.ProfileBean;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDao {

    void insert(Member member);

    Member userCheck(String email);

    Member emailChk(String email);

    Member nickChk(String nick);

    int getNumber(Member member);

    Member searchEmail(Member member);


    Member searchPwd(Member member);

    void updatePwd(Member findmember);

    int updateNewPw(Member member);

    int myUpdate(Member member);


    void csmyUpdate(Member member);

    int getMaxnum();

    int profileAdd(ProfileBean pfb);

//    Member profileAfter(int m_id);




    void fileView(int profile_num);
}
