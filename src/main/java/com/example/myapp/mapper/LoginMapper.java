package com.example.myapp.mapper;

import com.example.myapp.bbs.vo.LoginVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapper {
    /*
    아이디체크
    */
    int idCheck(LoginVO loginVO);

    /*
    비밀번호체크
    */
    int pwdCheck(LoginVO loginVO);

}
