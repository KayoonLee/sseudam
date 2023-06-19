package com.pet.sseudam.dao;

import com.pet.sseudam.model.CounselPaper;
import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.PetBean;
import org.apache.ibatis.annotations.Mapper;

import java.util.Date;
import java.util.List;

@Mapper
public interface ConsultingDao {
     List<Member> find_counselor_name();
     List<Date> find_reservation_time(int g_id, int con_id);

     List<PetBean> find_pet(int g_id);

     Member find_general(int g_id);

     PetBean change_to_pet_id(int g_id,String animal);

     Member find_counselor(int con_id);

     void insert_consult(CounselPaper counselPaper);

     CounselPaper find_consult (int paper_num);
     PetBean select_pet(int g_id);
     void update_consult (CounselPaper counselPaper);
     void delete_consult (int paper_num);

     void accept_consult (int paper_num);
}
