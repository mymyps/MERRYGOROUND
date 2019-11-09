package com.mgr.merry.couple.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mgr.merry.common.PageBarFactory;
import com.mgr.merry.couple.model.service.CoupleBoardService;
import com.mgr.merry.couple.model.vo.Attachment;

@Controller
public class CoupleBoardController {
	
	@Autowired
	CoupleBoardService cservice;
	private static List<Attachment> attachList =new ArrayList();
	
	@RequestMapping("/couple/coupleBoardList")
	public ModelAndView coupleBoardList(@RequestParam("mNum") int mNum,@RequestParam(value="cPage", required=false,defaultValue="0") int cPage) {
		ModelAndView mv = new ModelAndView();
		
		System.out.println("BoardList 컨트롤러!!");
		System.out.println("List에 넘어온 mNum: "+mNum);
		
//		Map<String,Object> param = new HashMap<String,Object>();
//		param.put("mNum", mNum);
//		param.put("cPage", cPage)cPage;
		
		int numPerPage=5;
		List<Map<String,String>> list = cservice.selectCoupleBoardList(mNum,cPage,numPerPage);
		int totalCount = cservice.selectCoupleBoardCount();
		
		mv.addObject("pageBar",PageBarFactory.getPageBar(totalCount, cPage,numPerPage,"/merry/couple/coupleBoardList"));
		mv.addObject("count",totalCount);
		mv.addObject("list",list);
		mv.addObject("mNum",mNum);
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
		String loc = "/couple/coupleBoardList?mNum="+param.get("writer");
		if(result>0) {
			msg="게시물 등록 성공";
			
		}else if(attachList.size()==0) {
			msg="사진을 한장 이상 등록하세요";
			//msg안에 script문과 return false
		}else {
			msg="게시물 등록 실패";
		}
		
		attachList.clear();   //작성후 이미지업로드리스트 초기화
		
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg",msg);
		mv.addObject("loc",loc);
//		mv.addObject("mNum",param.get("writer"));
		mv.setViewName("common/msg");
		
		return mv;
	}
	
	//summernote 이미지파일 저장후 게시판에 쏴주기
	@RequestMapping(value = "summernote_imageUpload.do", method=RequestMethod.POST)
	public void uploadSummernoteImage(MultipartFile image, HttpSession session, HttpServletResponse res) throws Exception{
		String savename = image.getOriginalFilename();
		
		System.out.println(image.getOriginalFilename());
		String path=session.getServletContext().getRealPath("/resources/images/couple");
		System.out.println("path: "+path);
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
        
        
//        res.getWriter().print("/19AM_MERRYGOROUND_final/resources/images/couple/"+reName);
        res.getWriter().print("/merry/resources/images/couple/"+reName);
//        res.getWriter().print(path+"\\"+reName);
        
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
		System.out.println("totalPath: "+totalPath);
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
		int result3 =0;
		
		result3 = cservice.deleteComment(no);
		result2 = cservice.deleteAttachment(no);
		//c_upload테이블을 참조하는 img테이블 레코드부터 삭제
		result = cservice.deleteCoupleBoard(no);
		
		return "redirect:/";
	}
	
	@RequestMapping("/couple/updateCoupleBoard")
	public ModelAndView updateCoupleBoard(@RequestParam("no") int no) {
		ModelAndView mv = new ModelAndView();
		Map<String, String> cboard = cservice.selectCoupleBoard(no);
		
		mv.addObject("cboard",cboard);
//		mv.addObject("couple/updateCoupleBoard");//?????
		mv.setViewName("couple/updateCoupleBoard");
		
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
		String loc = "/couple/coupleBoardList?mNum="+param.get("writerNum");
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
	
	
	@RequestMapping(value="/couple/addComment")
    @ResponseBody
    public String ajax_addComment(@RequestParam Map<String,String> param, HttpServletRequest request) throws Exception{
        
//        HttpSession session = request.getSession();
//        LoginVO loginVO = (LoginVO)session.getAttribute("loginVO");
        
		System.out.println("addComment의 param: "+param);
        try{
        
//            boardVO.setWriter(loginVO.getUser_id());        
            cservice.addComment(param);
            
        } catch (Exception e){
            e.printStackTrace();
        }
        
        return "success";
    }
    
    /**
     * 게시물 댓글 불러오기(Ajax)
     * @param boardVO
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/couple/commentList", produces="application/json; charset=utf8")
    @ResponseBody
    public String ajax_commentList(@RequestParam String coupleNum, HttpServletRequest request) throws Exception{
        
    	System.out.println("commentList cNum: "+coupleNum);
    	
        HttpHeaders responseHeaders = new HttpHeaders();
        ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
        
        // 해당 게시물 댓글
//        List<BoardVO> commentVO = boardServiceImpl.selectBoardCommentByCode(boardVO);
        List<Map<String,String>> comments = cservice.selectCommentList(Integer.parseInt(coupleNum));
        
        System.out.println("불러온 comments : "+comments);
        
        if(comments.size() > 0){
            for(int i=0; i<comments.size(); i++){
                HashMap hm = new HashMap();
//                hm.put("c_code", comments.get(i).getC_code());
//                hm.put("comment", comments.get(i).getComment());
//                hm.put("writer", comments.get(i).getWriter());
                
                hm.put("coupleNum", comments.get(i).get("COUPLENUM"));
                hm.put("comment", comments.get(i).get("COUPLECOMMENT"));
                hm.put("coupleDate", comments.get(i).get("COUPLEDATE"));
                hm.put("membernum", comments.get(i).get("MEMBERNUM"));
                hm.put("writer", comments.get(i).get("ID"));  //작성자 ID나 NAME으로 불러오기
                hm.put("commentNo", comments.get(i).get("COMMENTNO"));
                System.out.println("put하고 hm: "+hm);
                
                hmlist.add(hm);
            }
            
        }
         
        ObjectMapper mapper=new ObjectMapper();
        String data=mapper.writeValueAsString(hmlist);
        return data;
    }
    
    
    //댓글 리스트2    사용안할듯
    @RequestMapping(value = "/couple/getReqlyList", method = RequestMethod.POST)
	public List<Map<String,String>> getReplyList(@RequestParam("coupleNum") int coupleNum) throws Exception {
    	System.out.println("getReqlyList: "+coupleNum);
		return cservice.selectCommentList(coupleNum);

	}
	
    //댓글 삭제
    @RequestMapping(value="/couple/deleteComment")
    @ResponseBody
    public String deleteComment(@RequestParam("commentNo") String commentNo, HttpServletRequest request) throws Exception{
        int result=0;
//        HttpSession session = request.getSession();
//        LoginVO loginVO = (LoginVO)session.getAttribute("loginVO");
        
		System.out.println("deleteComment의 commentNo: "+commentNo);
        try{
        
//            boardVO.setWriter(loginVO.getUser_id());        
            result= cservice.deleteComment(Integer.parseInt(commentNo));
            System.out.println("deleteComment result: "+result);
        } catch (Exception e){
            e.printStackTrace();
        }
        
        return "success";
    }
    
    
//    @RequestMapping(value = "/saveReqly", method = RequestMethod.POST)
//	public Map<String, Object> saveReply(@RequestParam Map<String,String> param) throws Exception {
//		Map<String, Object> result = new HashMap<>();
//		try {
//			cservice.updateComment(param);
//			result.put("status", "OK");
//		} catch (Exception e) {
//			e.printStackTrace();
//			result.put("status", "False");
//		}
//
//		return result;
//	}
    
    
    //댓글 수정
    @RequestMapping(value="/couple/updateComment")
    @ResponseBody
    public String updateComment(@RequestBody Map<String,Object> param, HttpServletRequest request) throws Exception{
        int result=0;
//        HttpSession session = request.getSession();
//        LoginVO loginVO = (LoginVO)session.getAttribute("loginVO");
        
		System.out.println("updateComment의 파라미터: "+param);
        try{
        
//            boardVO.setWriter(loginVO.getUser_id());        
        	result= cservice.updateComment(param);
//            System.out.println("updateComment result: "+result);
        } catch (Exception e){
            e.printStackTrace();
        }
        return "success";
    }
	
	
}
