package com.pet.sseudam.service;

import com.pet.sseudam.model.CounselPaper;
import com.pet.sseudam.model.CounselRecord;
import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.PetBean;

import java.util.Date;
import java.util.List;

public interface ConsultingService {

// 찬근
    List<Member> find_counselor_name ();
    List<Date> find_reservation_time(int g_id, int con_id);

    List<PetBean> find_pet(int g_id);

    Member find_general(int g_id);

    Member find_counselor(int con_id);

    void insert_consult(CounselPaper counselPaper);

    CounselPaper find_consult (int Paper_num);

    PetBean select_pet (int g_id);
    void update_consult (CounselPaper counselPaper);
    void delete_consult (int paper_num);
    void accept_consult (int paper_num);
    String now_time();
    void insert_consulting(CounselRecord counselrecord);
    CounselRecord select_counsel_record(int record_num);
    
    // requestTIme 조회 sjw
    List<CounselPaper> requestTime_list(int c_id);
    void delete_consulting(int record_num);
    void update_consulting(int record_num);
}
