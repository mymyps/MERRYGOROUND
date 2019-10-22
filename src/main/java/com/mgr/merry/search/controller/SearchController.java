package com.mgr.merry.search.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.mgr.merry.info.model.vo.InfoUpload;
import com.mgr.merry.search.model.service.SearchService;



@Controller
public class SearchController {
	private Logger logger = LoggerFactory.getLogger(SearchController.class);

	@Autowired
	SearchService service;
	
	@RequestMapping("/search/allList")
	
	public String allList(Model model) {
		
		logger.debug("지역별/테마별 리뷰 목록 로드 controller!!");
	
		List<Map<String,Object>> list=service.allList();
		model.addAttribute("list",list);
		return "redirect:/";
	}
	
	@RequestMapping("/search/themaList")
	
	public String themaList(@RequestParam("themaNum") int themaNum,
			                @RequestParam("level") int level,
			                Model model) {
	
	logger.debug("테마별 리스트가 가져와지면 이게 뜨겠지?!!!!!!!!!1");	
	
	List<InfoUpload> list = service.themaList(themaNum, level);
	model.addAttribute("list",list);
		
	return "search/classifyByTheme";
		
		
	}
			                 
			
}
