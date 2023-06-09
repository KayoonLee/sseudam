package com.pet.sseudam.controller;

import com.pet.sseudam.model.Member;
import com.pet.sseudam.model.PetBean;
import com.pet.sseudam.model.ProfileBean;
import com.pet.sseudam.service.PagingPgm;
import com.pet.sseudam.service.PetPageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

@Controller
public class PetPageController {

    @Autowired
    private PetPageService pps;

    // 나의 반려동물 목록
    // 주석
    @GetMapping("memberpage_mypet")
    public String memberPagePet(String pageNum, PetBean pet, Model model, HttpSession session, Member member) throws Exception {
        System.out.println("동물페이지로 진입성공");

        Member mem = (Member) session.getAttribute("member");
        pet.setG_id(mem.getM_id());
        System.out.println("G_id:"+ pet.getG_id());

        // 회원정보 가져오기


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

        //해당 회원의 동물을 리스트에 넣는다
        List<PetBean> list = pps.p_list(pet);

        System.out.println("pet.getProfile_num():" + pet.getProfile_num());
        System.out.println("list "+list);
        System.out.println("pet.getProfile_num():" + pet.getProfile_num());

        model.addAttribute("total", total);
        model.addAttribute("pageNum", pageNum);
        model.addAttribute("list", list);
        model.addAttribute("number", number);
        model.addAttribute("pp", pp);
        model.addAttribute("pet", pet);
        model.addAttribute("member", member);

        System.out.println("동물 목록출력 성공");
        return "memberPage/memberpage_mypet";
    }


    // 동물 상세페이지
    @RequestMapping("/memberpage_petview")
    public String petView(@RequestParam("p_id")int p_id, Model model, String pageNum, HttpSession session, ProfileBean profile_board) {
        System.out.println("동물 상세페이지");

        PetBean pet = pps.p_select(p_id);   // 상세정보구하기

        System.out.println("pet:" + pet);
        System.out.println("상세정보 구하기 성공");
        System.out.println("이미지도 구해옴");

        LocalDate now = LocalDate.now();
        int currentYear = now.getYear();

        LocalDate birthDate = LocalDate.parse(pet.getBirth());  // String을 LocalDate로 변환
        int birthYear = (currentYear - birthDate.getYear()) + 1;
        System.out.println("birthYear : " + birthYear);

        model.addAttribute("birthYear", birthYear);
        model.addAttribute("pet", pet);
        model.addAttribute("pageNum", pageNum);

        System.out.println("pet이랑 pageNum");

        return "memberPage/memberpage_petview";

    }

    // 동물 수정폼
    @RequestMapping("/memberpage_petupdate.do")
    public String petUpdateForm(int p_id, Model model, String pageNum, HttpSession session) {
        System.out.println("동물 수정페이지");

        PetBean pet = pps.p_select(p_id);   // 상세정보구하기
        System.out.println("pet:" + pet);

        model.addAttribute("pet", pet);
        model.addAttribute("pageNum", pageNum);


        return "memberPage/memberpage_petupdate";
    }

    // 여기까지 성공
    // 동물 수정
    @RequestMapping("petupdate")
    public String petUpdate(HttpServletRequest request, ProfileBean profile_board, PetBean pet, Model model, @RequestParam("files") MultipartFile mf) {

        System.out.println("동물 수정 진입");

        String filename = mf.getOriginalFilename();
        int size = (int)mf.getSize();
        System.out.println("size:" + size);
        System.out.println("profile_num:" + pet.getProfile_num());
        int result = 0;

        //파일 첨부 관련
        if (size > 0) {
            System.out.println("profile_num이 null이 아니면 수정할 파일이 있습니다");

            String file_path = request.getRealPath("petimg");
            System.out.println("file_path는 " + file_path);
            System.out.println("filename은 " + filename);


            //이전 실제 첨부파일 삭제
            String oldFilename = pps.profileSelect(profile_board);

            System.out.println("삭제할 파일 경로" + file_path + "/" + oldFilename);
            File real_file =new File(file_path + "/" + oldFilename);
            real_file.delete();


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

            pet.setProfile_origin(filename);
            pet.setProfile_name(new_filename);

            int cnt = pps.profileInsert(pet);
            if(cnt == 1)   System.out.println("부모테이블에 insert 되었습니다!");

            // 첨부파일이 포함된 자식 테이블수정
            result = pps.p_update(pet);
            if(result == 1) System.out.println("자식테이블 수정되었습니다!" );


        }else {
            result = pps.p_modify(pet);
            if(result==1){
                System.out.println("동물 수정 성공");
            }

        }


        model.addAttribute("result", result);


        return "memberPage/petupdate";
    }

    // 동물 추가폼
    @RequestMapping("memberpage_petadd")
    public String petAddForm() {
        return "memberPage/memberpage_petadd";
    }


    // 동물 추가
    @RequestMapping("petadd")
    public String petAdd(HttpServletRequest request,HttpSession session, PetBean pet, ProfileBean profile_board, Model model, @RequestParam("files") MultipartFile mf) throws Exception {

        // 세션 확인
        Member member1 = (Member) session.getAttribute("member");
//        int m_id = (int)session.getAttribute("m_id");
        System.out.println("member1:" + member1);
        System.out.println("m_id:" + member1.getM_id());

        pet.setG_id(member1.getM_id());

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

        // 추가
        model.addAttribute("pet", pet);

        return "memberPage/petadd";
    }


}
