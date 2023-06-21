package com.pet.sseudam.service;

import com.pet.sseudam.model.ReFreeBean;

import java.util.List;

public interface FreeReplyService {

    int getTotalRe(ReFreeBean reBoard);
    List<ReFreeBean> re_list(ReFreeBean reBoard);

    int re_insert(ReFreeBean reBoard);

    void update(ReFreeBean reBoard);

    int re_delete(ReFreeBean reBoard);

}