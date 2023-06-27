package com.pet.sseudam.service;

import com.pet.sseudam.model.Counselor;
import com.pet.sseudam.model.Member;

import java.util.List;

public interface CounselorService {

    void insert_counsel(Counselor counselor);

    int emailChk(String email);

    int nickChk(String nick);

    int getNumber(Member member);

    int csUpdate(Counselor counselor);

    Counselor counselChk(int c_id);


}
