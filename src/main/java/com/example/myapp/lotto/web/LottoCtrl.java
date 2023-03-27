package com.example.myapp.lotto.web;

import com.example.myapp.lotto.svc.LottoSvc;
import com.example.myapp.lotto.vo.LottoVO;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
public class LottoCtrl {

    @Autowired
    private LottoSvc lottoSvc;

    @GetMapping("/lotto")
    public ModelAndView lotto() {
        ModelAndView mav = new ModelAndView("/lotto/lotto");
        return mav;
    }

    @RequestMapping("/lotto/num")
    @ResponseBody
    public Map<String, Object> createNum(HttpServletRequest httpServletRequest, LottoVO lottoVO) {
        Map<String, Object> resultMap = new HashMap<>();
        int num = Integer.parseInt(httpServletRequest.getParameter("num"));
        resultMap.put("result", lottoSvc.createNum(num));
        //lottoSvc.createNum(num);
        return resultMap;
    }
}
