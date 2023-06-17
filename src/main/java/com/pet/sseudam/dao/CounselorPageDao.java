package com.pet.sseudam.dao;

import com.pet.sseudam.model.Counselor;
import com.pet.sseudam.model.Member;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CounselorPageDao {

    int csUpdate(Counselor counselor);

    Counselor counselChk(int c_id);
}
