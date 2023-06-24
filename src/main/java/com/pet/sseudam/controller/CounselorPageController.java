package com.pet.sseudam.controller;

import com.pet.sseudam.model.*;
import com.pet.sseudam.service.CounselorService;
import com.pet.sseudam.service.MemberService;
import org.apache.coyote.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Controller
public class CounselorPageController {

    @Autowired
    private MemberService ms;

    @Autowired
    private CounselorService cs;

    //상담사 페이지 main
    @RequestMapping("counselorpage_main")
    public String memberPageMain(HttpSession session, Model model) {
        System.out.println("상담사 마이 페이지로 진입성공");

        Member member = (Member) session.getAttribute("member");
        int c_id = member.getM_id(); // 상담사 번호 구하기

        Member myModel = new Member();
        Counselor counsel = cs.counselChk(c_id); // 해당 상담사 번호로 상담사 정보 구하기

        myModel = ms.userCheck(member.getEmail());

        if(myModel.getProfile_num() != null){ // 사진 첨부 됐을 때(원래 사진 있던 경우->다른 사진으로 변경)
            myModel = ms.checkFilenum(member.getEmail());
            System.out.println("myModel:"+myModel);
        }else { // 사진 없는 상태
            myModel = ms.userCheck(member.getEmail()); //해당 회원 정보 추출
            System.out.println("myModel:"+myModel);
        }

        model.addAttribute("myModel", myModel);
        model.addAttribute("counsel", counsel);
        return "counselorPage/counselorpage_main";
    }

    // 수정폼 진입 (정보수정은 mypageController에서 함)
    @RequestMapping("counselorpage_updateform")
    public String csUpdateform(HttpSession session, Model model){
        System.out.println("상담사 수정 폼 진입성공");

        Member member = (Member) session.getAttribute("member");
        int c_id = member.getM_id(); // 상담사 번호 구하기

        Member myModel = ms.userCheck(member.getEmail());
        Counselor counsel = cs.counselChk(c_id);

        model.addAttribute("myModel", myModel);
        model.addAttribute("counsel", counsel);
        return "counselorPage/counselorpage_updateform";
    }

    // 상담사 정보 수정 + 프사
    @RequestMapping("counselor_update")
    public String csUpdate(Model model, Member member, Counselor counselor, @RequestParam("files") MultipartFile mf,
                           HttpServletRequest request, ProfileBean pfb, HttpSession session) throws Exception {
        System.out.println("member: " + member);
        System.out.println("counselor 정보 수정 컨트롤러" + counselor);
        System.out.println("첨부파일 진입");

        String filename = mf.getOriginalFilename();
        int size = (int) mf.getSize();
        int result;

        if (size > 0) { //사진 있을 때
            System.out.println("첨부할 사진 있음");
            int max_num = ms.getMaxnum() + 1;
            System.out.println("insert후 max_num: " + max_num);

            String file_path = request.getRealPath("memberImg");
            System.out.println("file_path는 " + file_path);
            System.out.println("filename은 " + filename);

            String extension = filename.substring(filename.lastIndexOf("."));
            UUID uuid = UUID.randomUUID();

            String new_filename = uuid.toString().replace("-", "") + extension;

            System.out.println("new_filename: " + new_filename);

            try {
                mf.transferTo(new File(file_path + "/" + new_filename));
            } catch (Exception e) {
                e.getMessage();
            }

            pfb.setProfile_num(max_num);
            pfb.setProfile_origin(filename);
            pfb.setProfile_name(new_filename);

            result= ms.profileAdd(pfb); // 첨부파일 업로드

            if(result==1){
                System.out.println("사진은 업로드 성공");
            }

            member.setProfile_num(max_num);
            member.setProfile_origin(filename);
            member.setProfile_name(new_filename);

            ms.myUpfilenum(member);


            int result2= ms.myPicUpdate(member); // member 테이블 update?
            if(result2==1){
                System.out.println("내용도 업로드 성공");
            }
            System.out.println("프로필넘버:" + member.getProfile_num());

            model.addAttribute("result2",result2);
            model.addAttribute("profile_num",member.getProfile_num());
            model.addAttribute("result", result);

            return "counselorPage/csupdate_result";
        } else { // 정보만 수정

            // member테이블 컬럼 수정
            int res = ms.csMyUpdate(member);

            // 상담 테이블 컬럼 수정
            result = cs.csUpdate(counselor);
            if (result == 1) {
                System.out.println(result + ": 수정 성공");

            }
            model.addAttribute("res", res);
            model.addAttribute("result", result);

            return "counselorPage/csupdate_result";
        }
    }

    // 상담사 비밀번호 수정 폼
    @RequestMapping("counselorpage_PwUpdateForm")
    public String csPwUpdateForm(HttpSession session, Model model){
        System.out.println("상담사 비번 수정 폼 진입");
        Member member = (Member) session.getAttribute("member");
        int c_id = member.getM_id(); // 상담사 번호 구하기

        Member myModel = ms.userCheck(member.getEmail());
        Counselor counsel = cs.counselChk(c_id);
        System.out.println("myModel:"+myModel);
        System.out.println("counsel:"+counsel);
        model.addAttribute("myModel", myModel);
        model.addAttribute("counsel", counsel);
        return "counselorPage/counselorpage_PwUpdateForm";
    }

    // 상담사 비번 수정
    @RequestMapping("csMyPwUpdate")
    public String csMyPwUpdate(Member member, Model model){
        System.out.println("상담사 비번 수정 컨트롤러");
        //Member member = (Member) session.getAttribute("member");

        int result = ms.csMyPwUpdate(member);
        if(result==1){
            System.out.println("비번 수정 성공");
        }
        Member myModel = ms.userCheck(member.getEmail());

        model.addAttribute("myModel", myModel);
        return "counselorPage/counselorpage_main";
    }

    // 탈퇴폼 진입
    @RequestMapping("counselorpage_deleteform")
    public String csdeleteForm(String email, Model model){
        System.out.println("상담사 탈퇴폼진입");
        Member myModel = ms.userCheck(email);

        model.addAttribute("myModel", myModel);
        return "counselorPage/counselorpage_deleteform";
    }

    // 상담사 탈퇴
    @RequestMapping("counsel_delete")
    public String counsel_delete(Member member, Model model, HttpSession session){
        System.out.println("탈퇴 도착");
        int result = ms.deletemember(member.getEmail());
        if (result == 1)
            System.out.println("탈퇴 성공");

        session.invalidate(); //session 끊기
        model.addAttribute("result",result);
        return "counselorPage/counselor_out";
    }

    //상담사 목록 페이지
    @RequestMapping("counselor_list")
    public String counselor_list(Member member, Model model){
        System.out.println("상담사 목록 진입");

        List<Member> counselorList = ms.counselorList(member);
        System.out.println("counselor list:"+counselorList);

        model.addAttribute("counselorList", counselorList);
        return "counselorPage/counselor_list";
    }

    
    // 상담예약서목록
    @RequestMapping("counselorpage_request")
    public String counselorPageRequest(String email, Model model, CounselPaper counselpaper,HttpSession session){
        System.out.println("상담예약서 목록으로 진입성공을 감축드립니다^^");
        // mapper 사용하려는데 m.m_id = c.c_id m_id c_id ?
        Member member = (Member) session.getAttribute("member");
        System.out.println("member : " + member);


        List<CounselPaper> requestList = ms.requestList(member.getM_id());

        System.out.println("requestList:" + requestList);

        model.addAttribute("requestList", requestList);
        model.addAttribute("member", member);
        return "counselorPage/counselorpage_request";
    }

    // 상담사가 쓴 글
    @RequestMapping("counselorpage_mypost")
    public String counselorPagePost(HttpSession session, Model model){
        System.out.println("내가 쓴 글로 진입성공");
        Member member = (Member) session.getAttribute("member");
        System.out.println("member: " + member);

        List<FreeBean> mypostList = ms.mypostList(member.getM_id());
        System.out.println("mypostList: " + mypostList);


        model.addAttribute("mypostList", mypostList);
        model.addAttribute("member", member);

        return "counselorPage/counselorpage_mypost";
    }

    // 상담사가 쓴 댓글
    @RequestMapping("counselorpage_myreply")
    public String counselorPageReply(HttpSession session, Model model){
        System.out.println("내가 쓴 댓글로 진입성공");
        Member member = (Member) session.getAttribute("member");
        System.out.println("member: " + member);

        List<ReFreeBean> myreplyList = ms.myreplyList(member.getM_id());
        System.out.println("myreplyList: " + myreplyList);

        model.addAttribute("myreplyList", myreplyList);
        model.addAttribute("member", member);
        return "counselorPage/counselorpage_myreply";
    }

    // 상담사가 좋아요 한 글
    @RequestMapping("counselorpage_mylike")
    public String counselorLikeReply(Model model, HttpSession session){
        System.out.println("내가 좋아요 한 글로 진입성공");

        Member member = (Member) session.getAttribute("member");
        System.out.println("member: " + member);

        List<FreeBean> mylikeList = ms.mylikeList(member.getM_id());
        System.out.println("mylikeList: " + mylikeList);

        model.addAttribute("mylikeList", mylikeList);
        model.addAttribute("member", member);
        return "counselorPage/counselorpage_mylike";
    }
}
