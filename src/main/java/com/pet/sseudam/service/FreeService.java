package com.pet.sseudam.service;

import com.pet.sseudam.dao.FreeDao;
import com.pet.sseudam.model.FreeBean;
import com.pet.sseudam.model.RecomBean;
import com.pet.sseudam.model.ReportBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FreeService {

    @Autowired
    private final FreeDao dao;

    public FreeService(FreeDao dao) {
        this.dao = dao;
    }

    public int getTotal(FreeBean fboard) {
        return dao.getTotal(fboard);
    }

    public List<FreeBean> f_list(FreeBean fboard) {
        return dao.f_list(fboard);
    }

    public int fInsert(FreeBean fboard) {
        return dao.fInsert(fboard);
    }

    public FreeBean fView(FreeBean freeboard) {
        return dao.fView(freeboard);
    }

    public void fUpdateReadcount(FreeBean freeboard) {
        dao.fUpdateReadcount(freeboard);
    }

    public int fUpdate(FreeBean fboard) {
        return dao.fUpdate(fboard);
    }

    public int fDelete(FreeBean fboard) {
        return dao.fDelete(fboard);
    }

    public int recomCheck(RecomBean recomb) {
        return dao.recomCheck(recomb);
    }

    public int recomAdd(RecomBean recomb) {
        return dao.recomAdd(recomb);
    }

    public int recomRemove(RecomBean recomb) {
        return dao.recomRemove(recomb);
    }

    public int recomCount(RecomBean recomb) {
        return dao.recomCount(recomb);
    }

    public int reportCheck(ReportBean reportboard) {
        return dao.reportCheck(reportboard);
    }

    public int reportPlus(ReportBean reportboard) {
        return dao.reportPlus(reportboard);
    }

    public int recomPlus(RecomBean recomb) {
        return dao.recomPlus(recomb);
    }

    public int recomMinus(RecomBean recomb) {
        return dao.recomMinus(recomb);
    }

    public int getMaxnum() {
        dao.getMaxnum();
    }
}
