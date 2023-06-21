package com.pet.sseudam.controller;

import com.pet.sseudam.model.ImgBean;
import com.pet.sseudam.model.ReFreeBean;
import com.pet.sseudam.service.FreeReplyService;
import com.pet.sseudam.service.FreeReplyServiceImpl;
import com.pet.sseudam.service.FreeService;
import com.pet.sseudam.service.PagingPgm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
public class FreeReplyController {

    @Autowired
    private final FreeReplyService reService;
    private final FreeService service;

    public FreeReplyController(FreeReplyService reService, FreeReplyServiceImpl service, FreeService service1) {
        this.reService = reService;
        this.service = service1;
    }

    // 댓글 목록 구하기
    @GetMapping("FreeReList")
    public String FreeReList(@RequestParam(value = "rpageNum", required = false, defaultValue = "1") String rpageNum,
                             String pageNum,
                             ReFreeBean reBoard, Model model) throws Exception {

        System.out.println("FreeReList 도착");
        System.out.println("rpageNum=" + rpageNum);

        final int rowPerPage = 10;

        int currentPage = Integer.parseInt(rpageNum);

        int total = reService.getTotalRe(reBoard);

        System.out.println("total:" + total);
        System.out.println("rowPerPage" + rowPerPage);
        System.out.println("currentPage" + currentPage);

        int startRow = (currentPage - 1) * rowPerPage;
        //     int endRow = startRow + rowPerPage;
        PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);

        reBoard.setStartRow(startRow);
        System.out.println("startRow" + startRow);
        //      reBoard.setEndRow(endRow);
        //      System.out.println("endRow" + endRow);
        int number = total - startRow;

        List<ReFreeBean> reList = reService.re_list(reBoard);        // 댓글목록 구해오기
        System.out.println("reList" + reList);

        model.addAttribute("reList", reList);
        model.addAttribute("num", reBoard.getNum());
        model.addAttribute("board_num", reBoard.getBoard_num());
        model.addAttribute("rpageNum", rpageNum);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("total", total);
        model.addAttribute("pp", pp);

        // slist.jsp 파일에 출력되는 결과가 callback함수로 리턴된다.
        return "freeBoard/re_free_list";
    }

    // 댓글 작성
    @PostMapping("FreeReInsert")
    @ResponseBody
    public int FreeReInsert(ReFreeBean reBoard, @RequestParam("files") MultipartFile mf, ImgBean img_board,
                            HttpServletRequest request) throws Exception {

        System.out.println("FreeReInsert 진입");

        String filename = mf.getOriginalFilename();
        int size = (int) mf.getSize();
        //파일 첨부 관련
        if (size > 0) {
            System.out.println("첨부할 댓글파일이 있습니다");

            int max_num = service.getMaxnum() + 1;

            String file_path = request.getRealPath("img");
            System.out.println("file_path는 " + file_path);
            System.out.println("filename은 " + filename);

            String extension = filename.substring(filename.lastIndexOf("."));
            UUID uuid = UUID.randomUUID();

            String new_filename = uuid.toString().replace("-", "") + extension;

            System.out.println("filename: " + filename);
            System.out.println("new_filename: " + new_filename);

            try {
                mf.transferTo(new File(file_path + "/" + new_filename));
            } catch (Exception e) {
                e.getMessage();
            }

            img_board.setFile_num(max_num);
            img_board.setFile_serial(1);
            img_board.setFile_origin(filename);
            img_board.setFile_name(new_filename);

            int count = service.imgAdd(img_board);
            if (count == 1) {
                System.out.println("업로드 성공");
            }

            reBoard.setFile_num(max_num);
        }


        System.out.println(reBoard.getNum());
        System.out.println(reBoard.getBoard_num());
        System.out.println(reBoard.getM_id());
        System.out.println(reBoard.getRe_content());
        System.out.println(reBoard.getFile_num());
        System.out.println(reBoard.getRe_reg_date());
        System.out.println(reBoard.getRef());
        System.out.println(reBoard.getRe_seq());
        System.out.println(reBoard.getRe_lev());
        System.out.println(reBoard.getRe_state());

        int result = reService.re_insert(reBoard);

        if (result == 1) {
            System.out.println("댓글입력성공");
        }
        return result;
    }

    // 댓글 수정
    @PostMapping("FreeReUpdate")
    public String FreeReUpdate(ReFreeBean reBoard, @RequestParam("files") MultipartFile mf, ImgBean img_board,
                               HttpServletRequest request) {

        System.out.println("repUpdate.do 진입");

        String filename = mf.getOriginalFilename();
        int size = (int) mf.getSize();

        //파일 첨부 관련
        if (size > 0) {
            System.out.println("수정할 파일이 있습니다");

            String file_path = request.getRealPath("img");
            System.out.println("file_path는 " + file_path);
            System.out.println("filename은 " + filename);

            //이전 실제 첨부파일 삭제
            List<ImgBean> old_filelist = service.imgList(img_board);

            for (int j = 0; j < old_filelist.size(); j++) {
                String real_name = old_filelist.get(j).getFile_name();
                System.out.println("삭제할 파일 경로" + file_path + "/" + real_name);
                File real_file = new File(file_path + "/" + real_name);
                real_file.delete();
            }

            String extension = filename.substring(filename.lastIndexOf("."));
            UUID uuid = UUID.randomUUID();

            String new_filename = uuid.toString().replace("-", "") + extension;

            System.out.println("filename: " + filename);
            System.out.println("new_filename: " + new_filename);

            try {
                mf.transferTo(new File(file_path + "/" + new_filename));
            } catch (Exception e) {
                e.getMessage();
            }

            img_board.setFile_origin(filename);
            img_board.setFile_name(new_filename);

            int count = service.imgUpdate(img_board);

            if (count == 1) {
                System.out.println("첨부파일 수정 성공");
            }

        }

        reService.update(reBoard);            // 댓글 update SQL문 실행

        int num = reBoard.getNum();
        int board_num = reBoard.getBoard_num();

        // 댓글을 update한 후에 댓글목록을 요청한다.
        return "redirect:FreeReList?num=" + num + "&board_num=" + board_num;
    }

    // 댓글 삭제
    @PostMapping("FreeReDelete")
    public String FreeReDelete(ReFreeBean reBoard, HttpServletRequest request, Model model) throws IOException {

        System.out.println("FreeReDelete 진입");

        int num = reBoard.getNum();
        int board_num = reBoard.getBoard_num();
        System.out.println("num은" + num);
        System.out.println("board_num은" + board_num);

        int result = reService.re_delete(reBoard);

        // 댓글을 delete 한후에 댓글목록을 요청한다.
        return "redirect:FreeReList?num=" + num + "&board_num=" + board_num;
    }


}