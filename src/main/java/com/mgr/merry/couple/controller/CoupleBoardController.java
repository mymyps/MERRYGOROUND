package com.mgr.merry.couple.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.mgr.merry.common.PageBarFactory;
import com.mgr.merry.couple.model.service.CoupleBoardService;

@Controller
public class CoupleBoardController {
	
	@Autowired
	CoupleBoardService cservice;
	private static List list;
	
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
	public ModelAndView insertCoupleBoard(@RequestParam Map<String,String> param 
			, HttpServletRequest request ) {
		int result=0;
		try {
			System.out.println("writeEnd안에서 param: "+param);
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
		
		return mv;
	}
	
	//summernote 이미지파일 저장후 게시판에 쏴주기
	@RequestMapping(value = "summernote_imageUpload.do", method=RequestMethod.POST)
	public void uploadSummernoteImage(MultipartFile image, HttpSession session, HttpServletResponse res) throws Exception{
		String savename = image.getOriginalFilename();
		
		System.out.println(image.getOriginalFilename());
		String path=session.getServletContext().getRealPath("/resources/images/couple");
		File f=new File(path);
		if(!f.exists()) f.mkdirs();
		
		//파일명 생성(rename)
		String oriFileName=image.getOriginalFilename();
		String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
		//규칙설정
		SimpleDateFormat sdf= new SimpleDateFormat("yyyyMMdd_HHMMssSSS");
		int rdv = (int)(Math.random()*1000);
		String reName = sdf.format(System.currentTimeMillis())+"_"+rdv+ext;
		
		// 파일 실제 저장하기
        try {
           image.transferTo(new File(path + "/" + reName));
     
        } catch (Exception e) { //IlligalStateException|IOException
        	e.printStackTrace();
        }
        res.getWriter().print("/merry/resources/images/couple/"+reName);
        
        //DB에 저장 board가 insert된후 boardnum을 가져온후 저장해야함 (따로 필요?)
        
        
	}
	// 파일 중복 체크
//		private String getUniqName(String fileName, String dirName) {	
//			String tempName = null;
//			File file = new File(dirName, fileName);
//			int lastIdx = fileName.lastIndexOf(".");
//			int i = 1;
//			while(true) {
//				if(!file.exists()) {
//					break;
//				}
//				tempName = fileName;
//				tempName = tempName.substring(0, lastIdx) + "_" + i + tempName.substring(lastIdx, tempName.length());
//				file = new File( dirName, tempName);
//				i++;
//			}
//			
//			return file.getName();
//		}

	
	
	@RequestMapping("/couple/coupleBoardView")
	public ModelAndView coupleBoardView(@RequestParam("no") int no) {
		
		
		System.out.println("매개변수 int no : "+no);
		ModelAndView mv = new ModelAndView();
		Map<String,String> cboard = cservice.selectCoupleBoard(no);
		
		
//		List<Attachment> att = cservice.selectAttachList(no);  //파일불러오기
		
		System.out.println("서비스에서 받아온 cboard : "+cboard);
		mv.addObject("cboard",cboard);
		
		mv.setViewName("couple/coupleBoardView");
		
		return mv;
	}

}
