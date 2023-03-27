package com.example.myapp.lotto.vo;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class LottoVO {
    private List<Integer> number = new ArrayList<>();
}
