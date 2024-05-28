package com.example.myapp.bbs.svc;

import com.example.myapp.bbs.vo.BbsVO;
import com.example.myapp.bbs.vo.UserVO;

import java.util.List;

public interface BbsSvc {

    /*
    게시판 글 목록 조회
    */
    List<BbsVO> selectBbsList();

    /*
    회원정보 Insert
     */
    void userInsert(UserVO userVO);

    /*
    ID 중복체크
    */
    int idCnt(UserVO userVO);

    /*
    게시글 Insert
    */
    void writeInsert(BbsVO bbsVO);

    /*
    게시글 단건 조회
    */
    BbsVO selectByBbsId(BbsVO bbsVO);
}
