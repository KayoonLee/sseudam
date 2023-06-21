package com.pet.sseudam.service;

import com.pet.sseudam.dao.FreeDao;
import com.pet.sseudam.model.FreeBean;
import com.pet.sseudam.model.ImgBean;
import com.pet.sseudam.model.RecomBean;
import com.pet.sseudam.model.ReportBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Primary
public class FreeServiceImpl implements FreeService{

    @Autowired
    private final FreeDao dao;

    public FreeServiceImpl(FreeDao dao) {
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
        return dao.getMaxnum();
    }

    public int imgAdd(ImgBean imgBoard) {
        return dao.imgAdd(imgBoard);
    }

    public List<ImgBean> imgView(int fileNum) {
        return dao.imgView(fileNum);
    }

    public List<ImgBean> imgList(ImgBean imgBoard) {
        return dao.imgList(imgBoard);
    }

    public int imgDelete(int file_Num) {
        return dao.imgDelete(file_Num);
    }

    public int imgUpdate(ImgBean imgBoard) {
        return dao.imgUpdate(imgBoard);
    }

}