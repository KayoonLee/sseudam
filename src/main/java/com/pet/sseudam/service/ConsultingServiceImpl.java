package com.pet.sseudam.service;

import com.pet.sseudam.dao.ConsultingDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

@Service
@Primary
public class ConsultingServiceImpl implements ConsultingService{

    @Autowired
    private ConsultingDao dao;

    @Override
    public String find_counselor() {
        return dao.find_counselor();
    }
}
