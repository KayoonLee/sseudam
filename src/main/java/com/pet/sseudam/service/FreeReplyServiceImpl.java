package com.pet.sseudam.service;

import com.pet.sseudam.dao.FreeReplyDao;
import com.pet.sseudam.model.ReFreeBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Primary
public class FreeReplyServiceImpl implements FreeReplyService{
	@Autowired
	private FreeReplyDao reDao;

	@Override
	public int getTotalRe(ReFreeBean reBoard) {
		return reDao.getTotalRe(reBoard);
	}
	public List<ReFreeBean> re_list(ReFreeBean reBoard) {

		return reDao.re_list(reBoard);
	}

	public int re_insert(ReFreeBean reBoard) {
		return reDao.re_insert(reBoard);
	}

	public void delete(int rno) {
		reDao.delete(rno);
	}

	public void update(ReFreeBean reBoard) {
		reDao.update(reBoard);
	}

	@Override
	public int re_delete(ReFreeBean reBoard) {
		return reDao.re_delete(reBoard);
	}


}