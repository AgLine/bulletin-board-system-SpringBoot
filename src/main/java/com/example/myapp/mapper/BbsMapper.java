package com.example.myapp.mapper;

import com.example.myapp.bbs.vo.BbsVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BbsMapper {
    List<BbsVO> bbsSelectList();
}
