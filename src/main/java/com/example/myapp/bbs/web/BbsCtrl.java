package com.example.myapp.bbs.web;

import com.example.myapp.bbs.svc.BbsSvc;
import com.example.myapp.bbs.vo.BbsVO;
import com.example.myapp.bbs.vo.UserVO;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BbsCtrl {

    @Autowired
    private BbsSvc bbsSvc;

    /*
    게시판 글 목록 조회
    */
    @GetMapping("/bbs/list")
    public ModelAndView bbsList(){
        ModelAndView mav = new ModelAndView();

        List<BbsVO> list = new ArrayList<>();
        list = bbsSvc.selectBbsList();

        System.out.println(list);
        return mav;
    }

    /*
    회원가입 페이지
    */
    @GetMapping("/bbs/join")
    public ModelAndView bbsJoin(){
        ModelAndView mav = new ModelAndView();

        return mav;
    }

    /*
    회원정보 Insert
    */
    @ResponseBody
    @PostMapping("/bbs/joinInsert")
    public void joinInsert(UserVO userVO){

        bbsSvc.userInsert(userVO);
        /*
        System.out.println(userVO.getUserID());
        System.out.println(userVO.getUserEmail());
        System.out.println(userVO.getUserName());
        System.out.println(userVO.getUserPwd());
        */
    }

    /*
    ID 중복체크
    */
    @ResponseBody
    @PostMapping("/bbs/idCheck")
    public Map<String, Object> idCheck(UserVO userVO){

        Map<String, Object> resultMap = new HashMap<>();
        if(1 == bbsSvc.idCnt(userVO)){
            resultMap.put("result", "중복된 아이디 입니다.");
        }else{
            resultMap.put("result", "사용가능한 아이디 입니다.");
        }

        return resultMap;
    }

}
