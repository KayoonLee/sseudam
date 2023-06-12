package com.pet.sseudam.controller;

import com.pet.sseudam.service.FreeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class FreeController {

    @Autowired
    private final FreeService service;

    public FreeController(FreeService service) {
        this.service = service;
    }

    // 테스트
    @GetMapping("home.do")
    public String home(HttpServletRequest request) {
        System.out.println("home.do 도착");
        HttpSession session = request.getSession();
        return "freeBoard/freeboard";
    }

    //자유게시판 목록
    @GetMapping("freeList")
    public String freeList(@RequestParam(value = "pageNum",
            required = false, defaultValue = "1") String pageNum, Model model) {

        System.out.println("freeList 진입");
        final int rowPerPage = 10;
// 정렬 관리
//        if (board.getSort() == null || board.getSort().equals("")) {
//            board.setSort("rnum");
//        }

        int currentPage = Integer.parseInt(pageNum);
//        int total = service.getTotal(board); // 검색
        //       System.out.println("total:" + total);

        //      System.out.println(total);
        System.out.println("rowPerPage" + rowPerPage);
        System.out.println("currentPage" + currentPage);

        int startRow = (currentPage - 1) * rowPerPage + 1;
        int endRow = startRow + rowPerPage - 1;
        //       PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
        System.out.println("startRow" + startRow);
        System.out.println("endRow" + endRow);

//        board.setSort(board.getSort());
//        board.setStartRow(startRow);
//        board.setEndRow(endRow);
        //       int number = total - startRow + 1;

        //      List<RecipeBoard> list = service.r_list(board);
//        System.out.println("list:" + list);
//
//        model.addAttribute("total", total);
//        model.addAttribute("pageNum", pageNum);
//        model.addAttribute("list", list);
//        model.addAttribute("number", number);
//        model.addAttribute("pp", pp);
//        model.addAttribute("category", board.getCategory());
//
//        // 검색
//        model.addAttribute("search", board.getSearch());
//        model.addAttribute("keyword", board.getKeyword());
        return "freeBoard/free_list";
    }

    // 글작성 폼
    @GetMapping("freeInsertForm")
    public String freeInsertForm() {
        System.out.println("freeInsertForm 진입확인");
        //       service.freeInsert();
        return "freeBoard/free_insert_form";
    }

    // 글작성
    @PostMapping("freeInsert")
    public String freeInsert(Model model) {
        System.out.println("freeInsert 진입확인");
        return "free_insert_result";
    }

    // 글수정 폼
    @GetMapping("freeUpdateForm")
    public String freeUpdateForm() {
        return "freeBoard/free_update_form";
    }

    // 글수정
    @PostMapping("freeUpdate")
    public String freeUpdate() {
        return "freeBoard/free_update_result";
    }

    // 글삭제
    @GetMapping("freeDelete")
    public String freeDelete() {
        return "freeBoard/free_delete_result";
    }

}
