package com.pet.sseudam.service;

import com.pet.sseudam.model.NoteBean;

import java.util.List;

public interface NoteService {


    int insertNote(NoteBean note);

    int checkReceiver(NoteBean note);

    List<NoteBean> noteList(NoteBean note);

    NoteBean noteView(NoteBean note);

    int noteDelete(NoteBean note);

    List<NoteBean> noteReceiveList(NoteBean note);

    int noteChangeChecking(NoteBean note);

    int noteCount(NoteBean note);

    List<NoteBean> noteRecentList(NoteBean note);
}
