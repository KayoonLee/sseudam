package com.pet.sseudam.controller;

import com.pet.sseudam.model.*;
import com.pet.sseudam.service.CounselorService;
import com.pet.sseudam.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;
import java.util.UUID;

@Controller
public class MyPageController {


    @Autowired
    private MemberService ms;

    @Autowired
    private CounselorService cs;

    // my page 진입
    @RequestMapping("memberpage_main")
    public String memberPageMain(HttpSession session, Integer profile_num ,Model model) {
        System.out.println("일반회원 마이 페이지로 진입성공");

        Member member = (Member) session.getAttribute("member");
        Member myModel = new Member();

        if(profile_num !=null){ // 사진 첨부 됐을 때
            myModel = ms.checkFilenum(member.getEmail());
            System.out.println("myModel:"+myModel);
        }else { // 사진 없는 상태
            myModel = ms.userCheck(member.getEmail()); //해당 회원 정보 추출
            System.out.println("myModel:"+myModel);
        }

        System.out.println("myModel.getProfile_num() 은 " + myModel.getProfile_num());

        model.addAttribute("myModel", myModel);
        System.out.println("member:"+member);


        return "memberPage/memberpage_main";
    }


    //수정폼 진입
    @RequestMapping("memberpage_updateform")
    public String myUpdateform(HttpSession session, Model model){
        System.out.println("수정 페이지로 진입성공");

        Member member = (Member) session.getAttribute("member");
        Member myModel = ms.userCheck(member.getEmail());

        model.addAttribute("myModel", myModel);
        return "memberPage/memberpage_updateform";
    }




    // 일반 회원 정보수정 + 파일 첨부 (사진이 있을 때, 다른 사진으로 변경)
    @RequestMapping("mypage_update")
    public String myUpdate(Model model, Member member,  @RequestParam("files") MultipartFile mf,
                           HttpServletRequest request, ProfileBean pfb, HttpSession session) throws Exception{
        System.out.println("첨부파일 진입");

        String filename = mf.getOriginalFilename();
        int size = (int)mf.getSize();
        int result;



        if (size > 0) { //사진이 있을 때
            System.out.println("첨부할 프로필사진이 있습니다");

            if(member.getProfile_num()==null){ // 사진 없다가 추가(기본 프사에서 추가)
                System.out.println("사진 없다가 추가");

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
//                member.setProfile_num(max_num); //회원 테이블에 사진number 추가
//                System.out.println("프로필넘버:"+member.getProfile_num());

                // member 테이블에서 profile num 업데이트
                ms.myUpfilenum(member);


                int result2= ms.myPicUpdate(member); // member 테이블 update?
                if(result2==1){
                    System.out.println("내용도 업로드 성공");
                }
                System.out.println("프로필넘버:" + member.getProfile_num());


                model.addAttribute("result2",result2);
                model.addAttribute("profile_num",member.getProfile_num());
                model.addAttribute("result", result);
                return "memberPage/myupdate_alert";

            }else {// 사진 + 개인정보 같이 수정
                System.out.println("사진 + 개인정보 수정");

                String file_path = request.getRealPath("memberImg");
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

                //pfb.setProfile_num(max_num);
                member.setProfile_origin(filename);
                member.setProfile_name(new_filename);

                result = ms.myPicUpdate(member);//사진이랑 다른 컬럼 전부 수정
                if (result == 1) System.out.println("개인정보 + 사진 수정 성공");
                model.addAttribute("profile_num",member.getProfile_num());
                model.addAttribute("result", result);
                return "memberPage/myupdate_alert";
            }


        }else{ // 정보만 수정

            result = ms.myUpdate(member); // 정보수정
            if (result == 1) System.out.println("개인정보 수정 성공");
            model.addAttribute("result", result);
            return "memberPage/myupdate_alert";
        }
    }





    // 일반회원 비번 변경 폼
    @RequestMapping("memberpage_pwUpdateForm")
    public String memberpage_pwUpdateForm(HttpSession session, Model model){
        System.out.println("비번 변경 폼 진입");
        Member member = (Member) session.getAttribute("member");
        Member myModel = ms.userCheck(member.getEmail());

        System.out.println("myModel:"+myModel);

        model.addAttribute("myModel", myModel);

        return "memberPage/memberpage_pwUpdateForm";
    }
    
    // 일반회원 비밀번호 수정
    @RequestMapping("myPwUpdate")
    public String myPwUpdate(Member member, Model model){
        System.out.println("비번 수정 컨트롤러");
        //Member member = (Member) session.getAttribute("member");
        
        int result = ms.myPwUpdate(member);
        if(result==1){
            System.out.println("비번 수정 성공");
        }
        Member myModel = ms.userCheck(member.getEmail());

        model.addAttribute("myModel", myModel);
        return "memberPage/memberpage_main";
    }
    
    
    
    
    

    /*상담사 수정 파트 : member 테이블 컬럼 수정이라 MyPageController에 넣음*/
    
    // 상담사 정보 수정
    @RequestMapping("counselor_update")
    public String csUpdate(Model model, Member member, Counselor counselor, HttpSession session){
        System.out.println("member: "+member);
        System.out.println("counselor 정보 수정 컨트롤러"+counselor);

        // member테이블 컬럼 수정
        int res = ms.csMyUpdate(member);

        // 상담 테이블 컬럼 수정
        int result = cs.csUpdate(counselor);
        if (result == 1) {
            System.out.println(result +": 수정 성공");

        }


        model.addAttribute("res", res);
        model.addAttribute("result", result);

        return "counselorPage/csupdate_result";
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




    // 나의 반려동물
    @RequestMapping("memberpage_mypet")
    public String memberPagePet(HttpSession session, Model model){
        System.out.println("동물페이지로 진입성공");
        return "memberPage/memberpage_mypet";
    }


    // 내가 쓴 글
    @RequestMapping("memberpage_mypost")
    public String memberPagePost(Model model, HttpSession session){
        System.out.println("내가 쓴 글로 진입성공");

        Member member = (Member) session.getAttribute("member");
        System.out.println("member: " + member);

        List<FreeBean> mypostList = ms.mypostList(member.getM_id());
        System.out.println("mypostList: " + mypostList);


        model.addAttribute("mypostList", mypostList);
        model.addAttribute("member", member);

        return "memberPage/memberpage_mypost";
    }

    // 내가 쓴 댓글
    @RequestMapping("memberpage_myreply")
    public String memberPageReply(Model model, HttpSession session){
        System.out.println("내가 쓴 댓글로 진입성공");

        Member member = (Member) session.getAttribute("member");
        System.out.println("member: " + member);

        List<ReFreeBean> myreplyList = ms.myreplyList(member.getM_id());
        System.out.println("myreplyList: " + myreplyList);

        model.addAttribute("myreplyList", myreplyList);
        model.addAttribute("member", member);

        return "memberPage/memberpage_myreply";
    }

    // 내가 좋아요 한 글
    @RequestMapping("memberpage_mylike")
    public String memberPageLike(Model model, HttpSession session){
        System.out.println("내가 좋아요 한 글로 진입성공");

        Member member = (Member) session.getAttribute("member");
        System.out.println("member: " + member);

        List<FreeBean> mylikeList = ms.mylikeList(member.getM_id());
        System.out.println("mylikeList: " + mylikeList);

        model.addAttribute("mylikeList", mylikeList);
        model.addAttribute("member", member);

        return "memberPage/memberpage_mylike";
    }

    // 상담신청내역
    @RequestMapping("memberpage_mypaper")
    public String memberPagePaper(){
        System.out.println("상담신청내역으로 진입성공");
        return "memberPage/memberpage_mypaper";
    }

    // 즐겨찾는 상담사
    @RequestMapping("memberpage_mycounselor")
    public String memberPageCounselor(){
        System.out.println("즐겨찾는 상담사로 진입성공");
        return "memberPage/memberpage_mycounselor";
    }



}
