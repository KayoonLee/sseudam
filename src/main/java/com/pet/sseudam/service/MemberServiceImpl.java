package com.pet.sseudam.service;

import com.pet.sseudam.dao.MemberDao;
import com.pet.sseudam.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.List;

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
    public int myUpdate(Member member) {
        return md.myUpdate(member);
    }


    @Override
    public int getMaxnum() {
        return md.getMaxnum();
    }

    @Override
    public int profileAdd(ProfileBean pfb) {
        return md.profileAdd(pfb);
    }

    @Override
    public void fileView(int profile_num) {
        md.fileView(profile_num);
    }

    @Override
    public int csMyUpdate(Member member) {
        return md.csMyUpdate(member);
    }

    @Override
    public int myPwUpdate(Member member) {
        return md.myPwUpdate(member);
    }

    @Override
    public int csMyPwUpdate(Member member) {
        return md.csMyPwUpdate(member);
    }

    @Override
    public int myPicUpdate(Member member) {
        return md.myPicUpdate(member);
    }

    @Override
    public List<Member> counselorList(Member member) {
        return md.counselor(member);
    }

    @Override
    public Member checkMem(int m_id) {
        return md.checkMem(m_id);
    }

    @Override
    public int memProfileAdd(Member member) {
        return md.memProfileAdd(member);
    }

    @Override
    public void myUpfilenum(Member member) {
        md.myUpfilenum(member);
    }

    @Override
    public Member checkFilenum(String email) {
        return md.checkFilenum(email);
    }

    @Override
    public int visitCheck(Visitor visitor) {
        return md.visitCheck(visitor);
    }

    @Override
    public int visitInsert(Visitor visitor) {
        return md.visitInsert(visitor);
    }

    @Override
    public List<CounselPaper> requestList(int m_id) {
        return md.requestList(m_id);
    }

    @Override
    public List<FreeBean> mypostList(int m_id) {
        return md.mypostList(m_id);
    }

    @Override
    public List<ReFreeBean> myreplyList(int m_id) {
        return md.myreplyList(m_id);
    }

    @Override
    public List<FreeBean> mylikeList(int m_id) {
        return md.mylikeList(m_id);
    }

    @Override
    public int deletemember(String email) {
        return md.deletemember(email);
    }

    @Override
    public List<CounselPaper> mypaperList(int m_id) {
        return md.mypaperList(m_id);
    }


}



