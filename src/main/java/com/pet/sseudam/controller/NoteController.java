package com.pet.sseudam.controller;

import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.NoteBean;
import com.pet.sseudam.service.NoteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class NoteController {

    @Autowired
    private final NoteService service;

    public NoteController(NoteService service) {
        this.service = service;
    }

    // 쪽지 작성폼
    @GetMapping("noteInsertForm")
    public String noteInsertForm(Model model){

        System.out.println("noteInsertForm 도착");

        return "note/note_insert_form";
    }

    // 쪽지 보내기
    @ResponseBody
    @PostMapping("sendNote")
    public int sendNote(NoteBean note){

        System.out.println("sendNote 도착");
        System.out.println(note.getReceiver());

        int receiverCheck = service.checkReceiver(note);
        System.out.println("receiverCheck = "+receiverCheck);

        if(receiverCheck == 0){
            return 12;
        }

        int result = service.insertNote(note);
        System.out.println("result = "+result);

        return result;
    }

    //보낸 쪽지목록
    @GetMapping("noteList")
    public String noteList(NoteBean note, HttpSession session, Model model){

        System.out.println("noteList 도착");

        Member member = (Member) session.getAttribute("member");
        int sender = member.getM_id();
        System.out.println("sender : " + sender);

        note.setSender(sender);

        List<NoteBean> note_list = service.noteList(note);
        System.out.println("보낸 쪽지 목록은 :"+note_list);

        model.addAttribute("note_list", note_list);

        return "note/note_list";
    }

    //받은 쪽지목록
    @GetMapping("noteReceiveList")
    public String noteReceiveList(NoteBean note, HttpSession session, Model model){

        System.out.println("noteReceiveList 도착");

        Member member = (Member) session.getAttribute("member");
//        note.setReceiver(member.getNick());
        String nick = member.getNick();
        System.out.println("nick : "+nick);
        note.setReceiver(nick);

        List<NoteBean> note_list = service.noteReceiveList(note);
        System.out.println("쪽지받은 목록은 :"+note_list);

        model.addAttribute("note_list", note_list);

        return "note/note_receive_list";
    }

    //쪽지 상세페이지
    @GetMapping("noteView")
    public String noteView(NoteBean noteBean, Model model){

        System.out.println("noteView 도착");

        NoteBean note = service.noteView(noteBean);

        System.out.println("note : "+note);

        model.addAttribute("note", note);

        return "note/note_view";
    }

    //쪽지 삭제
    @ResponseBody
    @PostMapping("deleteNote")
    public int deleteNote(NoteBean note){

        System.out.println("deleteNote 도착");

        int result = service.noteDelete(note);

        return result;
    }

    //쪽지 확인시 checking 변경
    @ResponseBody
    @PostMapping("changeChecking")
    public int changeChecking(NoteBean note){

        System.out.println("changeState 도착");

        System.out.println(note.getNote_num());

        int result = service.noteChangeChecking(note);

        return result;
    }

//    //쪽지 카운트
//    @ResponseBody
//    @PostMapping("countNote")
//    public int countNote(NoteBean note,HttpSession session){
//
//        System.out.println("countNote 도착");
//
//        Member member = (Member) session.getAttribute("member");
//
//        String nick = member.getNick();
//        System.out.println("nick : " + nick);
//
//        note.setReceiver(nick);
//        int unreadCount = service.noteCount(note);
//
//        System.out.println("unreadCount : "+unreadCount);
//
//        return unreadCount;
//    }

    //쪽지 갯수 리스트
    @ResponseBody
    @PostMapping("noteRecentList")
    public List<NoteBean> noteRecentList(NoteBean note, HttpSession session){

        System.out.println("noteRecentList 도착");

        Member member = (Member) session.getAttribute("member");

        String nick = member.getNick();
        System.out.println("nick : " + nick);

        note.setReceiver(nick);
        List<NoteBean> unread_note_list = service.noteRecentList(note);

        return unread_note_list;
    }

}
