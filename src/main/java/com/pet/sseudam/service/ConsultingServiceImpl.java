package com.pet.sseudam.service;

import com.pet.sseudam.dao.ConsultingDao;
import com.pet.sseudam.model.CounselPaper;
import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.Pet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
@Primary
public class ConsultingServiceImpl implements ConsultingService{

    @Autowired
    private ConsultingDao dao;

    @Override
    public List<Member> find_counselor_name() {
        return dao.find_counselor_name();
    }

    @Override
    public List<Date> find_reservation_time(int g_id , int con_id) {
        return dao.find_reservation_time(g_id,con_id);
    }

    @Override
    public List<Pet> find_pet(int g_id) {
        return dao.find_pet(g_id);
    }

    @Override
    public Pet change_to_pet_id(int g_id, String animal) {
        return dao.change_to_pet_id(g_id,animal);
    }

    @Override
    public Member find_general(int g_id) {
        return dao.find_general(g_id);
    }

    @Override
    public Member find_counselor(int con_id) {
        return dao.find_counselor(con_id);
    }

    public void insert_consult(CounselPaper counselPaper){
        dao.insert_consult(counselPaper);
    }

    @Override
    public CounselPaper find_consult(int paper_num) {
        return dao.find_consult(paper_num);
    }

    @Override
    public Pet select_pet(int g_id) {
        return dao.select_pet(g_id);
    }

    @Override
    public CounselPaper update_consult(CounselPaper counselPaper) {
        return dao.update_consult(counselPaper);
    }

}
