package com.pet.sseudam.service;

import com.pet.sseudam.dao.AdminDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

@Service
@Primary
public class AdminServiceImpl implements AdminService {

    @Autowired
    private final AdminDao dao;

    public AdminServiceImpl(AdminDao dao) { this.dao = dao; }

}
