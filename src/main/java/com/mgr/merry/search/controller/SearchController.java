package com.mgr.merry.search.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mgr.merry.common.PageBarFactory;
import com.mgr.merry.info.model.vo.InfoUpload;
import com.mgr.merry.search.model.service.SearchService;

@Controller
public class SearchController {

	private Logger logger = LoggerFactory.getLogger(SearchController.class);

	@Autowired
	SearchService service;

	@RequestMapping("/search/subThemaList")
	public String subThemaList(@RequestParam("themaNum") int themaNum, @RequestParam("themaNumRef") int themaNumRef,
			Model model, @RequestParam(value = "cPage", required = false, defaultValue = "0") int cPage) {

		int numPerPage = 4;

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("themaNum", themaNum);
		param.put("themaNumRef", themaNumRef);

		List<InfoUpload> list = service.subThemaList(param, cPage, numPerPage);
		model.addAttribute("list", list);

		logger.debug("" + param);
		logger.debug("컨트롤러에서 서브테마 리스트 : " + list);

		int totalCount = service.subThemaCount(param);

		model.addAttribute("pageBar",
				PageBarFactory.getPageBar(totalCount, cPage, numPerPage,
						"/19AM_MERRYGOROUND_final/search/subThemaList?themaNum=" + param.get("themaNum")
								+ "&themaNumRef=" + param.get("themaNumRef")));

		return "search/classifyByTheme";

	}

	@RequestMapping("/search/mainThemaList")
	public String mainThemaList(@RequestParam("themaNumRef") int themaNumRef, Model model,
			@RequestParam(value = "cPage", required = false, defaultValue = "0") int cPage) {

		int numPerPage = 4;
		List<InfoUpload> list = service.mainThemaList(themaNumRef, cPage, numPerPage);
		model.addAttribute("themaNumRef", themaNumRef);
		model.addAttribute("list", list);

		logger.debug("themaNumRef : " + themaNumRef);
		logger.debug("컨트롤러에서 메인테마 리스트 : " + list);

		int totalCount = service.mainThemaCount(themaNumRef);

		model.addAttribute("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage,
				"/19AM_MERRYGOROUND_final/search/mainThemaList?themaNumRef=" + themaNumRef));

		return "search/classifyByTheme";

	}

	@RequestMapping("/search/locList")
	public String localList(@RequestParam("localNum") int localNum, Model model,
			@RequestParam(value = "cPage", required = false, defaultValue = "0") int cPage) {

		int numPerPage = 6;
		List<InfoUpload> list = service.localList(localNum, cPage, numPerPage);
		model.addAttribute("locList", list);

		logger.debug("localNum : " + localNum);
		logger.debug("컨트롤러에서 지역 리스트 : " + list);

		int totalCount = service.localCount(localNum);

		model.addAttribute("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage,
				"/19AM_MERRYGOROUND_final/search/locList?localNum=" + localNum));
		model.addAttribute("localNum", localNum);

		return "search/classifyByLoc";
	}

	@RequestMapping(value = "/search/mapSearchEnd", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String mapSerchEnd(HttpServletResponse response, String keyword,
			@RequestParam(value = "cPage", required = false, defaultValue = "0") int cPage, Model model)
			throws JsonProcessingException {

		int numPerPage = 5;
		List<InfoUpload> list = service.mapList(keyword, cPage, numPerPage);
		model.addAttribute("list", list);

		logger.debug("keyword : " + keyword);
		logger.debug("컨트롤러에서MAP 리스트 : " + list);

		int totalCount = service.mapCountAll(keyword);

		model.addAttribute("pageBar", PageBarFactory.getPageBar(totalCount, cPage, numPerPage,
				"/19AM_MERRYGOROUND_final/search/mapSearchEnd?keyword=" + keyword));
		model.addAttribute("keyword", keyword);

		Map<String, Object> map = new HashMap<String, Object>();

		map.put("cPage", cPage);
		map.put("totalCount", totalCount);
		map.put("numPerPage", numPerPage);
		map.put("list", list);

		// responsebody -> jackson

		ObjectMapper mapper = new ObjectMapper();

		return mapper.writeValueAsString(map);
	}

	// 지도 API
	@RequestMapping("/search/mapSearch")

	public String mapSerch() {

		return "search/placeOnAMap";
	}

	// 공시사항 인덱스 출력메소드
	@RequestMapping(value = "/admin/noticeIndexLoad", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String adminNoticeInsert() throws JsonProcessingException {

		// 비지니스 로직처리(데이터 삽입)
		Map<String, String> list = service.noticeIndexLoad();
		logger.debug(list.toString());

		ObjectMapper mapper = new ObjectMapper();
		String strData = mapper.writeValueAsString(list);

		return strData;

	}

}
