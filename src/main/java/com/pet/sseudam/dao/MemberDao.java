package com.pet.sseudam.dao;

import com.pet.sseudam.model.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDao {

    void insert(Member member);

    Member userCheck(String email);

    Member emailChk(String email);

    Member nickChk(String nick);

    int getNumber(Member member);
}
