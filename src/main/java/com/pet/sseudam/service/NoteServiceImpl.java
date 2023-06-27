package com.pet.sseudam.service;

import com.pet.sseudam.dao.NoteDao;
import com.pet.sseudam.model.NoteBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Primary
public class NoteServiceImpl implements NoteService{

    @Autowired
    private final NoteDao dao;
    public NoteServiceImpl(NoteDao dao) {
        this.dao = dao;
    }


    @Override
    public int insertNote(NoteBean note) {
        return dao.insertNote(note);
    }

    @Override
    public int checkReceiver(NoteBean note) {
        return dao.checkReceiver(note);
    }

    @Override
    public List<NoteBean> noteList(NoteBean note) {
        return dao.noteList(note);
    }

    @Override
    public NoteBean noteView(NoteBean note) {
        return dao.noteView(note);
    }

    @Override
    public int noteDelete(NoteBean note) {
        return dao.noteDelete(note);
    }

    @Override
    public List<NoteBean> noteReceiveList(NoteBean note) {
        return dao.noteReceiveList(note);
    }

    @Override
    public int noteChangeChecking(NoteBean note) {
        return dao.noteChangeChecking(note);
    }

    @Override
    public List<NoteBean> noteRecentList(NoteBean note) {
        return dao.noteRecentList(note);
    }

}
