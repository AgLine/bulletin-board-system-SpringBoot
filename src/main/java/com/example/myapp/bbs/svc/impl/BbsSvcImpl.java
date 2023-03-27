package com.example.myapp.bbs.svc.impl;

import com.example.myapp.bbs.svc.BbsSvc;
import com.example.myapp.bbs.vo.BbsVO;
import com.example.myapp.mapper.BbsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BbsSvcImpl implements BbsSvc {
    @Autowired
    private BbsMapper bbsMapper;

    @Override
    public List<BbsVO> selectBbsList(){
        return bbsMapper.bbsSelectList();
    }
}
