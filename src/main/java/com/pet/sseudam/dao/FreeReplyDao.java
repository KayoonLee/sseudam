package com.pet.sseudam.dao;

import java.util.List;

import com.pet.sseudam.model.ReFreeBean;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FreeReplyDao {

	List<ReFreeBean> re_list(ReFreeBean reBoard);

	int re_insert(ReFreeBean reBoard);

	void delete(int rno);

	void update(ReFreeBean reBoard);

	int getTotalRe(ReFreeBean reBoard);

	int re_delete(ReFreeBean reBoard);
}