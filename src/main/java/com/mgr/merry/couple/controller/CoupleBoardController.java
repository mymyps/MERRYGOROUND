package com.mgr.merry.couple.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.mgr.merry.couple.model.vo.Attachment;

@Controller
public class CoupleBoardController {
	
	@Autowired
	CoupleBoardService cservice;
	private static List<Attachment> attachList =new ArrayList();
	
	@RequestMapping("/couple/coupleBoardList")
	public ModelAndView coupleBoardList(@RequestParam(value="cPage", required=false,defaultValue="0") int cPage) {
		ModelAndView mv = new ModelAndView();
		
		System.out.println("컨트롤러!!");
		
		int numPerPage=5;
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
		attachList.clear();
		return "couple/coupleBoardWrite";
	}
	
	
	
	
	@RequestMapping("/couple/coupleBoardWriteEnd")
	public ModelAndView insertCoupleBoard(@RequestParam Map<String,String> param 
			, HttpServletRequest request ) {
		int result=0;
		int attResult=0;

		System.out.println("if전 attachsize() : "+attachList.size());
		if(attachList.size()>0) {
			try {
				System.out.println("writeEnd안에서 param: "+param);
				result = cservice.insertCoupleBoard(param,attachList);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		String msg = "";
		String loc = "/couple/coupleBoardList";
		if(result>0) {
			msg="게시물 등록 성공";
			
		}else if(attachList.size()==0) {
			msg="사진을 한장 이상 등록하세요";
		}else {
			msg="게시물 등록 실패";
		}
		
		attachList.clear();   //작성후 이미지업로드리스트 초기화
		
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
        Attachment att= new Attachment();
        System.out.println("setFilerename에 들어갈 값 : "+path+"/"+reName);
//        att.setFileRename(path+"/"+reName);
        att.setFileRename(reName);
        
        
//        System.out.println("attachList.size() : "+attachList.size());
        
        if(attachList.isEmpty()) {
        	att.setFlag(1);
        	attachList.add(att);
        }
        else if(attachList.size()>0) {
        	att.setFlag(0);
        	attachList.add(att);
        }
        System.out.println("이미지 등록 완료시 :" +attachList);
	}
	
	@RequestMapping(value = "summernote_imageDelete.do", method=RequestMethod.POST)
	public void deleteSummernoteImage(HttpSession session, HttpServletResponse res, String src) throws Exception{
		System.out.println("컨트롤러에서 src : "+src);
		int attResult =0 ;
		
		String path=session.getServletContext().getRealPath("/resources/images/couple");
		String totalPath = path + "/" + src;
		File f=new File(totalPath);
		if(f.exists()) {
			if(f.delete()) {
				//src로 select후 그 couplenum을 현재 게시물 번호로 받아오기
//				List<Attchment> cc = cservice.selectAttachList2(src);
				//먼저 지울Attachment filename의 flag값을 받아와서 0이면 그냥 삭제
				
				attResult= cservice.deleteAttachment2(src);
				//만약 flag값이 1이면 삭제후 나머지 리스트들 중에서 첫번째값 1로 변경
				
				
				System.out.println("파일 삭제 성공!");
			}else {
				System.out.println("파일 삭제 실패!");
			}
		}else {
			System.out.println("파일이 존재하지 않습니다!");
		}
	
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
	
	
	@RequestMapping("/couple/deleteCoupleBoard")
	public String deleteCoupleBoard(@RequestParam("no") int no) {
		int result =0;
		int result2 =0;
		result = cservice.deleteCoupleBoard(no);
		result2 = cservice.deleteAttachment(no);
		
		return "redirect:/";
	}
	
	@RequestMapping("/couple/updateCoupleBoard")
	public ModelAndView updateCoupleBoard(@RequestParam("no") int no) {
		ModelAndView mv = new ModelAndView();
		Map<String, String> cboard = cservice.selectCoupleBoard(no);
		
		mv.addObject("cboard",cboard);
		mv.addObject("couple/updateCoupleBoard");
		
		return mv;
	}

	@RequestMapping("/couple/updateCoupleBoardEnd")
	public ModelAndView updateCoupleBoardEnd(@RequestParam Map<String,String> param 
			 ,HttpServletRequest request ) {
		int result=0;
		int attResult=0;

		
		System.out.println("작성폼에서 넘어온 param!: "+param);
		List<Attachment> attachmentList = cservice.selectAttachList(param);
		//DB에서 해당게시물의 첨부파일목록 불러오기
		System.out.println("DB에서 받아온 attachmentList: " + attachmentList);
		//attachList를 받아와서  
		// 삭제가 이뤄지면 attachList에서 삭제  (삭제할때 DB에 접근해서 같이삭제?)
		// 추가가 이뤄지면 attachList에 추가
		// !!attachment DB에서 가져온 파일이름과 수정폼에서 넘어온 첨부파일 리스트 비교 필요
		
		System.out.println("if전 attachmentListsize() : "+attachmentList.size());
		if(attachmentList.size()>0) {
			try {
				result = cservice.updateCoupleBoard(param,attachList);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		String msg = "";
		String loc = "/couple/coupleBoardList";
		if(result>0 && attachmentList.size() >0) {
			System.out.println("성공할때의 attachmentList size: "+attachmentList.size());
			msg="게시물 수정 성공";
			
		}else if(attachmentList.size()==0) {
			msg="사진을 한장 이상 등록하세요";
		}else {
			msg="게시물 수정 실패";
		}
		
		attachList.clear();   //수정 후 이미지업로드리스트 초기화
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
	}
	
}