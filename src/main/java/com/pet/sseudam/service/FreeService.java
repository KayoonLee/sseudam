package com.pet.sseudam.service;

import com.pet.sseudam.dao.FreeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FreeService {

    @Autowired
    private final FreeDao dao;

    public FreeService(FreeDao dao) {
        this.dao = dao;
    }


}
