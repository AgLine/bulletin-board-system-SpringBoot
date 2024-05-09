package com.example.myapp.bbs.web;

import com.example.myapp.bbs.svc.LoginSvc;
import com.example.myapp.bbs.vo.LoginVO;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginCtrl {

    @Autowired
    private LoginSvc loginSvc;

    /*
    로그인페이지
    */
    @GetMapping("/bbs/login")
    public ModelAndView bbsLogin(){
        ModelAndView mav = new ModelAndView();


        return mav;
    }

    /*
    로그인기능
    */
    @ResponseBody
    @PostMapping("/bbs/loginAction")
    public Map<String, Object> loginAction(HttpServletRequest request, LoginVO loginVO){

        Map<String, Object> resultMap = new HashMap<>();

        //System.out.println(loginVO);
        //System.out.println(loginSvc.idCheck(loginVO));
        //System.out.println(loginSvc.pwdCheck(loginVO));

        if(loginSvc.idCheck(loginVO) == 1){
            if(loginSvc.pwdCheck(loginVO) == 1){// 로그인 성공
                resultMap.put("result","Y");
                request.getSession().setAttribute("userId", loginVO.getUserId());
            }else{
                resultMap.put("result", "비밀번호를 다시 입력해주세요");
                return resultMap;
            }
        }else{
            resultMap.put("result", "아이디를 다시 입력해주세요");
            return resultMap;
        }

        return resultMap;
    }

    /*
    * 로그인 상태 체크
    */
    @ResponseBody
    @PostMapping("/bbs/loginCheck")
    public Map<String, Object> loginCheck(HttpServletRequest request){

        Map<String, Object> resultMap = new HashMap<>();

        HttpSession session = request.getSession();
        String name = (String)session.getAttribute("userId");

        if(name != null){//로그인상태
            resultMap.put("result",name);
        }else{//로그인아닌상태
            resultMap.put("result","N");
        }
        //System.out.println(name);

        return resultMap;
    }
}
