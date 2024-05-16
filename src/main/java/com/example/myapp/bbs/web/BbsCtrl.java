package com.example.myapp.bbs.web;

import com.example.myapp.bbs.svc.BbsSvc;
import com.example.myapp.bbs.vo.BbsVO;
import com.example.myapp.bbs.vo.UserVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
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

        mav.addObject("resultList",bbsSvc.selectBbsList());

        /*
        List<BbsVO> list = new ArrayList<>();
        list = bbsSvc.selectBbsList();

        System.out.println(list);
        */

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
    public Map<String, Object> joinInsert(UserVO userVO){

        bbsSvc.userInsert(userVO);
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("result","회원가입이 완료되었습니다.");

        return resultMap;
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
            resultMap.put("result", "false");
        }else{
            resultMap.put("result", "true");
        }

        return resultMap;
    }

    /*
    글작성 페이지
    */
    @GetMapping("/bbs/write")
    public ModelAndView bbsWrite(){
        ModelAndView mav = new ModelAndView();


        return mav;
    }

    /*
    글작성기능
    */
    @ResponseBody
    @PostMapping("/bbs/writeAction")
    public Map<String, Object> writeAction(HttpServletRequest request,BbsVO bbsVO){
        Map<String, Object> resultMap = new HashMap<>();

        HttpSession session = request.getSession();
        String name = (String)session.getAttribute("userId");

        bbsVO.setBbsName(name);
        bbsSvc.writeInsert(bbsVO);
        //System.out.println(bbsVO);
        return resultMap;
    }
    /*
    부트스트랩 테스트페이지
    */
    @GetMapping("/bbs/home")
    public ModelAndView home(){
        ModelAndView mav = new ModelAndView();

        return mav;
    }

}
