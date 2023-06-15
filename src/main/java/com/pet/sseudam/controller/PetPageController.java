package com.pet.sseudam.controller;

import com.pet.sseudam.model.PetBean;
import com.pet.sseudam.service.PagingPgm;
import com.pet.sseudam.service.PetPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class PetPageController {

    @Autowired
    private PetPageService pps;

    // 나의 반려동물 목록
    @GetMapping("memberpage_mypet")
    public String memberPagePet(String pageNum, PetBean pet, Model model) throws Exception {
        System.out.println("동물페이지로 진입성공");

        // 동물 목록 불러오기
        final int rowPerPage = 12;
        if (pageNum == null || pageNum.equals("")) {
            pageNum = "1";
        }
        int currentPage = Integer.parseInt(pageNum);
        int total = pps.getTotal(pet);

        int startRow = (currentPage - 1) * rowPerPage + 1;
        int endRow = startRow + rowPerPage - 1;
        PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
        pet.setStartRow(startRow);
        pet.setEndRow(endRow);
        int number = total - startRow + 1;

        List<PetBean> list = pps.p_list(pet);
        model.addAttribute("total", total);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("list", list);
        model.addAttribute("number", number);
        model.addAttribute("pp", pp);

        System.out.println("동물 목록출력 성공");
        return "memberPage/memberpage_mypet";
    }

   /* // 동물 추가(여기부터)
    @RequestMapping(value="p_insert", method= RequestMethod.POST)
    public String petInsert(PetBean pet, Model model){
        System.out.println("동물추가 성공");
        return "memberPage/memberpage_mypet";
    }*/


    // 동물 상세페이지
    @RequestMapping("/memberpage_petview")
    public String petView( Integer p_id, Model model, String pageNum) {
        System.out.println("동물 상세페이지");

            PetBean pet = pps.p_select(p_id);   // 상세정보구하기
            model.addAttribute("pageNum", pageNum);
            model.addAttribute("pet", pet);
            System.out.println("여기까지");
            return "memberPage/memberpage_petview";

    }

    // 동물 수정폼
    @RequestMapping("/memberpage_petupdate.do")
    public String petUpdateForm(Integer p_id, Model model, String pageNum){
        System.out.println("동물 수정페이지");

        PetBean pet = pps.p_select(p_id);   // 상세정보구하기
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("pet", pet);
        return "memberPage/memberpage_petupdate";
    }

    // 동물 수정
    @RequestMapping("petupdate")
    public String petUpdate(PetBean pet, String pageNum, Model model){

        System.out.println("p_id:"+pet.getP_id());
        System.out.println("birth:"+pet.getBirth());

        int result = pps.p_update(pet);
        if(result == 1) System.out.println("동물 수정 성공");
        model.addAttribute("result", result);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("p_id", pet.getP_id());
        return "memberPage/petupdate";
    }

    // 동물 추가폼
    @RequestMapping("memberpage_petadd")
    public String petAddForm(){
        return "memberPage/memberpage_petadd";
    }


    // 동물 추가
    @RequestMapping("petadd")
    public String petAdd(PetBean pet, Model model){
        int result = pps.p_insert(pet);
        if(result == 1) System.out.println("동물 추가 성공");
        model.addAttribute("result", result);
        return "memberPage/petadd";
    }


}
