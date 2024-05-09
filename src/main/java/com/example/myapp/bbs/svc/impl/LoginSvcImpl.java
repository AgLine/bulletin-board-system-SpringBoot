package com.example.myapp.bbs.svc.impl;

import com.example.myapp.bbs.svc.LoginSvc;
import com.example.myapp.bbs.vo.LoginVO;
import com.example.myapp.mapper.LoginMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginSvcImpl implements LoginSvc {
    @Autowired
    private LoginMapper loginMapper;

    /*
    아이디체크
    */
    @Override
    public int idCheck(LoginVO loginVO){
        return loginMapper.idCheck(loginVO);
    }

    /*
    비밀번호체크
    */
    @Override
    public int pwdCheck(LoginVO loginVO){
        return loginMapper.pwdCheck(loginVO);
    }

}
