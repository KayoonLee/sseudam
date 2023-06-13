package com.pet.sseudam.controller;

import com.pet.sseudam.model.FreeBean;
import com.pet.sseudam.model.ImgBean;
import com.pet.sseudam.model.RecomBean;
import com.pet.sseudam.model.ReportBean;
import com.pet.sseudam.service.FreeService;
import com.pet.sseudam.service.PagingPgm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
public class FreeController {

    @Autowired
    private final FreeService service;

    public FreeController(FreeService service) {
        this.service = service;
    }


    @GetMapping("home.do")
    public String home(HttpServletRequest request) {
        System.out.println("home.do 도착");

        HttpSession session = request.getSession();
        session.setAttribute("m_id", 1);

        return "freeBoard/freeboard";
    }

    //자유게시판 목록
    @GetMapping("freeList")
    public String freeList(@RequestParam(value = "pageNum",
            required = false, defaultValue = "1") String pageNum,
                           @RequestParam(value = "category",
                            required = false, defaultValue = "0") String categoryStr,
                           FreeBean fboard, Model model) {

        System.out.println("freeList 진입");

// 정렬 관리
        if (fboard.getSort() == null || fboard.getSort().equals("")) {
            fboard.setSort("board_num");
        }

        try {
            int category = Integer.parseInt(categoryStr);
            fboard.setCategory(category);
        } catch (NumberFormatException e) {
            // category 값을 정수로 변환할 수 없는 경우 예외 처리
            fboard.setCategory(0); // 기본값으로 0 설정
        }
        final int rowPerPage = 10;

        int currentPage = Integer.parseInt(pageNum);
        int total = service.getTotal(fboard); // 검색
        System.out.println("total:" + total);

        System.out.println(total);
        System.out.println("rowPerPage" + rowPerPage);
        System.out.println("currentPage" + currentPage);

        int startRow = (currentPage - 1) * rowPerPage;
        int endRow = startRow + rowPerPage;
        PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
        System.out.println("startRow" + startRow);
        System.out.println("endRow" + endRow);

        fboard.setSort(fboard.getSort());
        fboard.setStartRow(startRow);
        fboard.setEndRow(endRow);
        int number = total - startRow;

        List<FreeBean> list = service.f_list(fboard);
        System.out.println("list:" + list);

        model.addAttribute("num", fboard.getNum());
        model.addAttribute("category", fboard.getCategory());
        model.addAttribute("total", total);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("list", list);
        model.addAttribute("number", number);
        model.addAttribute("pp", pp);
        // 검색

        return "freeBoard/free_list";
    }

    // 글작성 폼
    @GetMapping("freeInsertForm")
    public String freeInsertForm() {

        System.out.println("freeInsertForm 진입확인");

        return "freeBoard/free_insert_form";
    }

    // 글작성
    @PostMapping("freeInsert")
    public String freeInsert(HttpServletRequest request, FreeBean fboard, ImgBean img_board,
                             MultipartHttpServletRequest mhr, Model model) {

        System.out.println("freeInsert 진입확인");

        HttpSession session = request.getSession();
        int m_id = (int) session.getAttribute("m_id");
        fboard.setM_id(m_id);

        //파일 첨부 관련
        List<MultipartFile> file_list = mhr.getFiles("files");
        String multi_path = request.getRealPath("img");
        System.out.println("multi_path는 " +multi_path);

        int i = 1;
        int max_num = service.getMaxnum() + 1;

        for(MultipartFile mf : file_list){
            String multi_filename =mf.getOriginalFilename();

            String extension = multi_filename.substring(multi_filename.lastIndexOf("."));
            UUID uuid =UUID.randomUUID();

            String new_multi_filename = uuid.toString().replace("-", "") + extension;

            System.out.println("multi_filename: " + multi_filename);
            System.out.println("new_multi_filename: " + new_multi_filename);

            try{
                mf.transferTo(new File(multi_path + "/" + new_multi_filename));
            }catch(Exception e){
                e.getMessage();
            }

            img_board.setFile_num(max_num);
            img_board.setFile_serial(i);
            img_board.setFile_origin(multi_filename);
            img_board.setFile_name(new_multi_filename);

            int count = service.imgAdd(img_board);
            System.out.println(i + "번째 파일 업로드");
            i++;
        }

        fboard.setFile_num(max_num);

        int result = service.fInsert(fboard);

        model.addAttribute("result", result);
        model.addAttribute("num", fboard.getNum());

        return "freeBoard/free_insert_result";
    }

    // 글조회
    @GetMapping("freeView")
    public String freeView(FreeBean freeboard, String pageNum, Model model) {

        System.out.println("freeView 진입확인");

        service.fUpdateReadcount(freeboard);

        FreeBean fboard = service.fView(freeboard);

        List<ImgBean> img_list = service.imgView(fboard.getFile_num());

        System.out.println("fboard :" + fboard);

        model.addAttribute("fboard", fboard);
        model.addAttribute("img_list", img_list);
        model.addAttribute("pageNum", pageNum);

        return "freeBoard/free_view";
    }

    // 글수정 폼
    @GetMapping("freeUpdateForm")
    public String freeUpdateForm(FreeBean fboard, Model model) {

        System.out.println("freeInsert 진입확인");

        fboard = service.fView(fboard);

        model.addAttribute("fboard", fboard);

        return "freeBoard/free_update_form";
    }

    // 글수정
    @PostMapping("freeUpdate")
    public String freeUpdate(FreeBean fboard, Model model) {

        System.out.println("freeInsert 진입확인");

        int result = service.fUpdate(fboard);

        model.addAttribute("result", result);
        model.addAttribute("num", fboard.getNum());

        return "freeBoard/free_update_result";
    }

    // 글삭제
    @PostMapping("freeDelete")
    @ResponseBody
    public int freeDelete(FreeBean fboard, Model model) {

        System.out.println("freeInsert 진입확인");

        int result = service.fDelete(fboard);

        model.addAttribute("result", result);
        model.addAttribute("num", fboard.getNum());

        return result;
    }

    //글 추천
    @PostMapping("recomBoard")
    public String recomBoard(RecomBean recomb) {

        int check = service.recomCheck(recomb);

        int num = recomb.getNum();
        int board_num = recomb.getBoard_num();
        int m_id = recomb.getM_id();

        if (check == 0) {
            int result = service.recomAdd(recomb);
            int count = service.recomPlus(recomb);
        } else {
            int result = service.recomRemove(recomb);
            int count = service.recomMinus(recomb);
        }

        return "redirect:recomCount?num=" + num + "&board_num=" + board_num;
    }

    //추천수
    @GetMapping("recomCount")
    @ResponseBody
    public int recomCount(RecomBean recomb) {

        int count = service.recomCount(recomb);

        return count;
    }

    //글 신고

    @PostMapping("reportBoard")
    @ResponseBody
    public int reportBoard(ReportBean reportboard){

        int check = service.reportCheck(reportboard);

        return check;
    }

   //글 신고폼
    @GetMapping("reportAddForm")
    public String reportAddForm(ReportBean reportboard, Model model){

        model.addAttribute("reportboard", reportboard);

        return "freeBoard/report_add";
    }

    //글 신고추가
    @PostMapping("reportAdd")
    public String reportAdd(ReportBean reportboard,Model model){

        int result = service.reportPlus(reportboard);

        model.addAttribute("result",result);

        return "freeBoard/report_result";
    }

}
