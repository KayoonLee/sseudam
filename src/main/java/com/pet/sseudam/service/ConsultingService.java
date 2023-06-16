package com.pet.sseudam.service;

import com.pet.sseudam.model.CounselPaper;
import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.Pet;

import java.util.Date;
import java.util.List;

public interface ConsultingService {

    List<Member> find_counselor_name ();
    List<Date> find_reservation_time(int g_id, int con_id);

    List<Pet> find_pet(int g_id);

    Pet change_to_pet_id(int g_id,String animal);

    Member find_general(int g_id);

    Member find_counselor(int con_id);

    void insert_consult(CounselPaper counselPaper);

    CounselPaper find_consult (int Paper_num);

    Pet select_pet (int g_id);
    CounselPaper update_consult (CounselPaper counselPaper);
}
