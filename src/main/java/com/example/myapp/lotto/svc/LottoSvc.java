package com.example.myapp.lotto.svc;

import com.example.myapp.lotto.vo.LottoVO;

import java.util.List;

public interface LottoSvc {
    List<LottoVO> createNum(int num);
}
