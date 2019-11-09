package com.mgr.merry.supUpload.model.service;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mgr.merry.couple.model.vo.Attachment;
import com.mgr.merry.supUpload.model.dao.SupUploadDao;
import com.mgr.merry.supUpload.model.vo.SupUploadImg;
import com.mgr.merry.supporters.model.vo.Supporters;

@Service
public class SupUploadServiceImpl implements SupUploadService {
	
	@Autowired
	SqlSessionTemplate session;
	
	@Autowired
	SupUploadDao dao;
	
	@Override
	public Map<String, String> selectSupUpload(int infoupNum) {
		return dao.selectSupUpload(session, infoupNum);
	}

	@Override
	public SupUploadImg selectSupUploadImg(int infoupNum) {
		return dao.selectSupUploadImg(session, infoupNum);
	}

	@Override
	public int insertSupReview(Map<String, String> param) {
		
		return dao.insertSupUpload(session, param);
	}

	@Override
	public Supporters selectSup(int memberNum) {
		return dao.selectSup(session, memberNum);
	}
	
	@Override
	public void profileUpload(String email, MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("profileUpload");
		UUID uuid = UUID.randomUUID();

		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;

		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);

		String filepath = realFolder + "\\" + email + "\\" + str_filename;
		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		out.println("profileUpload/"+email+"/"+str_filename);
		out.close();
	}

	@Override
	public Supporters selectSupId(String id) {
		return dao.selectSupId(session, id);
	}

	@Override
	public int insertSupUploadImg(Map<String, String> param, List<SupUploadImg> imgList) {
		int result= 0;

		if(imgList.size()>0) {
			for(SupUploadImg supImg : imgList) {
				result = dao.insertSupUploadImg(session, supImg);
			}
		}

		return result;
	}

	@Override
	public int updateSupReview(Map<String, String> param) {
		return dao.updateSupReview(session, param);
	}

	@Override
	public int supRvStatus0(int infoupNum) {
		return dao.supRvStatus0(session, infoupNum);
	}

	@Override
	public int insertSupUploadImgNum(Map<String, String> param, List<SupUploadImg> imgList) {
		int result= 0;
		
		if(imgList.size()>0) {
			for(SupUploadImg supImg : imgList) {
				result = dao.insertSupUploadImgNum(session, supImg);
			}
		}

		return result;
	}



}
