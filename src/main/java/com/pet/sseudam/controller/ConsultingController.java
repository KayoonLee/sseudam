package com.pet.sseudam.controller;

import com.pet.sseudam.model.CounselPaper;
import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.Pet;
import com.pet.sseudam.service.ConsultingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class ConsultingController {
    @Autowired
    private ConsultingService con;

    /*등록된 동물이 없을 시 동물 생성으로 이동 */
    @RequestMapping("hasAnimal")
    public String hasAnimal(HttpSession session) {
        // 나중에삭제해야함@@@@@@@@@@@@@@@@@@@@@@22
        session.setAttribute("g_id", 3);
        int g_id = (Integer) session.getAttribute("g_id");
        List<Pet> pet_list = con.find_pet(g_id);
        if (pet_list.isEmpty()) {
            //동물 생성으로 return or 동물 생성 칸으로 가야합니다.jsp 보내고 jsp에서 동물 생성칸???
            return "consulting/go_pet";

        }

        return "redirect:/choose_Counselor";
    }


    /* 상담사 예약으로 이동*/
    @RequestMapping("choose_Counselor")
    public String choose_Counselor(Model model) {
        //상담사 이름 modal 주입

        List<Member> con_names = con.find_counselor_name();
        model.addAttribute("con_names", con_names);

        return "consulting/choose_counselor";
    }

    /* 상담사 예약 시간으로 이동*/
    @RequestMapping("choose_Consult_Time")
    public String choose_Consult_Time(HttpSession session, Model model,
                                      @RequestParam("con_names") int con_id) {
        /* 받아온 상담사(member table name)이름과 구분 번호 일치한 c_id 찾는다.
            c_id의 상담예약서 request_time 값을 찾아낸다.
            세션에 로그인한 회원의 g_id의 상담예약서 request_time 값을 찾아낸다.
         */
        //상담사 데이터 전달
        Member member = con.find_counselor(con_id); //임시값 4 잘찍힘

        model.addAttribute("c_id", member.getM_id());
        model.addAttribute("con_name", member.getName());


        //일반회원 데이터 전달
        int g_id = (int) session.getAttribute("g_id");
        member = con.find_general(g_id);
        model.addAttribute("g_id", g_id);
        model.addAttribute("gen_name", member.getName());
        List<Pet> pet_list = con.find_pet(g_id);
        model.addAttribute("pet_list", pet_list);


        List<Date> reservation_time;
        reservation_time = con.find_reservation_time(g_id, con_id);
        for (Date c : reservation_time) {
            System.out.println(c);
        }
        model.addAttribute("reservation_time", reservation_time);


        return "consulting/insert_consult";
    }


    /*상담예약 폼 기록 */
    @RequestMapping("submit_Insert_Consult")
    public String submit_Insert_Consult(@RequestParam("g_id") int g_id,
                                        @RequestParam("c_id") int c_id,
                                        @RequestParam("request_times") String request_time,
                                        //@RequestParam("p_id")int p_id,
                                        CounselPaper counselpaper) {
        SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
        Date date = null;
        try {
            date = inputFormat.parse(request_time);
        } catch (ParseException e) {
            e.printStackTrace();
        }


        //counselpaper.setP_id(p_id);
        counselpaper.setC_id(c_id);
        counselpaper.setM_id(g_id);
        counselpaper.setRequest_time(date);
        con.insert_consult(counselpaper);

        return "redirect:/get_Consult_Details";

    }

    /*상세페이지로 이동 */
    @RequestMapping("get_Consult_Details")
    public String get_Consult_Details(HttpSession session, Model model)
                                  //    @RequestParam("paper_num") int paper_num,
                                //      @RequestParam("r_num") int r_num)
    {
           int paper_num = 1;
           int r_num = 4;

        //해당 일반 회원 검색
        int m_id = (int)session.getAttribute("g_id");
        Member member = con.find_general(m_id);
        CounselPaper counselpaper = con.find_consult(paper_num);
       //해당 상담사 회원 정보 검색
        Member counselor = con.find_general(counselpaper.getC_id());

        //해당 펫 조회
        Pet pet = con.select_pet(counselpaper.getP_id());
        if (member.getIdentifier() == 1) {  //일반 회원
            model.addAttribute("paper_num", paper_num);
            model.addAttribute("r_num", r_num);
            model.addAttribute("member", member);
            model.addAttribute("counselor", counselor);
            model.addAttribute("counselpaper", counselpaper);
            model.addAttribute("pet",pet);
            return "consulting/view_consult_gen";
        } else if (member.getIdentifier() == 2) {  //상담회원
            model.addAttribute("paper_num", paper_num);
            model.addAttribute("r_num", r_num);
            model.addAttribute("member", member);
            model.addAttribute("counselor", counselor);
            model.addAttribute("counselpaper", counselpaper);
            model.addAttribute("pet",pet);
            return "consulting/view_consult_con";
        }


        //나중에 오류 수정해야함
        return null;
    }

    /* 수정페이지로 이동(일반회원) */
    @RequestMapping("edit_Consult")
    public String edit_Consult(@RequestParam("paper_num") int paper_num,
                               Model model) {

        CounselPaper counselpaper = con.find_consult(paper_num);
        Member member = con.find_general(counselpaper.getM_id());
        Member counselor = con.find_general(counselpaper.getC_id());
        Pet pet = con.select_pet(counselpaper.getP_id());
        List<Pet> pet_list = con.find_pet(member.getM_id());

        model.addAttribute("member", member);
        model.addAttribute("counselor", counselor);
        model.addAttribute("counselpaper", counselpaper);
        model.addAttribute("pet",pet);
        model.addAttribute("pet_list",pet_list);


        return "consulting/edit_consult";
    }

    /* 수정페이지 업데이트 */
    @RequestMapping("update_Consult")
    public String update_Consult(@RequestParam("old_counselpaper") CounselPaper old_counselpaper,
                                 @RequestParam("g_id")int g_id,
                                 CounselPaper counselPaper) {
        counselPaper.setPaper_num(old_counselpaper.getPaper_num());
        counselPaper.setM_id(g_id);
        con.update_consult(counselPaper);
        System.out.println("닥치고 들어옴?");
        // 후....
        return  " redirect:/get_Consult_Details";
    }





}
