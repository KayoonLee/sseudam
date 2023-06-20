package com.pet.sseudam.dao;

import com.pet.sseudam.model.Counselor;
import com.pet.sseudam.model.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CounselorDao {
    void insert_counsel(Counselor counselor);

    Counselor emailChk(String email);

    Counselor nickChk(String nick);

    int csUpdate(Counselor counselor);

    Counselor counselChk(int c_id);


}
