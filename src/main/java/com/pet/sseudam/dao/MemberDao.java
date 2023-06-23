package com.pet.sseudam.dao;

import com.pet.sseudam.model.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

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


    int getMaxnum();

    int profileAdd(ProfileBean pfb);

//    Member profileAfter(int m_id);




    void fileView(int profile_num);


    int csMyUpdate(Member member);

    int myPwUpdate(Member member);

    int csMyPwUpdate(Member member);

    int myPicUpdate(Member member);

    List<Member> counselor(Member member);

    Member checkMem(int m_id);

    int memProfileAdd(Member member);

    void myUpfilenum(Member member);

    Member checkFilenum(String email);

    int visitCheck(Visitor visitor);

    int visitInsert(Visitor visitor);

    List<CounselPaper> requestList(int m_id);

    List<FreeBean> mypostList(int m_id);

    List<ReFreeBean> myreplyList(int m_id);

    List<FreeBean> mylikeList(int m_id);

    int deletemember(String email);

    List<CounselPaper> mypaperList(int m_id);
}
