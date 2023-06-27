package com.pet.sseudam.dao;

import com.pet.sseudam.model.NoteBean;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface NoteDao {
    int insertNote(NoteBean note);

    int checkReceiver(NoteBean note);

    List<NoteBean> noteList(NoteBean note);

    NoteBean noteView(NoteBean note);

    int noteDelete(NoteBean note);

    List<NoteBean> noteReceiveList(NoteBean note);

    int noteChangeChecking(NoteBean note);

    List<NoteBean> noteRecentList(NoteBean note);
}
