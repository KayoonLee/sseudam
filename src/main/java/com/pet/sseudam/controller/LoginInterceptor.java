package com.pet.sseudam.controller;


import com.pet.sseudam.model.Member;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws  Exception{
        HttpSession session = request.getSession();
        Member member = (Member) session.getAttribute("member");
        if (member==null){
            response.sendRedirect("/sseudam/login_form");
            return false;
        }
        return true;
    }
}
