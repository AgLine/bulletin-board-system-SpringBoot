package com.example.myapp.bbs.web;

import com.example.myapp.bbs.svc.BbsSvc;
import com.example.myapp.bbs.vo.BbsVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class BbsCtrl {

    @Autowired
    private BbsSvc bbsSvc;

    @GetMapping("/bbs/bbsList")
    public ModelAndView bbsList(){
        ModelAndView mav = new ModelAndView();

        List<BbsVO> list = new ArrayList<>();
        list = bbsSvc.selectBbsList();

        System.out.println(list);
        return mav;
    }
}
