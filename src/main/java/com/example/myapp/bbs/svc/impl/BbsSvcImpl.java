package com.example.myapp.bbs.svc.impl;

import com.example.myapp.bbs.svc.BbsSvc;
import com.example.myapp.bbs.vo.BbsVO;
import com.example.myapp.bbs.vo.UserVO;
import com.example.myapp.mapper.BbsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BbsSvcImpl implements BbsSvc {
    @Autowired
    private BbsMapper bbsMapper;

    /*
    게시판 글 목록 조회
    */
    @Override
    public List<BbsVO> selectBbsList(){
        return bbsMapper.bbsSelectList();
    }

    /*
    회원정보 Insert
    */
    @Override
    public void userInsert(UserVO userVO) {
        bbsMapper.userInsert(userVO);
    }

    /*
    ID 중복체크
    */
    @Override
    public int idCnt(UserVO userVO){

        return bbsMapper.idCnt(userVO);
    }

    /*
    게시글 Insert
    */
    @Override
    public void writeInsert(BbsVO bbsVO){bbsMapper.writeInsert(bbsVO);}
}
