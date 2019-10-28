package com.mgr.merry.search.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	

	@RequestMapping("/search/themaList")
	public String themaList(@RequestParam("themaNum") String themaNum, 
			                @RequestParam("level") int level, Model model) {

		logger.debug("" + themaNum);
		logger.debug("" + level);

		Map<String, Object> param = new HashMap();
		param.put("themaNum", themaNum);
		param.put("level", level);

		List<InfoUpload> list = service.themaList(param);
		System.out.println("서치컨트롤러 리스트 :"+list);
		model.addAttribute("list", list);
		logger.debug("" + param);

		return "search/classifyByTheme";

	}

	@RequestMapping("/search/localList")

	public String localList(@RequestParam("localNum") int localNum, Model model) {

		List<InfoUpload> locList = service.localList(localNum);
		model.addAttribute("locList", locList);
		return "search/classfyByLoc";

	}

	@RequestMapping("/search/tMapSerch")

	public String tMapSerch() {

		return "search/placeOnAMap";
	}

}