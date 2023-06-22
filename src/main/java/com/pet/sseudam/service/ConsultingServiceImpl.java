package com.pet.sseudam.service;

import com.pet.sseudam.dao.ConsultingDao;
import com.pet.sseudam.model.CounselPaper;
import com.pet.sseudam.model.CounselRecord;
import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.PetBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
@Primary
public class ConsultingServiceImpl implements ConsultingService {

    @Autowired
    private ConsultingDao dao;

    @Override
    public List<Member> find_counselor_name() {
        return dao.find_counselor_name();
    }

    @Override
    public List<Date> find_reservation_time(int g_id, int con_id) {
        return dao.find_reservation_time(g_id, con_id);
    }

    @Override
    public List<PetBean> find_pet(int g_id) {
        return dao.find_pet(g_id);
    }

    @Override
    public Member find_general(int g_id) {
        return dao.find_general(g_id);
    }

    @Override
    public Member find_counselor(int con_id) {
        return dao.find_counselor(con_id);
    }

    public void insert_consult(CounselPaper counselPaper) {
        dao.insert_consult(counselPaper);
    }

    @Override
    public CounselPaper find_consult(int paper_num) {
        return dao.find_consult(paper_num);
    }

    @Override
    public PetBean select_pet(int g_id) {
        return dao.select_pet(g_id);
    }

    @Override
    public void update_consult(CounselPaper counselPaper) {
        dao.update_consult(counselPaper);
    }

    @Override
    public void delete_consult(int paper_num) {
        dao.delete_consult(paper_num);
    }

    @Override
    public void accept_consult(int paper_num) {
        dao.accept_consult(paper_num);
    }

    @Override
    public String now_time() {
        return dao.now_time();
    }

    @Override
    public void insert_consulting(CounselRecord counselrecord) {
        dao.insert_consulting(counselrecord);
    }

}
