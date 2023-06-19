package com.pet.sseudam.service;

import com.pet.sseudam.model.Counselor;
import com.pet.sseudam.model.Member;

public interface CounselorPageService {
    int csUpdate(Counselor counselor);

    Counselor counselChk(int c_id);
}
