package com.pet.sseudam.service;

import com.pet.sseudam.model.Counselor;
import com.pet.sseudam.model.Member;

public interface CounselorService {

    void insert_counsel(Counselor counselor);

    int emailChk(String email);

    int nickChk(String nick);

    int getNumber(Member member);


}
