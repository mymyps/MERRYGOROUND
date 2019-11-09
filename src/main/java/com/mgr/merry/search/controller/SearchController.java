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
	public String subThemaList(
			@RequestParam("themaNum") int themaNum,
			@RequestParam("themaNumRef") int themaNumRef, Model model
			,@RequestParam(value="cPage",required=false,defaultValue="0") int cPage) {
		
		int numPerPage=4;
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("themaNum", themaNum);
		param.put("themaNumRef", themaNumRef);

		List<InfoUpload> list = service.subThemaList(param,cPage,numPerPage);
		model.addAttribute("list", list);

		logger.debug("" + param);
		logger.debug("컨트롤러에서 서브테마 리스트 : " + list);
		
        int totalCount = service.subThemaCount(param);
		
		model.addAttribute("pageBar",PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/merry/search/subThemaList?themaNum="+param.get("themaNum")+"&themaNumRef="+param.get("themaNumRef")));

		return "search/classifyByTheme";

	}

	@RequestMapping("/search/mainThemaList")
	public String mainThemaList(@RequestParam("themaNumRef") int themaNumRef, Model model
			,@RequestParam(value="cPage",required=false,defaultValue="0") int cPage) {

		int numPerPage=4;
		List<InfoUpload> list = service.mainThemaList(themaNumRef,cPage,numPerPage);
		model.addAttribute("themaNumRef", themaNumRef);
		model.addAttribute("list", list);

		logger.debug("themaNumRef : " + themaNumRef);
		logger.debug("컨트롤러에서 메인테마 리스트 : " + list);
		
		int totalCount = service.mainThemaCount(themaNumRef);
		
		model.addAttribute("pageBar",PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/merry/search/mainThemaList?themaNumRef="+themaNumRef));

		return "search/classifyByTheme";

	}

	@RequestMapping("/search/locList")

	public String localList(@RequestParam("localNum") int localNum, Model model
							,@RequestParam(value="cPage",required=false,defaultValue="0") int cPage) {
		
		int numPerPage=6;
		List<InfoUpload> list = service.localList(localNum,cPage,numPerPage);
		model.addAttribute("locList", list);

		logger.debug("localNum : " + localNum);
		logger.debug("컨트롤러에서 지역 리스트 : " + list);

		int totalCount = service.localCount(localNum);
		
		model.addAttribute("pageBar",PageBarFactory.getPageBar(totalCount, cPage, numPerPage, "/merry/search/locList?localNum="+localNum));
//		model.addAttribute("count",totalCount);
		model.addAttribute("localNum",localNum);		
		
		return "search/classifyByLoc";
	}

	@RequestMapping("/search/mapSearch")

	public String mapSerch() {

		return "search/placeOnAMap";
	}
	
	
	@RequestMapping("/search/mapSearchEnd")
	
	public void mapSerchEnd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String keyword = request.getParameter("keyword");
		double y=Double.parseDouble(request.getParameter("y"));
		double x=Double.parseDouble(request.getParameter("x"));
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("keyword", keyword);
		param.put("y", y);
		param.put("x", x);
		
		List<Map<String,Object>> resultList = service.mapSearch(param);
		
		logger.debug(""+resultList);
		
		response.setContentType("application/x-json; charset=UTF-8");
		
		//DTO 타입의 어레이리스트를 json 형태로 바꿔주는 구문(라이브러리 필수, zip->jar 확장자명 꼭 확인)
//        String gson = new Gson().toJson(resultList);
//        
//        try {
//            //ajax로 리턴해주는 부분
//            response.getWriter().write(gson);
//        } catch (JsonIOException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
		
	}
	
	// 공시사항 인덱스 출력메소드
	@RequestMapping(value="/admin/noticeIndexLoad",produces="application/json;charset=UTF-8")
	@ResponseBody
	public String adminNoticeInsert() throws JsonProcessingException {

		//비지니스 로직처리(데이터 삽입)
		Map<String, String> list = service.noticeIndexLoad();
		logger.debug(list.toString());
		
		ObjectMapper mapper = new ObjectMapper();
		String strData = mapper.writeValueAsString(list);
		
		return strData;
		
	}
	
	

}
