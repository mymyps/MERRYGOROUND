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
	
//	@RequestMapping("/search/allList")
//	public String allList(Model model) {
//	
//		List<Map<String,Object>> all=service.allList();
//		model.addAttribute("all",all);
//		return "redirect:/";
//	}
//	
	@RequestMapping("/search/themaList")
	
	
	
	public String themaList(@RequestParam("themanum") int themanum,
			                @RequestParam("level") int level,
			                Model model) {
	
	
	
	List<Map<String,Object>> list = service.themaList(themanum, level);
	model.addAttribute("list",list);
		
	return "search/classifyByTheme";
		
		
	}

	
	@RequestMapping("/search/localList")
	
	public String localList(@RequestParam("localNum") int localNum,
			                 Model model) {
		
		List<Map<String,Object>> locList = service.localList(localNum);
		model.addAttribute("locList", locList);
		return "search/classfyByLoc";
		
	
   }
	
   @RequestMapping("/search/tMapSerch")
   
   public String tMapSerch() {
	   
	   return "search/placeOnAMap";
   }



}
