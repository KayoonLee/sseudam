package com.pet.sseudam.dao;

import com.pet.sseudam.model.CounselPaper;
import com.pet.sseudam.model.CounselRecord;
import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.PetBean;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

@Mapper
public interface ConsultingDao {
     List<Member> find_counselor_name();
     List<Date> find_reservation_time(@Param("g_id") int g_id,@Param("con_id") int con_id);

     List<PetBean> find_pet(int g_id);

     Member find_general(int g_id);

     Member find_counselor(int con_id);

     void insert_consult(CounselPaper counselPaper);

     CounselPaper find_consult (int paper_num);
     PetBean select_pet(int g_id);
     void update_consult (CounselPaper counselPaper);
     void delete_consult (int paper_num);
     void accept_consult (int paper_num);
     String now_time();
     void insert_consulting(CounselRecord counselrecord);

     CounselRecord select_counsel_record(int record_num);

    List<CounselPaper> requestTime_list(int c_id);

    void delete_consulting(int record_num);
    void update_consulting(int record_num);

}
