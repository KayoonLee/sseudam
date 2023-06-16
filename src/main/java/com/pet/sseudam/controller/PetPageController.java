package com.pet.sseudam.controller;

import com.pet.sseudam.model.PetBean;
import com.pet.sseudam.model.ProfileBean;
import com.pet.sseudam.service.PagingPgm;
import com.pet.sseudam.service.PetPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Controller
public class PetPageController {

    @Autowired
    private PetPageService pps;

    // 나의 반려동물 목록
    // 주석
    @GetMapping("memberpage_mypet")
    public String memberPagePet(String pageNum, PetBean pet, Model model, HttpSession session) throws Exception {
        System.out.println("동물페이지로 진입성공");

        // 회원정보 가져오기
        String g_id = (String) session.getAttribute("g_id");

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

        System.out.println("list "+list);

        model.addAttribute("total", total);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("list", list);
        model.addAttribute("number", number);
        model.addAttribute("pp", pp);

        System.out.println("동물 목록출력 성공");
        return "memberPage/memberpage_mypet";
    }


    // 동물 상세페이지
    @RequestMapping("/memberpage_petview")
    public String petView(Integer p_id, Model model, String pageNum, ProfileBean profile_board, HttpSession session) {
        System.out.println("동물 상세페이지");

           PetBean pet = pps.p_select(p_id);   // 상세정보구하기

        List<ProfileBean> profile_list = pps.profileView(pet.getProfile_num());

        model.addAttribute("pageNum", pageNum);
        model.addAttribute("pet", pet);
        model.addAttribute("profile_list", profile_list);

        System.out.println("여기까지");
        return "memberPage/memberpage_petview";

    }

    // 동물 수정폼
    @RequestMapping("/memberpage_petupdate.do")
    public String petUpdateForm(Integer p_id, Model model, String pageNum, HttpSession session) {
        System.out.println("동물 수정페이지");

        PetBean pet = pps.p_select(p_id);   // 상세정보구하기

        model.addAttribute("pet", pet);
        model.addAttribute("pageNum", pageNum);
        return "memberPage/memberpage_petupdate";
    }

    // 동물 수정
    @RequestMapping("petupdate")
    public String petUpdate(HttpServletRequest request, ProfileBean profile_board, PetBean pet, Model model, MultipartFile mf) {

        System.out.println("동물 수정 성공");

        String filename = mf.getOriginalFilename();
        int size = (int)mf.getSize();

        //파일 첨부 관련
        if (size > 0) {
            System.out.println("수정할 파일이 있습니다");

            String file_path = request.getRealPath("petimg");
            System.out.println("file_path는 " + file_path);
            System.out.println("filename은 " + filename);

            //이전 실제 첨부파일 삭제
            List<ProfileBean> old_filelist = pps.profileList(profile_board);

            for(int j=0; j< old_filelist.size(); j++){
                String real_name = old_filelist.get(j).getProfile_name();
                System.out.println("삭제할 파일 경로" + file_path + "/" + real_name);
                File real_file =new File(file_path + "/" + real_name);
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

            profile_board.setProfile_origin(filename);
            profile_board.setProfile_name(new_filename);


            int count = pps.profileUpdate(profile_board);

            if(count==1){
                System.out.println("첨부파일 수정 성공");
            }

            int result = pps.p_update(pet);
            if (result == 1) System.out.println("동물 수정 성공");
            model.addAttribute("result", result);
            model.addAttribute("p_id", pet.getP_id());


        }

        return "memberPage/petupdate";
    }

    // 동물 추가폼(완료)
    @RequestMapping("memberpage_petadd")
    public String petAddForm() {
        return "memberPage/memberpage_petadd";
    }


    // 동물 추가(완료)
    @RequestMapping("petadd")
    public String petAdd(HttpServletRequest request, PetBean pet, ProfileBean profile_board, Model model, @RequestParam("files") MultipartFile mf) throws Exception {

        // 세션 확인
//        HttpSession session = request.getSession();
//        int g_id = (int) session.getAttribute("g_id");
//        pet.setG_id(g_id);

        // 파일 첨부 관련
        String filename = mf.getOriginalFilename();
        int size = (int)mf.getSize();

        if (size > 0) {
            System.out.println("첨부할 프로필사진이 있습니다");

            int max_num = pps.getMaxnum() + 1;
            System.out.println("수정후 max_num: " + max_num);

            String file_path = request.getRealPath("petimg");
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

            profile_board.setProfile_num(max_num);
            profile_board.setProfile_origin(filename);
            profile_board.setProfile_name(new_filename);

            int count = pps.profileAdd(profile_board);
            if(count==1){
                System.out.println("업로드 성공");

            }

            pet.setProfile_num(max_num);
        }

        int result = pps.p_insert(pet);
        if (result == 1) System.out.println("동물 추가 성공");
        model.addAttribute("result", result);
        return "memberPage/petadd";
    }


}
