package com.example.myapp.bbs.svc;

import com.example.myapp.bbs.vo.LoginVO;

public interface LoginSvc {
    /*
    아이디체크
    */
    int idCheck(LoginVO loginVO);

    /*
    비밀번호체크
    */
    int pwdCheck(LoginVO loginVO);
}
