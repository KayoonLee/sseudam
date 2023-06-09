package com.pet.sseudam.controller;

import com.pet.sseudam.model.*;
import com.pet.sseudam.service.ConsultingService;
import com.pet.sseudam.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

@Controller
public class ConsultingController {

    @Autowired
    private ConsultingService con;
    @Autowired
    private MemberService ms;

    /*등록된 동물이 없을 시 동물 생성으로 이동 */
    @RequestMapping("hasAnimal")
    public String hasAnimal(HttpSession session) {

        Member member = (Member) session.getAttribute("member");
        int g_id = member.getM_id();
        System.out.println(g_id);
        List<PetBean> pet_list = con.find_pet(g_id);
        if (pet_list.isEmpty()) {
            return "consulting/go_pet";
        }

        return "redirect:/choose_Counselor";
    }

//세욱
// 상담신청 - 상담사 선택
    /* 상담사 예약으로 이동*/
    @RequestMapping("choose_Counselor")
    public String choose_Counselor(Model model,Member member) {
        //상담사 이름 model 주입

//        List<Member> con_names = con.find_counselor_name();
//        model.addAttribute("con_names", con_names);
        List<Member> counselorList = ms.counselorList(member);
        System.out.println("counselor list:"+counselorList);

        model.addAttribute("counselorList", counselorList);


        return "consulting/choose_counselor";
    }

    /* 상담사 예약 시간으로 이동*/
    @RequestMapping("choose_Consult_Time")
    public String choose_Consult_Time(HttpSession session, Model model,
                                      @RequestParam("m_id") int con_id) {
        /* 받아온 상담사(member table name)이름과 구분 번호 일치한 c_id 찾는다.
            c_id의 상담예약서 request_time 값을 찾아낸다.
            세션에 로그인한 회원의 g_id의 상담예약서 request_time 값을 찾아낸다.
         */
        //상담사 데이터 전달
        Member counselor = con.find_counselor(con_id); //임시값 4 잘찍힘

        model.addAttribute("c_id", counselor.getM_id());
        model.addAttribute("con_name", counselor.getName());


        //일반회원 데이터 전달
        Member member = (Member) session.getAttribute("member");

        model.addAttribute("g_id", member.getM_id());
        model.addAttribute("gen_name", member.getName());
        List<PetBean> pet_list = con.find_pet(member.getM_id());
        model.addAttribute("pet_list", pet_list);
        System.out.println(pet_list);
        int g_id = member.getM_id();

        List<Date> reservation_time;
        reservation_time = con.find_reservation_time(member.getM_id(), con_id);
        for (Date c : reservation_time) {
            System.out.println(c);
        }

        model.addAttribute("reservation_time", reservation_time);
        model.addAttribute("nowtime", con.now_time());
        System.out.println(con.now_time());


        return "consulting/insert_consult";
    }


    /*상담예약 폼 기록  신진우 수정중 */
    @RequestMapping("submit_Insert_Consult")
    public String submit_Insert_Consult(@RequestParam("g_id") int g_id,
                                        @RequestParam("c_id") int c_id,
                                        @RequestParam("request_times") String request_times,
                                        
                                        Model model,

                                        CounselPaper counselpaper) {

        long timestamp = Long.parseLong(request_times);
        Date date = new Date(timestamp);

//        // Request Time 조회용 List
//        List<Date> reservation_time;
//        reservation_time = con.find_reservation_time(g_id, c_id);
//
//        for (Date c : reservation_time) {
//            System.out.println("시간목록" + c);
//            System.out.println(c.equals(date));
//
//
//            if(counselpaper.getState() != 1) {
//
//                if (c.equals(date)) {
//                    counselpaper.setState(1);
//                    model.addAttribute("useCheck", counselpaper.getState());
//                    return "redirect:submit_Insert_Consult";              // 1= 중복
//
//                } else {
//                    counselpaper.setState(-1);     // -1 통과
//                }
//
//            }

//        }

//        model.addAttribute("reservation_time", reservation_time);

        System.out.println("중복체크 1 or -1 : " + counselpaper.getState());
        model.addAttribute("useCheck", counselpaper.getState());

        counselpaper.setC_id(c_id);
        counselpaper.setM_id(g_id);
        counselpaper.setRequest_time(date);
        con.insert_consult(counselpaper);

        return "redirect:/memberpage_mypaper";

    }

    /*상세페이지로 이동 */
    @RequestMapping("get_Consult_Details")
    public String get_Consult_Details(HttpSession session, Model model , @RequestParam("paper_num") int paper_num)
    //      @RequestParam("r_num") int r_num)
    {
        //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ 임의값 나중에 삭제해야함.
        int r_num = 4;

        //해당 일반 회원 검색


        Member sessionmember = (Member) session.getAttribute("member");
        CounselPaper counselpaper = con.find_consult(paper_num);
        Member member = con.find_general(counselpaper.getM_id());
        //해당 상담사 회원 정보 검색
        Member counselor = con.find_general(counselpaper.getC_id());
        System.out.println(member);
        System.out.println(counselor);
        //해당 펫 조회
        PetBean pet = con.select_pet(counselpaper.getP_id());
        if (sessionmember.getIdentifier().equals("1")) {  //일반 회원
            model.addAttribute("paper_num", paper_num);
            model.addAttribute("r_num", r_num);
            model.addAttribute("genconsult", member);
            model.addAttribute("counselor", counselor);
            model.addAttribute("counselpaper", counselpaper);
            model.addAttribute("pet", pet);
            return "consulting/view_consult_gen";
        } else if (sessionmember.getIdentifier().equals("2")) {  //상담회원
            model.addAttribute("paper_num", paper_num);
            model.addAttribute("r_num", r_num);
            model.addAttribute("genconsult", member);
            model.addAttribute("counselor", counselor);
            model.addAttribute("counselpaper", counselpaper);
            model.addAttribute("pet", pet);
            return "consulting/view_consult_con";
        }


        //나중에 오류 수정해야함
        return null;
    }

    /* 수정페이지로 이동(일반회원) */ // 세욱 수정
    @RequestMapping("edit_Consult")
    public String edit_Consult(@RequestParam("paper_num") int paper_num,
                               Model model) {


        CounselPaper counselpaper = con.find_consult(paper_num);

        Member member = con.find_general(counselpaper.getM_id());
        Member counselor = con.find_general(counselpaper.getC_id());
        PetBean pet = con.select_pet(counselpaper.getP_id());
        List<PetBean> pet_list = con.find_pet(member.getM_id());


        model.addAttribute("gen", member);
        model.addAttribute("counselor", counselor);
        model.addAttribute("counselpaper", counselpaper);
        model.addAttribute("pet", pet);
        model.addAttribute("pet_list", pet_list);


        return "consulting/edit_consult";
    }

    /* 수정페이지 업데이트 */
    @RequestMapping("update_Consult")
    public String update_Consult(@RequestParam("paper_num") int paper_num,
                                 @RequestParam("g_id") int g_id,
                                 @RequestParam("request_times") String request_time,
                                 CounselPaper counselpaper) {
        System.out.println("update_Consult 진입");
        long timestamp = Long.parseLong(request_time);
        Date date = new Date(timestamp);

        counselpaper.setPaper_num(paper_num);
        counselpaper.setM_id(g_id);
        counselpaper.setRequest_time(date);
        con.update_consult(counselpaper);


        return "redirect:/get_Consult_Details?paper_num=" + paper_num;
    }

    /*예약서삭제*/
    @RequestMapping("delete_Consult")
    public String delete_Consult(@RequestParam("paper_num") int paper_num,HttpSession session) {
        con.delete_consult(paper_num);
        Member member = (Member) session.getAttribute("member");
        if(member.getIdentifier().equals("1")){

            return "consulting/complete_delete_consult_m";
        } else if (member.getIdentifier().equals("2")) {
            return "consulting/complete_delete_consult_c";

        }else
        return "main_page";
    }

    /* 상담 수락*/      //신진우수정
    @RequestMapping("accept_Consult")
    public String accept_Consult(@RequestParam("paper_num") int paper_num, Model model) {
        con.accept_consult(paper_num);
        
        model.addAttribute("paper_num", paper_num);
        return "consulting/complete_accept_consult";
    }

    /*기록서 작성 폼으로 */
    @RequestMapping("write_Consulting")
    public String write_Consulting(@RequestParam("paper_num") int paper_num, Model model) {
        /* 해당 상담예약서를 클릭 했을때 paper_num이 넘어옴  상담서에 들어갈껀 동물 이름, 회원 이름,
        상담사 이름, 상담제목 상담주제, 상담기록, 상담현황, 특이사항*/

        CounselPaper counselpaper = con.find_consult(paper_num);
        Member counselor = con.find_counselor(counselpaper.getC_id());
        Member member = con.find_general(counselpaper.getM_id());
        PetBean pet = con.select_pet(counselpaper.getP_id());
        String time = con.now_time();

        model.addAttribute("time", time);
        model.addAttribute("counselor", counselor);
        model.addAttribute("counselpaper", counselpaper);
        model.addAttribute("gen", member);
        model.addAttribute("pet", pet);

        return "consulting/write_consulting";
    }
    /*기록서 insert*/
    @RequestMapping("insert_Consulting")
    public String insert_Consulting(@RequestParam("consulting_dates") String consulting_dates,
                                    @RequestParam("old_paper_num") int old_paper_num,
                                    @RequestParam("old_p_id") int old_p_id,
                                    @RequestParam("old_m_id") int old_m_id,
                                    @RequestParam("old_c_id") int old_c_id,
                                    CounselRecord counselrecord) {
        System.out.println(consulting_dates);
        counselrecord.setPaper_num(old_paper_num);
        counselrecord.setP_id(old_p_id);
        counselrecord.setM_id(old_m_id);
        counselrecord.setC_id(old_c_id);

        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date consulting_date;
        try {
            consulting_date = dateFormat.parse(consulting_dates);
            System.out.println("Consulting Date: " + consulting_date);
            counselrecord.setConsulting_date(consulting_date);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        con.replied_consult(old_paper_num);
        con.insert_consulting(counselrecord);


        return "redirect:/counselorpage_record";
        /* 나중에 상담기록서 리스트로 전달할 예정. */
    }

    /*상담사 마이페이지에서 기록서 클릭했을 때 */
    @RequestMapping("get_Consulting_Details")
    public String get_Consulting_Details(
            @RequestParam("record_num") int record_num,
            Model model
    ) {
        CounselRecord counselrecord = con.select_counsel_record(record_num);
        Member counselor = con.find_general(counselrecord.getC_id());
        Member gen = con.find_general(counselrecord.getM_id());
        PetBean pet = con.select_pet(counselrecord.getP_id());
        model.addAttribute("counselrecord", counselrecord);
        model.addAttribute("counselor", counselor);
        model.addAttribute("gen", gen);
        model.addAttribute("pet", pet);
        return "consulting/view_consulting";
    }

    @RequestMapping("edit_Consulting")
    public String edit_Consulting(@RequestParam("record_num") int record_num, Model model) {


        CounselRecord counselrecord = con.select_counsel_record(record_num);
        Member counselor = con.find_general(counselrecord.getC_id());
        Member gen = con.find_general(counselrecord.getM_id());
        PetBean pet = con.select_pet(counselrecord.getP_id());
        model.addAttribute("counselrecord", counselrecord);
        model.addAttribute("counselor", counselor);
        model.addAttribute("gen", gen);
        model.addAttribute("pet", pet);


        return "consulting/edit_consulting";
    }

    @RequestMapping("delete_Consulting")
    public String delete_Consulting(@RequestParam("record_num") int record_num) {
        con.delete_consulting(record_num);
        return "counselorpage_record";
    }

    @RequestMapping("update_Consulting")
    public String update_Consulting(@RequestParam("record_num") int record_num,@RequestParam("consulting_dates") String consulting_dates,
                                    CounselRecord counselrecord) {
        System.out.println("처음 진입시 condate:"+ consulting_dates);


        // 포맷터
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:00");
        DateTimeFormatter formattertemp = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:00");
        System.out.println("중간 condate:"+ consulting_dates);

        // 문자열 -> Date
        LocalDateTime datetime = LocalDateTime.parse(consulting_dates, formatter);

        System.out.println(datetime); // 2021-06-19T21:05:07
        String datetimeString = datetime.format(formattertemp);

        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:00");
        Date date = null;
        try {
            /*  yyyy-MM-dd'T'HH:mm ->  yyyy-MM-dd HH:mm -> yyyy-MM-dd HH:00 */


            date = outputFormat.parse(datetimeString);
            System.out.println(date);
            counselrecord.setConsulting_date(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println("마지막 condate:"+ consulting_dates);
        System.out.println(date);
        System.out.println(counselrecord);





        con.update_consulting(record_num);
        return "counselorpage_record";
    }


}
