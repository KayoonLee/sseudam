package com.pet.sseudam.service;

import com.pet.sseudam.model.FreeBean;
import com.pet.sseudam.model.ImgBean;
import com.pet.sseudam.model.RecomBean;
import com.pet.sseudam.model.ReportBean;

import java.util.List;

 public interface FreeService {

    int getTotal(FreeBean fboard);

    List<FreeBean> f_list(FreeBean fboard);

    int fInsert(FreeBean fboard);

     FreeBean fView(FreeBean freeboard);

     void fUpdateReadcount(FreeBean freeboard);

     int fUpdate(FreeBean fboard);

     int fDelete(FreeBean fboard);

     int recomCheck(RecomBean recomb);

     int recomAdd(RecomBean recomb);

     int recomRemove(RecomBean recomb);

     int recomCount(RecomBean recomb);

     int reportCheck(ReportBean reportboard);

     int reportPlus(ReportBean reportboard);

     int recomPlus(RecomBean recomb);

     int recomMinus(RecomBean recomb);

     int getMaxnum();

     int imgAdd(ImgBean imgBoard);

     List<ImgBean> imgView(int fileNum);

     List<ImgBean> imgList(ImgBean imgBoard);

     int imgDelete(int file_Num);

     int imgUpdate(ImgBean imgBoard);
    
}
