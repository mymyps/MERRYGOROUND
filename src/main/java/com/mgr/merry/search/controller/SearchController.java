package com.mgr.merry.search.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class SearchController {
	private Logger logger = LoggerFactory.getLogger(SearchController.class);

//	@Autowired
//	SerchService service;
	
	@RequestMapping("/serch/categoryList")
	
	public String categoryList() {
		return "review/categoryList";
		
		
	}
}
