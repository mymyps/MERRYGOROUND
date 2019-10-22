package com.mgr.merry.couple.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mgr.merry.common.PageBarFactory;
import com.mgr.merry.couple.model.service.CoupleBoardService;

@Controller
public class CoupleBoardController {
	
	@Autowired
	CoupleBoardService cservice;
	
	
	@RequestMapping("/couple/coupleBoardList")
	public ModelAndView coupleBoardList(@RequestParam(value="cPage", required=false,defaultValue="0") int cPage) {
		ModelAndView mv = new ModelAndView();
		
		System.out.println("컨트롤러!!");
		
		int numPerPage=10;
		List<Map<String,String>> list = cservice.selectCoupleBoardList(cPage,numPerPage);
		int totalCount = cservice.selectCoupleBoardCount();
		
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalCount, cPage,numPerPage,"/merry/couple/coupleBoardList"));
		mv.addObject("count",totalCount);
		mv.addObject("list",list);
		mv.setViewName("couple/coupleBoardList");
		return mv;
	}
	
	@RequestMapping("/couple/coupleBoardWrite")
	public String coupleBoardWrite() {
		return "couple/coupleBoardWrite";
	}
	
	@RequestMapping("/couple/coupleBoardWriteEnd")
	public ModelAndView insertCoupleBoard(@RequestParam Map<String,String> param ) {
		
		int result=0;
		try {
			result = cservice.insertCoupleBoard(param);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		String msg = "";
		String loc = "/couple/coupleBoardList";
		if(result>0) {
			msg="게시물 등록 성공";
		}else {
			msg="게시물 등록 실패";
		}
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		//DB 저장할 데이터 보관
		
		
		return mv;
	}

}
