package com.pet.sseudam.dao;

import com.pet.sseudam.model.FreeBean;
import com.pet.sseudam.model.RecomBean;
import com.pet.sseudam.model.ReportBean;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface FreeDao {

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

    void getMaxnum();
}
