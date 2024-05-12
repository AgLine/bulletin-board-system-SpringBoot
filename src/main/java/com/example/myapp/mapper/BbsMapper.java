package com.example.myapp.mapper;

import com.example.myapp.bbs.vo.BbsVO;
import com.example.myapp.bbs.vo.UserVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BbsMapper {
    /*
    게시판 글 목록 조회
    */
    List<BbsVO> bbsSelectList();

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
}
